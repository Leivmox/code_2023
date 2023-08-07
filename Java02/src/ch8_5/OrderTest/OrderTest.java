package ch8_5.OrderTest;

public class OrderTest {
    public static void main(String[] args) {
        Order O1 = new Order(1, "Tom");
        Order O2 = new Order(1, "Tom");


        System.out.println(O1.equals(O2));;
    }
}
