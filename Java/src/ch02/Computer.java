package ch02;


public class Computer {
    int num1;
    int num2;
    String name;

    public int add() {
        int result = 0;
        result = num1 + num2;
        return result;
    }



    public static void main(String[] args) {
        Computer c = new Computer();
        System.out.println(c.num1);
        System.out.println(c.num2);


        c.num1 = 100;
        c.num2 = 200;

        System.out.println(c.add());



    }

}