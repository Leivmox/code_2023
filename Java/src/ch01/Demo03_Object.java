package ch01;


//创建冰箱类
class Fridge01 {
    String name = "冰箱";
    String door = "门";

    public String getName() {
        return name;
    }

    public String getDoor() {
        return door;
    }
}



//创建大象类
class Elephant01 {
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



public class Demo03_Object {
    public static void main(String[] args) {
        Fridge01 fridge = new Fridge01();
        Elephant01 elephant = new Elephant01();

        elephant.open(fridge.getDoor());
        elephant.go(fridge.getName());
        elephant.close(fridge.getDoor());
    }
}
