package ch7_27.a;

public class Customer {
    private String firsName;
    private String lastName;
    private Account account;

    public Customer(String f,String l) {
        this.firsName = f;
        this.lastName = l;
    }

    public String getFirsName() {
        return firsName;
    }

    public String getLastName() {
        return lastName;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account a) {
        this.account = a;
    }
}

