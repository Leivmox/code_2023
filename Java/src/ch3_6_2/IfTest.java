package ch3_6_2;

import java.util.Scanner;

public class IfTest {
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);

        System.out.println("请输入期末成绩:(0~100)");
        int score = scan.nextInt();

        if(score == 100){
            System.out.println("奖励一辆BWM");
        }
        else if(score > 80 && score <99){
            System.out.println("奖励一台iPhone");
        }
        else if(score > 60 && score <80){
            System.out.println("奖励一台iPad");
        }
        else{
            System.out.println("什么奖励也没有");
        }
    }
}