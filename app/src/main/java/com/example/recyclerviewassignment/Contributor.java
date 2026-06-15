package com.example.recyclerviewassignment;

public class Contributor {
    private final String name;
    private final int followers;
    private final int contributions;
    private final String location;

    public Contributor(String name, int followers, int contributions, String location) {
        this.name = name;
        this.followers = followers;
        this.contributions = contributions;
        this.location = location;
    }

    public String getName() { return name; }
    public int getFollowers() { return followers; }
    public int getContributions() { return contributions; }
    public String getLocation() { return location; }
}
