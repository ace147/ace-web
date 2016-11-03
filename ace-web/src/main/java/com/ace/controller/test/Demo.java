package com.ace.controller.test;

public class Demo {
    public static void  main(String args[]){
    	String str="fdsafd,fdsafd，fdsafd。,,，，";
    	String str2=str.replace('，', ',');
    	String str3=str2.replace('。','.');
    	System.out.println(str);
    	System.out.println(str2);
    	System.out.println(str3);
    }
}
