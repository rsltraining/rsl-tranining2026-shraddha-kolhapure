package com.example.architecture_component_assignment;

import android.app.Application;
import android.graphics.Color;
import android.os.CountDownTimer;
import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import org.json.JSONArray;
import org.json.JSONObject;

public class MainViewModel extends AndroidViewModel {

    private final MutableLiveData<String> timerText = new MutableLiveData<>("05:00");
    private final MutableLiveData<List<Country>> countriesList = new MutableLiveData<>();
    private final MutableLiveData<Boolean> isLoading = new MutableLiveData<>(false);
    private final MutableLiveData<Integer> backgroundColor = new MutableLiveData<>(Color.WHITE);
    private final MutableLiveData<String> errorMessage = new MutableLiveData<>(null);

    private CountDownTimer countDownTimer;

    public MainViewModel(@NonNull Application application) {
        super(application);
        startTimer();
    }

    public LiveData<String> getTimerText() { return timerText; }
    public LiveData<List<Country>> getCountriesList() { return countriesList; }
    public LiveData<Boolean> getIsLoading() { return isLoading; }
    public LiveData<Integer> getBackgroundColor() { return backgroundColor; }
    public LiveData<String> getErrorMessage() { return errorMessage; }

    private void startTimer() {
        long totalTime = 5 * 60 * 1000;
        countDownTimer = new CountDownTimer(totalTime, 1000) {
            @Override
            public void onTick(long millisUntilFinished) {
                long minutes = (millisUntilFinished / 1000) / 60;
                long seconds = (millisUntilFinished / 1000) % 60;
                timerText.setValue(String.format(Locale.getDefault(), "%02d:%02d", minutes, seconds));
            }

            @Override
            public void onFinish() {
                timerText.setValue("00:00");
            }
        }.start();
    }

    public void fetchCountriesFromNetwork() {
        isLoading.postValue(true);
        new Thread(new Runnable() {
            @Override
            public void run() {
                HttpURLConnection connection = null;
                BufferedReader in = null;
                try {
                    URL url = new URL("https://api.printful.com/countries");
                    connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("GET");
                    connection.setConnectTimeout(8000);
                    connection.setReadTimeout(8000);
                    connection.setUseCaches(false);

                    int responseCode = connection.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                        StringBuilder response = new StringBuilder();
                        String inputLine;

                        while ((inputLine = in.readLine()) != null) {
                            response.append(inputLine);
                        }

                        JSONObject jsonObject = new JSONObject(response.toString());
                        JSONArray jsonArray = jsonObject.getJSONArray("result");
                        List<Country> parsedList = new ArrayList<>();

                        for (int i = 0; i < jsonArray.length(); i++) {
                            JSONObject obj = jsonArray.getJSONObject(i);
                            String name = obj.getString("name");
                            String code = obj.getString("code");
                            parsedList.add(new Country(name, code));
                        }

                        countriesList.postValue(parsedList);
                        isLoading.postValue(false);
                    } else {
                        showError();
                    }
                } catch (Exception e) {
                    showError();
                } finally {
                    try {
                        if (in != null) in.close();
                        if (connection != null) connection.disconnect();
                    } catch (Exception ignored) {}
                }
            }
        }).start();
    }

    private void showError() {
        isLoading.postValue(false);
        errorMessage.postValue("Counties list is unavailable");
    }

    public void clearError() {
        errorMessage.setValue(null);
    }

    public void generateRandomColor() {
        Random random = new Random();
        int color = Color.rgb(random.nextInt(256), random.nextInt(256), random.nextInt(256));
        backgroundColor.setValue(color);
    }

    @Override
    protected void onCleared() {
        super.onCleared();
        if (countDownTimer != null) {
            countDownTimer.cancel();
        }
    }
}