package com.susu.sever;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.JOptionPane;
/**
 * 
 * 由于socket会阻塞进程，如果直接写在主线程中，程序就只能执行socket的功能
 * 使用我另外开启一个线程，单独用来通信
 * 
 * **/
public class ServerListener  extends Thread{
    public void run() {
        try {
            ServerSocket serverSocket = new ServerSocket(9999); //端口
            while(true){
                //每当有一个客服端连接就有一个socket
                Socket socket =  serverSocket.accept();//阻塞
                System.out.println("有客服端链接-------");
                ReceiveSocket cs = new ReceiveSocket(socket);//新线程
                cs.start();         
            }
        } catch (IOException e) {
            e.printStackTrace();
        } 
    }
}
