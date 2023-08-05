package ch7_27.a;

public class CustomerTest {
    public static void main(String[] args) {
        Customer cust = new Customer("Jane", "Smith");

        Account acct = new Account(1000, 2000, 0.123);

        cust.setAccount(acct);

        cust.getAccount().deposit(100);
        cust.getAccount().withdraw(960);
        cust.getAccount().withdraw(2000);

        System.out.println("Customer [" + cust.getLastName() + ","
                + cust.getFirsName() + "] has a account: id is"
        + cust.getAccount().getId()  + ",annualInterestRate is " +
                cust.getAccount().getAnnualIntersestRate()*100 + "%,balnce is"
                + cust.getAccount().getBalance());
    }
}
