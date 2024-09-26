package ru.job4j.serialization.json;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;

import java.io.StringReader;
import java.io.StringWriter;
public class XMLMain {
    public static void main(String[] args) throws Exception {
        Programmer programmer = new Programmer(true, 41, "Slava",
                new Experience("Java", 2), new String[]{"Calculator", "ManWomen Weight"});
        JAXBContext context = JAXBContext.newInstance(Programmer.class);
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
        String xml = "";
        try (StringWriter writer = new StringWriter()) {
            marshaller.marshal(programmer, writer);
            xml = writer.getBuffer().toString();
            System.out.println(xml);
        }
        Unmarshaller unmarshaller = context.createUnmarshaller();
        try (StringReader reader = new StringReader(xml)) {
            Programmer result = (Programmer) unmarshaller.unmarshal(reader);
            System.out.println(result);
        }
    }
}