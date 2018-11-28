package com.gm.common.service;

public interface Function<T, E> {

    public T callback(E e);

}
