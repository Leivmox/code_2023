package ch03;


class Student02 {

    private String name;  //姓名属性
    private String gender;  //性别属性
    private int age;   //年龄属性


    public String getName() {     //设置name的get方法
        return name;
    }

    public void setName(String name) {    //设置name的set方法
        // 这个this代表 本对象
        // 没有的话，直接变成name = name, 降低了可阅读性
        this.name = name;
    }

    public String getGender() {    //设置gender的get方法
        return gender;
    }


    public int getAge() {    //设置age的get方法
        return age;
    }


    void setAge(int age) {   //设置age的set方法
        //当设置的年龄值小于0或者大于150，我们将年龄设置为18，否则为设置年龄值。
        if (age < 0 || age > 150) {
            this.age = 18;
            return;   // 用return 结束函数
        }
        this.age = age;
    }

    void setGender(String gender) {  //设置gender的set方法
//        if(!"男".equals(gender) || !"女".equals(gender)){
//            // 如果输入的是女
//            // "男".equals(gender) -> false     !false -> true
//            // "女".equals(gender) -> true      !true -> false
//            // true || false   -> true
//            // 结果就是走上面   最后输入女  反而得到男
//            this.gender = "男";
//        } else {
//            this.gender = gender;
//        }

        // 非男  && 非女
        if (!gender.equals("男") && !gender.equals("女")) {
            this.gender = "未知";
        } else {
            this.gender = gender;
        }
    }


    //方法
    public void showInfo() {
        System.out.println(name + "," + gender + "," + age);
    }
}


public class Demo3 {
    public static void main(String[] args) {
        Student02 student = new Student02();
        student.setName("zhangsan");
        student.setAge(200);
        student.setGender("女");
        System.out.println(student.getName() + "," + student.getAge() + "," + student.getGender());
    }
}