package ch8_5.OrderTest;

import org.junit.Test;

public class OrderTest {
    //    public static void main(String[] args) {
//        Order O1 = new Order(1, "Tom");
//        Order O2 = new Order(1, "Tom");
//
//
//        System.out.println(O1.equals(O2));;
//    }
    Order O1 = new Order(10, "Tom");
    Order O2 = new Order(10, "Tom");

    @Test
    public void testEquals() {
        System.out.println(O1.equals(O2));

    }



}
