package com.example.fragmentassignment;

import static androidx.core.content.ContentProviderCompat.requireContext;

import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

public class BatteryFragment extends Fragment {

    private TextView txtBattery;

    public BatteryFragment() {
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_battery, container, false);

        txtBattery = view.findViewById(R.id.txtBtry);

        IntentFilter filter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);

        Intent batteryStatus = requireContext().registerReceiver(null, filter);

        int level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);

        int scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1);

        float batteryPct = level * 100 / (float) scale;

        txtBattery.setText(
                "Battery : " + (int) batteryPct + "%");

        return view;
    }
}