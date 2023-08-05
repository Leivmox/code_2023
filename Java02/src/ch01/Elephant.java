package ch01;



//创建大象类
public class Elephant {
    String name = "大象";

    public String getName() {
        return name;
    }

    public void open(String door) {
        System.out.println(this.name + "打开" + door);
    }

    public void close(String door) {
        System.out.println(this.name + "关闭" + door);
    }

    public void go(String fridge) {
        System.out.println(this.name + "走进" + fridge);
    }
}
