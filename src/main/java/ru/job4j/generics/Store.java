package ru.job4j.generics;

import ru.job4j.generics.Base;

public interface Store<T extends Base> {

    void add(T model);

    boolean replace(String id, T model);

    void delete(String id);

    T findById(String id);
}