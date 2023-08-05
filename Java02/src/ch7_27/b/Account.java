package ch7_27.b;

public class Account {
    private double balance;

    public Account(double init_double) {
        this.balance = init_double;
    }

    public Account() {
    }

    public double getBalance() {
        return balance;
    }

    //存钱
    public void deposit(double amt) {
        if (amt > 0) {
            balance += amt;
            System.out.println("存钱成功");
        }
    }

    public void withdraw(double amt) {
        if (balance < amt) {
            System.out.println("余额不足，取钱失败");
            return;
        }
        balance -= amt;
        System.out.println("取钱成功");
    }
}
