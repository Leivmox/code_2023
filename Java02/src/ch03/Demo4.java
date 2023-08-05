package ch03;


class Student03{
    //Student的成员属性age和name
    private int age;
    private String name;

    public Student03(int age, String name) {
        this.age = age;
        this.name = name;
    }
// Person的构造方法，拥有参数列表
//    Student03 (int a, String nm) {
//        // 接受到创建对象时传递进来的值，将值赋给成员属性
//        age= a;
//        name = nm;
//    }

    public void speak() {
        System.out.println("name=" + name + ",age=" + age);
    }
}

class Demo4 {
    public static void main(String[] args) {
        // 创建Person对象，并明确对象的年龄和姓名
        Student03  student = new Student03(23, "张三");
        student.speak();
    }
}