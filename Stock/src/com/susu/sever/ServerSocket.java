package com.susu.sever;
/**
 * 
 * 程序入口
 * 
 * **/
public class ServerSocket {

    public static void main(String[] args) {
             new ServerListener().start(); //建立实时监听客服端
    }
    
}