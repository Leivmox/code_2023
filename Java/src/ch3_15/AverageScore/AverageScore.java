package ch3_15.AverageScore;

import java.util.Scanner;

public class AverageScore {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int numStudents = 5;
        int sum = 0;
        for (int i = 1; i <= numStudents; i++) {
            System.out.print("请输入第" + i + "个学生的分数：");
            int score = scanner.nextInt();
            sum += score;
        }
        double average = sum * 1.0 / numStudents;
        System.out.println("5个学生的平均分是：" + average);
    }
}
