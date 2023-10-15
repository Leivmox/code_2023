package ch6_20;

public class DemoTest {
    public static void main(String[] args) {
        Demo1 d = new Demo1();


        System.out.println(d.getA());
//        System.out.println(d.setA());
        d.setA(3);

        System.out.println(d.getA());
    }
}
