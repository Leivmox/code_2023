package ch02;





public class Demo2 {
    public static void main(String[] args) {
//       1. 值类型
        int num1 = 10;
        // num2 和num1是指向同一个内存地址
        int num2 = num1;
        // 这时num2指向了新的内存地址
        num2 = 100;
        // int num1 = 10 这样定义，10 是出现在内存常量池里面
        // 所以num3=10，不会再开辟内存空间，会看到num3的内存地址和num1是一样的
        int num3 = 10;

        System.out.println(num1);
        System.out.println(num2);
        System.out.println(num3);
        System.out.println(System.identityHashCode(num1));
        System.out.println(System.identityHashCode(num2));
        System.out.println(System.identityHashCode(num3));
        System.out.println("-------------------");

//        2.引用类型
        Student student1 = new Student();
        student1.name = "zhangsan";
        // stu2和stu1是同一个内存地址，所以改了其中一个的属性，另外一个属性也会改变
        Student student2 = student1;
        System.out.println(System.identityHashCode(student1));
        System.out.println(System.identityHashCode(student2));

        System.out.println(student1);
        System.out.println(student2);

        student2.name = "lisi";
        System.out.println(student1.name);
        System.out.println(student2.name);

    }
}