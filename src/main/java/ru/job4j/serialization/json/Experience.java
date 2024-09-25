package ru.job4j.serialization.json;

public class Experience {
    private final String language;
    private final int time;

    public Experience(String language, int time) {
        this.language = language;
        this.time = time;
    }

    @Override
    public String toString() {
        return "Experience{"
                + "language='" + language + '\''
                + ", time=" + time
                + '}';
    }
}
