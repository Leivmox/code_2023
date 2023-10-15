package ch8_1.Override;

public class ManKind {

    private int sex;	//性别
    private int salary;	//薪资

    public ManKind() {

        }


    public void manOrWoman(){
        if(sex==1){
            System.out.println("man");
        }else if(sex==0){
            System.out.println("woman");
        }
    }

    public void employeed(){
        if(salary==0){
            System.out.println("no job");
        }else if(salary!=0){
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
