package com.example.recyclerviewassignment;

import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private RecyclerView recyclerView;
    private List<Contributor> contributorList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        recyclerView = findViewById(R.id.recyclerView);

        loadJsonData();

        DisplayMetrics metrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(metrics);
        int screenHeight = metrics.heightPixels;

        GridLayoutManager layoutManager = new GridLayoutManager(this, 1);
        recyclerView.setLayoutManager(layoutManager);

        DividerItemDecoration divider = new DividerItemDecoration(this, layoutManager.getOrientation());
        recyclerView.addItemDecoration(divider);

        ContributorAdapter adapter = new ContributorAdapter(contributorList, screenHeight);
        recyclerView.setAdapter(adapter);
    }

    private void loadJsonData() {
        contributorList = new ArrayList<>();
        StringBuilder builder = new StringBuilder();

        try {
            InputStream is = getResources().openRawResource(R.raw.github_users);
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
            String line;
            while ((line = reader.readLine()) != null) {
                builder.append(line);
            }
            reader.close();

            JSONArray jsonArray = new JSONArray(builder.toString());
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject obj = jsonArray.getJSONObject(i);

                String name = obj.optString("name", "").trim();
                if (name.isEmpty()) {
                    name = obj.optString("login", "Anonymous User");
                }

                int followers = obj.optInt("followers", 0);
                int contributions = obj.optInt("contributions", 0);

                String location = obj.optString("location", "").trim();
                if (location.isEmpty()) {
                    location = "Not Specified";
                }

                contributorList.add(new Contributor(name, followers, contributions, location));
            }
        } catch (Exception e) {
            Log.e("MainActivity", "Error loading json", e);
        }
    }
}