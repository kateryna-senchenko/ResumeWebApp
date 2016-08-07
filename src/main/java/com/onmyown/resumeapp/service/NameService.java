package com.onmyown.resumeapp.service;


public class NameService {

    private static final NameService nameService = new NameService();

    private NameService(){}

    public static NameService getInstance(){
        return nameService;
    }

    public String convertName(String name){
        return name.toUpperCase();
    }
}
