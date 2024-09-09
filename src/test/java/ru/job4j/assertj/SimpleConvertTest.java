package ru.job4j.assertj;

import org.assertj.core.data.Index;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;

class SimpleConvertTest {
    @Test
    void checkArray() {
        SimpleConvert simpleConvert = new SimpleConvert();
        String[] array = simpleConvert.toArray("first", "second", "three", "four", "five");
        assertThat(array).hasSize(5)
                .contains("second")
                .contains("first", Index.atIndex(0))
                .containsAnyOf("zero", "second", "six")
                .doesNotContain("first", Index.atIndex(1));
    }

    @Test
    void checkList() {
        SimpleConvert simpleConvert = new SimpleConvert();
        List<String> list = simpleConvert.toList("first", "second", "three");
        assertThat(list).hasSize(3)
                .contains("first", "second")
                .containsExactly("first", "second", "three")
                .doesNotContain("first", Index.atIndex(1));
    }

    @Test
    void checkSet() {
        SimpleConvert simpleConvert = new SimpleConvert();
        Set<String> colors = simpleConvert.toSet("black", "white", "red");
        assertThat(colors).hasSize(3)
                .containsAnyOf("black", "blue", "green")
                .isNotEmpty();
    }

    @Test
    void checkMap() {
        Map<String, Integer> map = Map.of(
                "1", 1, "2", 2);
        assertThat(map).hasSize(2)
                .containsKeys("1")
                .containsValues(1, 2)
                .doesNotContainKey("0")
                .doesNotContainValue(0)
                .containsEntry("2", 2);
    }
}
