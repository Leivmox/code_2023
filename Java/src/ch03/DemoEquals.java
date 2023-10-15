package ch03;

import java.util.Objects;
import java.util.Scanner;

class Stu {
    int id;
    String name;

    public Stu(int id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        // 对比本对象和传进来的对象，是不是同一个对象，是的话直接返回true
        if (this == o) return true;
        // 注意这里也是if，代表开始新的判断
        // 比较传进来的对象是不是空对象，或者本对象和传进来的对象不是同一个类的话，直接返回false
        if (o == null || getClass() != o.getClass()) return false;
        // 强制数据类型转换，把传进来的对象强制转换成同一个数据类型
        Stu stu = (Stu) o;
        // 强转数据类型之后，对比对象里面的每个属性，注意这里是&&“与”计算，如果都相等，返回true，否则false
        return id == stu.id & Objects.equals(name, stu.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }
}

public class DemoEquals {
    public static void main(String[] args) {
        Stu stu1 = new Stu(1001, "刘德华");
        Stu stu2 = new Stu(1001, "刘德华");
        System.out.println(stu1 == stu2);
        System.out.println(stu1.equals(stu2));

        String s = "男";  // 字符串“男”是在常量池中
        System.out.println(s.equals("男"));
        System.out.println(s == "男");
        System.out.println(System.identityHashCode(s));
        System.out.println(System.identityHashCode("男"));

        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入一个男字:");
        String s1 = scanner.nextLine();  //外面输入一个男字

        System.out.println(s1.equals("男"));
        System.out.println(s1 == "男");
        System.out.println(System.identityHashCode(s1));
        System.out.println(System.identityHashCode("男"));
    }
}

