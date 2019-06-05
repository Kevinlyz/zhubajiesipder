package com.mbyte.easy.admin.www;

/**
 * @Author: wqy
 * @Date: 2019-06-05 10:24
 * @Version 1.0
 */
public class Subb  extends Base{
    public int status;

    Subb(int status){
        super(status-1);
        System.out.println("执行了 super(status-1)，status = " + this.status);
        this.status = status;
        System.out.println("执行了 this.status = status，status = " + this.status);
    }

    public void printSubb(){
        System.out.println("sub");
        System.out.println("status=" + status);
    }

    public void printBase(){
        super.print();
        System.out.println("status=" + super.status);
    }

    public static void main(String[] args) {
        Subb subb = new Subb(2);
        System.out.println("执行了 Subb subb = new Subb(2)，status = " + subb.status);
        subb.printBase();
        subb.printSubb();
    }

}
