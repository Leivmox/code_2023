package ch3_9;

import java.util.Scanner;

public class Demo04 {
    public static void main(String[] args) {
        // double score[]
        double[] score = new double[5];
        double total = 0;

//        Scanner s = new Scanner(System.in);
//        System.out.println(s);
//        System.out.println(s.hashCode());
//        System.out.println(System.identityHashCode(score));


        for (int i = 0; i < score.length; i++) {
            Scanner s = new Scanner(System.in);
            System.out.println(s.hashCode());
            System.out.print(String.format("请输入第%d个评委的分数:", i + 1));

            score[i] = s.nextInt();
            System.out.println(String.format("第%d个评委分数是：%.2f", i + 1, score[i]));

            total += score[i];
        }

//        System.out.println(score);
//        System.out.println(score.hashCode());
//        System.out.println(System.identityHashCode(score));
        
        System.out.println(total / 5);
        System.out.println(total / score.length);
        System.out.println(score.length);


    }
}
