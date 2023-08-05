package ch8_2.Super;

public class CheckAccount extends Account {

    private int overdraft = 0;

    public CheckAccount(int id, double balance, double annuallnterestRate, int overdraft) {
        super(id, balance, annuallnterestRate);
        this.overdraft = overdraft;
    }

    @Override
    public void withdraw(double amount) {
        if (amount < getBalance()) {
            System.out.println("取款成功");
           setBalance(getBalance() - amount);

        } else if (amount > getBalance()) {
            if (amount - getBalance() < overdraft) {
                overdraft -= (amount - getBalance());
                System.out.println("透支成功");
                setBalance(0);
            } else {
                System.out.println("超过透支额度");
            }
        }
    }

    public int getOverdraft() {
        return overdraft;
    }

    public void setOverdraft(int overdraft) {
        this.overdraft = overdraft;
    }

    public void showoverdraft() {
        System.out.println("您剩余的透支额度为："+ getOverdraft());
    }
}
