package ch02;


public class Demo4 {
    public static void main(String[] args) {
        Student stu = new Student();
        stu.name = "zhangsan";
        stu.age = 20;
        // stu 是一个对象，相当于传进来是一个地址
        // 要求修改这个地址的值，那么结果就会改变
        modify(stu);
        System.out.println(stu.name + "," + stu.age);
    }

    public static void modify(Student stu) {
        stu.name = "lisi";
        stu.age = 30;
    }
}