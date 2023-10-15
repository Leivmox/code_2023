package ch03;

// 通过get方法和set方法，把设置和获取属性的功能封锁到方法里面
// set方法和get方法的快捷方式

class Student01 {
    // private 私有
    private String name;  //姓名属性
    private String gender;  //性别属性
    private int age;   //年龄属性


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    //    public String getName() {     //设置name的get方法
//        return name;
//    }
//
//    public void setName(String name) {    //设置name的set方法
//        // 这个this代表 本对象
//        // 没有的话，直接变成name = name, 降低了可阅读性
//        this.name = name;
//    }
//
//    public String getGender() {    //设置gender的get方法
//        return gender;
//    }
//
//    public void setGender(String gender) {  //设置gender的set方法
//        this.gender = gender;
//    }
//
//    public int getAge() {    //设置age的get方法
//        return age;
//    }
//
//    public void setAge(int age) {   //设置age的set方法
//        this.age = age;
//    }

    //方法
    public void showInfo() {
        System.out.println(name + "," + gender + "," + age);
    }
}

public class Demo2 {
    public static void main(String[] args) {
        Student01 student = new Student01();
//        student.name = "刘德华";
        student.setName("张学友");
        System.out.println(student.getName());

//        student.setName("zhangsan");
//        student.setAge(200);
//        student.setGender("雌");
//        System.out.println(student.getName() + "," + student.getAge() + "," + student.getGender());




    }
}