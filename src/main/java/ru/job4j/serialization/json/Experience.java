package ru.job4j.serialization.json;

import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "experience")
public class Experience {
    @XmlAttribute
    private String language;
    @XmlAttribute
    private int time;

    public Experience() {
    }

    public Experience(String language, int time) {
        this.language = language;
        this.time = time;
    }

    public String getLanguage() {
        return language;
    }

    public int getTime() {
        return time;
    }

    @Override
    public String toString() {
        return "Experience{"
                + "language='" + language + '\''
                + ", time=" + time
                + '}';
    }
}
