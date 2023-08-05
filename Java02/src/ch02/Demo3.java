package ch02;



public class Demo3 {
    public static void main(String[] args) {
        // num1是成员变量
        int num1 = 10;
        // 这里num1是参数，也就是局部变量
        // 局部变量的改变不能影响到外面的变量，虽然起的名字是一样的
        modify(num1);
        System.out.println(num1);
    }


    public static void modify(int num1) {
        // 局部变量
        num1 = 2000;
        System.out.println(num1);
    }

}