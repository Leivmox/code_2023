package ch8_2.Super;

import java.util.Queue;

public class AccountTest {
    public static void main(String[] args) {
        Account a = new Account(1122, 20000, 0.045);

        a.withdraw(30000);
        a.showBalance();

        a.withdraw(2500);
        a.deposit(3000);
        a.showMonthlyInterest();

        System.out.println("========================");

        CheckAccount b = new CheckAccount(1122, 20000, 0.045, 5000);

        b.withdraw(5000);
        b.showBalance();
        b.showoverdraft();

        b.withdraw(18000);
        b.showBalance();
        b.showoverdraft();

        b.withdraw(3000);
        b.showBalance();
        b.showoverdraft();
    }
}