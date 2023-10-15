package ch3_7;

import java.util.Random;
import java.util.Scanner;

public class GuessNumber {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Random rand = new Random();
        int numberToGuess = rand.nextInt(100) + 1;
        int numberOfTries = 0;
        boolean win = false;

        System.out.println("欢迎来玩猜数字游戏！");
        System.out.println("猜的数字范围是1到100，请开始猜数吧！");

        while (!win) {
            int guess = input.nextInt();
            numberOfTries++;

            if (guess == numberToGuess) {
                System.out.println("恭喜你，猜中了！");
                System.out.println("你一共猜了" + numberOfTries + "次");
                win = true;
            } else if (guess < numberToGuess) {
                System.out.println("你猜的数字太小了，请继续猜！");
            } else if (guess > numberToGuess) {
                System.out.println("你猜的数字太大了，请继续猜！");
            }
        }
    }
}