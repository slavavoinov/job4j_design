package ru.job4j.serialization.json;
import java.util.Arrays;
import java.util.Objects;
public class Programmer {
    private final boolean education;
    private final int age;
    private final String name;
    private  final Experience experience;
    private final String[] projects;

    public Programmer(boolean education, int age,
                      String name, Experience experience, String[] projects) {
        this.education = education;
        this.age = age;
        this.name = name;
        this.experience = experience;
        this.projects = projects;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Programmer that)) {
            return false;
        }
        return education == that.education && age == that.age && Objects.equals(name, that.name)
                && Objects.equals(experience, that.experience) && Objects.deepEquals(projects, that.projects);
    }

    @Override
    public int hashCode() {
        return Objects.hash(education, age, name, experience, Arrays.hashCode(projects));
    }

    @Override
    public String toString() {
        return "Programmer{"
                + "education=" + education
                + ", age=" + age
                + ", name='" + name + '\''
                + ", experience=" + experience
                + ", projects=" + Arrays.toString(projects)
                + '}';
    }
}
