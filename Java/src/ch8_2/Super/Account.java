package ch8_2.Super;

public class Account {
    private int id;
    private double balance;
    private double annualInterestRate;

    public Account(int id, double balance, double annuallnterestRate) {
        this.id = id;
        this.balance = balance;
        this.annualInterestRate = annuallnterestRate;
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

    public double getAnnuallnterestRate() {
        return annualInterestRate;
    }

    public void setAnnuallnterestRate(double annuallnterestRate) {
        this.annualInterestRate = annuallnterestRate;
    }

    //取款方法
    public void withdraw(double amount) {
        if (amount > balance) {
            System.out.println("余额不足！");
            return;
        } else if (amount <= 0) {
            System.out.println("金额输入有误");
        }
        balance -= amount;
        System.out.println("取款成功");
    }

    //存款方法
    public void deposit(double amount) {
        if (amount <= 0) {
            System.out.println("存款失败");
            return;
        }
        balance += amount;
        System.out.println("存款成功");
    }

    public void showBalance() {
        System.out.println("您的账户余额为：" + getBalance());
    }

    public void showAnnualIintersRate() {
        System.out.println("年利率为：" + getAnnuallnterestRate());
    }

    public void showMonthlyInterest() {
        System.out.println("月利率为：" + getAnnuallnterestRate() / 12);
    }


}