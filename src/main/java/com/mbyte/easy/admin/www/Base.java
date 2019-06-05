package com.mbyte.easy.admin.www;

/**
 * @Author: wqy
 * @Date: 2019-06-05 10:20
 * @Version 1.0
 */
public class Base {
    public int status = 0;
    Base(int status){
        this.status = status;
        System.out.println("执行完父类的构造方法后的status=" + this.status);
    }

    public void print(){
        System.out.println("base");
    }
}
