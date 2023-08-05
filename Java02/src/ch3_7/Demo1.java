package ch3_7;

public class Demo1 {
    public static void main(String[] args) {
        int sum = 0;
        for(int i = 1;i <= 100;i++){
            sum += i;
        }
        System.out.println(String.format("1+2...+100=%d",sum));
        System.out.println("1+2+3...+100=" + sum);

        double x = 3.14;
        System.out.println(String.format("%.2f",x));
    }
}
