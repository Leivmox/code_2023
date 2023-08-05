package ch7_27.a;

public class Account {
    private int id;
    private double balance;
    private double annualIntersestRate;

    public Account(int id, double balance, double annualIntersestRate) {
        this.id = id;
        this.balance = balance;
        this.annualIntersestRate = annualIntersestRate;
    }

    public Account() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getBalance() {
        return balance;

    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public double getAnnualIntersestRate() {
        return annualIntersestRate;
    }

    public void setAnnualIntersestRate(double annualIntersestRate) {
        this.annualIntersestRate = annualIntersestRate;
    }

    public void withdraw(double amount) {//取钱
        if (balance < amount) {
            System.out.println("余额不足，取款失败");
            return;
        }
        balance -= amount;
        System.out.println("成功取出:" + amount);
    }

    public void deposit(double amount) {//存钱
        if (amount > 0) {
            System.out.println("成功存入:" + amount);

        }
    }
}
