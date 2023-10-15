package ch8_4.Test2;

public class InstanceTest {
    public static void main(String[] args) {

        InstanceTest t = new InstanceTest();
        t.method(new Person());
        System.out.println("=============");
        t.method(new Student());
        System.out.println("=============");
        t.method(new Graduate());

    }

    void method(Person e) {
        System.out.println(e.getInfo());;
        System.out.println("--------");
//        if (e instanceof Person) {
//            System.out.println("a person");
//        } else if (e instanceof Student) {
//            System.out.println("a student");
//            System.out.println("a person");
//        } else {
//            System.out.println("a graduated student");
//            System.out.println("a student");
//            System.out.println("a person");
//        }
        if (e instanceof Graduate) {
            System.out.println("a graduated student");
            System.out.println("a student");
            System.out.println("a person");
        } else if (e instanceof Student) {
            System.out.println("a student");
            System.out.println("a person");
        } else {
            System.out.println("a person");
        }
    }
}
