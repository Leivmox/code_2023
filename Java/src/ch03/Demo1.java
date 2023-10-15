package ch03;

import java.util.Objects;

class Student {
    // 属性->变量
    String name;  //姓名属性
    String gender;  //性别属性
    int age;   //年龄属性

    // 方法->函数
    public void showInfo() {
        System.out.println(name + "," + gender + "," + age);
    }


}

public class Demo1 {

    public static void main(String[] args) {
        Student student = new Student();
        student.name = "张三";
        student.age = 200;
        student.gender = "雌";
        System.out.println(student.name + "," + student.age + "," + student.gender);





//        Student student = new Student();
//        Student student1 = new Student();
//        System.out.println(student == student1);
//        System.out.println(student.equals(student1));

    }
}