package com.example.fragment_part2;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity
        implements User1Fragment.MessageSender{
    private User1Fragment user1Fragment;
    private User2Fragment user2Fragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (savedInstanceState == null) {
            user1Fragment = new User1Fragment();
            user2Fragment = new User2Fragment();

            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.user1Container, user1Fragment, "USER1")
                    .replace(R.id.user2Container, user2Fragment, "USER2")
                    .commit();
        }
    }

    @Override
    public void sendToUser2(String message) {
        User2Fragment fragment = (User2Fragment) getSupportFragmentManager().findFragmentByTag("USER2");

        if (fragment != null) {
            fragment.receiveMessage(message);
        }
    }

    @Override
    public void sendToUser1(String message) {

        User1Fragment fragment = (User1Fragment) getSupportFragmentManager().findFragmentByTag("USER1");

        if (fragment != null) {
            fragment.receiveMessage(message);
        }
    }
}