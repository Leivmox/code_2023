package ch7_27.b;

public class BankTest {
    public static void main(String[] args) {
        Bank bank = new Bank();//new银行

        //new新客户
        bank.addCustomer("Jane", "Smith");

        //new该客户的新账户，初始余额为2000
        bank.getCustomer(0).setAccount(new Account(2000));

        //取钱500
        bank.getCustomer(0).getAccount().withdraw(500);

        //输出该用户的账号余额
        double balance = bank.getCustomer(0).getAccount().getBalance();
        System.out.println("客户："+ bank.getCustomer(0).getFirstName()
                + " " +bank.getCustomer(0).getLastName() +
                "的余额为: "+ balance);

    }
}
