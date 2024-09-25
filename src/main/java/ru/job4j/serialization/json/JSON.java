package ru.job4j.serialization.json;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JSON {

    public static void main(String[] args) {
        final Programmer programmer = new Programmer(true, 41, "Slava",
                new Experience("Java", 2), new String[]{"Calculator", "ManWomen Weight"});
        final Gson gson = new GsonBuilder().create();
        System.out.println(gson.toJson(programmer));
        final Programmer programmerFromJSON = gson.fromJson(gson.toJson(programmer), Programmer.class);
        System.out.println(programmerFromJSON);
    }
}
