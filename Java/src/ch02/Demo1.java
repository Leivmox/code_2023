package ch02;



//第二步，写一个测试类
public class Demo1 {
    public static void main(String[] args) {
        // 2、创建对象
        Student student = new Student();
        // 3、驱动对象干活
        student.name = "张三";   //设置对象的属性
        student.gender = "男";
        student.age = 20;
        student.showInfo(); //调用对象的方法

        System.out.println(student);
        System.out.println(student.hashCode());
        System.out.println(System.identityHashCode(student));

    }
}



