package ch8_12.Test;

import org.junit.Test;

public class CalculatorTest {
    private Calculator calculator = new Calculator();

    @Test
    public void add() {
        System.out.println(calculator.add(2, 3));
    }

    @Test
    public void aaa() {
        int a = 10;

        Integer a2 = a;

        boolean b0 = true;
        Boolean b1 = b0;

        System.out.println(a2.toString());
    }
}