package ch3_15.Sum1to100;

public class Sum1to100 {
    public static void main(String[] args) {
        int sum = 0;
        for (int i = 1; i <= 100; i++) {
            sum += i;
        }
        System.out.println("1+2+…+100的结果为：" + sum);
    }
}