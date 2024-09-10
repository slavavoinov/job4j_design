package ru.job4j.assertj;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class NameLoadTest {
    @Test
    void checkEmpty() {
        NameLoad nameLoad = new NameLoad();
        assertThatThrownBy(nameLoad::getMap)
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("no data");
    }

    @Test
    void checkNotContainEqual() {
        NameLoad nameLoad = new NameLoad();
        String word = "key:value";
        assertThatThrownBy(() -> nameLoad.parse(word))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining(word)
                .hasMessageContaining("does not contain the symbol '='");
    }

    @Test
    void checkKey() {
        NameLoad nameLoad = new NameLoad();
        String word = "=value";
        assertThatThrownBy(() -> nameLoad.parse(word))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining(word)
                .hasMessageContaining("does not contain a key");
    }

    @Test
    void checkValue() {
        NameLoad nameLoad = new NameLoad();
        String word = "key=";
        assertThatThrownBy(() -> nameLoad.parse(word))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining(word)
                .hasMessageContaining("does not contain a value");
    }

    @Test
    void checkLength() {
        NameLoad nameLoad = new NameLoad();
        assertThatThrownBy(nameLoad::parse)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("array is empty");
    }
}
