package ch3_7;

import java.util.Random;
import java.util.Scanner;

public class GuessNumberGame {
public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Random rand = new Random();
        boolean playAgain = true;

        while (playAgain) {
            System.out.println("#================================#");
            System.out.println("| 猜数字游戏 |");
            System.out.println("#================================#");
            System.out.println("| 1. 开始游戏 |");
            System.out.println("| 2. 结束游戏 |");
            System.out.println("#================================#");
            System.out.print("请选择：");

            int choice = input.nextInt();
            while (choice != 1 && choice != 2) {
                System.out.print("请输入正确的选项：");
                choice = input.nextInt();
            }

            if (choice == 2) {
                playAgain = false;
            } else {
                int numberToGuess = rand.nextInt(100) + 1;
                int numberOfTries = 0;
                boolean win = false;

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

                System.out.print("是否重新开始游戏？(Y/N): ");
                String playAgainChoice = input.next();

                while (!playAgainChoice.equalsIgnoreCase("Y") && !playAgainChoice.equalsIgnoreCase("N")) {
                    System.out.print("请输入正确的选项(Y/N): ");
                    playAgainChoice = input.next();
                }

                if (playAgainChoice.equalsIgnoreCase("N")) {
                    playAgain = false;
                }
            }
        }
    }
}