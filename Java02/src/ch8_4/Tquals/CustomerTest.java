package ch8_4.Tquals;

import java.util.Objects;

public class CustomerTest {
//OverrideMethods
public static void main(String[] args) {
    Customer c1 = new Customer("Tom", 20);
    Customer c2 = new Customer("Tom", 20);

    System.out.println(c1.equals(c2));
}



}
