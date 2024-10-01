package ru.job4j.serialization.json;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.annotation.*;

import java.util.Arrays;
import java.io.StringWriter;
import java.util.Objects;

@XmlRootElement(name = "programmer")
@XmlAccessorType(XmlAccessType.FIELD)
public class Programmer {
    @XmlAttribute
    private boolean education;
    @XmlAttribute
    private int age;
    @XmlAttribute
    private String name;
    @XmlElement
    private  Experience experience;
    @XmlElementWrapper
    @XmlElement(name = "projects")
    private String[] projects;

    public Programmer() {
    }

    public Programmer(boolean education, int age,
                      String name, Experience experience, String[] projects) {
        this.education = education;
        this.age = age;
        this.name = name;
        this.experience = experience;
        this.projects = projects;
    }

    public boolean isEducation() {
        return education;
    }

    public int getAge() {
        return age;
    }

    public String getName() {
        return name;
    }

    public Experience getExperience() {
        return experience;
    }

    public String[] getProjects() {
        return projects;
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

    public static void main(String[] args) throws JAXBException {
        final Programmer programmer = new Programmer(true, 41, "Ilon Mask",
                new Experience("PHP", 2), new String[]{"Calories calculator", "ManWomen Weight"});
        JAXBContext context = JAXBContext.newInstance(Programmer.class);
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
        try (StringWriter writer = new StringWriter()) {
            marshaller.marshal(programmer, writer);
            String result = writer.getBuffer().toString();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
