package ch8_7.Test9;


public class CircleTest {
    public static void main(String[] args) {
        Circle C1 = new Circle("Tom",10,10);
        Circle C2 = new Circle("Tom",10,10);

        System.out.println(C1.getColor().equals(C2.getColor()));
        System.out.println(C1.equals(C2));
        System.out.println(C1 + "\n" + C2);
    }
}
