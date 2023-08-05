package ch03;


/**
 * 可以有几个构造方法
 * 如果没有构造方法，那么会默认调用无参构造方法
 * 一旦加入了构造方法，那么无参构造方法也得写上，否则就不能用无参构造方法
 *
 */
class Student04 {
    private int age;
    private String name;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // 无参构造方法
    public Student04() {
    }
    // 两个参数构造方法
    public Student04(String name, int age) {
        this.age = age;
        this.name = name;
    }
    // 一个参数构造方法
    public Student04(String name) {
        this.name = name;
    }

    // 一个参数构造方法
    public Student04(int age) {
        this.age = age;
    }

    //    Student04() {
//    }
//
//    Student04(String nm) {
//        name = nm;
//    }
//
//    Student04(String nm, int a) {
//        this(nm);
//        age = a;
//    }
}

class Demo5 {
    public static void main(String[] args) {
        Student04 s1 = new Student04("张三", 23);
        System.out.println(s1.getName());


        Student04 s2 = new Student04();
        System.out.println(s2.getName());


        Student04 student04 = new Student04(20);


    }
}