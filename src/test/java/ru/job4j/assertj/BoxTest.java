package ru.job4j.assertj;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.withPrecision;

class BoxTest {
    @Test
    void isThisSphere() {
        Box box = new Box(0, 10);
        String name = box.whatsThis();
        assertThat(name).isEqualTo("Sphere")
                .isNotEmpty()
                .contains("Sp")
                .startsWith("Sp")
                .doesNotContain("javascript");
    }

    @Test
    void isThisTetrahedron() {
        Box box = new Box(4, 6);
        String name = box.whatsThis();
        assertThat(name).isEqualTo("Tetrahedron")
                .isNotEmpty()
                .contains("Tetra")
                .startsWith("T")
                .doesNotContain("javascript");
    }

    @Test
    void isThisCube() {
        Box box = new Box(8, 12);
        String name = box.whatsThis();
        assertThat(name).isEqualTo("Cube")
                .isNotEmpty()
                .contains("Cu")
                .startsWith("C")
                .doesNotContain("javascript");
    }

    @Test
    void isThisFour() {
        Box box = new Box(4, 6);
        int result = box.getNumberOfVertices();
        assertThat(result).isEqualTo(4)
                .isNotZero()
                .isPositive()
                .isEven()
                .isGreaterThan(1)
                .isLessThan(10);
    }

    @Test
    void isThisEight() {
        Box box = new Box(8, 12);
        int result = box.getNumberOfVertices();
        assertThat(result).isEqualTo(8)
                .isNotZero()
                .isPositive()
                .isEven()
                .isGreaterThan(1)
                .isLessThan(10);
    }

    @Test
    void checkExistCube() {
        Box box = new Box(8, 12);
        boolean result = box.isExist();
        assertThat(result).isTrue();
    }

    @Test
    void checkExistTetrahedron() {
        Box box = new Box(4, 6);
        boolean result = box.isExist();
        assertThat(result).isTrue();
    }

    @Test
    void CheckAreaTetrahedron() {
        Box box = new Box(4, 6);
        double result = box.getArea();
        assertThat(result).isEqualTo(62.36d, withPrecision(0.05d))
                .isCloseTo(62.35d, withPrecision(0.01d))
                .isGreaterThan(62.3d)
                .isLessThan(62.4d);
    }

    @Test
    void CheckAreaCube() {
        Box box = new Box(8, 12);
        double result = box.getArea();
        assertThat(result).isEqualTo(863.99d, withPrecision(0.05d))
                .isCloseTo(864d, withPrecision(0.01d))
                .isGreaterThan(863.01)
                .isLessThan(864.99);
    }
}