package ts;


class Student {
    int id;
    String name;
    String gender;

    public void show(){
        System.out.println(this.id + "-" + this.name + "-" + this.gender);
    }

    public Student(int id, String name, String gender) {
        this.id = id;
        this.name = name;
        this.gender = gender;
    }
}



public class HanshuTest {
    // 函数的参数是基本数据类型
    public static void add(int a, int b){
        System.out.println(a + b);
    }


    // 函数的参数是引用数据类型，这里的参数是一个Student类的对象
    public static void info(Student s){
        // s 形式参数   形参
        System.out.println(s.id);
        System.out.println(s.name);
        System.out.println(s.gender);
        s.show();
    }

    public static void main(String[] args) {
        add(10, 10);

        Student student = new Student(101, "刘德华", "男");
        // 函数参数是引用数据类型
        // 这里对象当做函数的参数
        // student 实参 实际参数
        info(student);

    }
}
