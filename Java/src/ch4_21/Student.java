package ch4_21;

public class Student {

    int number;//学号
    int state;//年级
    int score;//成绩

    public String info(){
        return "学号:" + number + "，年级：" + state + ",成绩：" + score;
    }
}
