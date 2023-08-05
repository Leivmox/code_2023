package extends_test;

import com.sun.security.jgss.GSSUtil;

public class ManKind {
    public ManKind() {
    }

    public ManKind(int sex, int salary) {
        this.sex = sex;
        this.salary = salary;
    }

    //    int sex;
//    int salary;
    private int sex;
    private int salary;


    public void manOrWoman() {
        if (sex == 1) {
            System.out.println("man");
        } else if (sex == 0) {
            System.out.println("woman");
        }
    }

    public void employeed() {
        if (salary == 0) {
            System.out.println("no job");
        } else if (salary != 0) {
            System.out.println("job");
        }
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }
}

