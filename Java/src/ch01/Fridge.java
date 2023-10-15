package ch01;



//创建冰箱类
public class Fridge {
    String name = "冰箱";
    String door = "门";

    public String getName() {
        return name;
    }

    public String getDoor() {
        return door;
    }


    public static void main(String[] args) {
        Fridge f = new Fridge();
        Elephant e = new Elephant();

        e.open(f.getDoor());
        e.go(f.getName());
        e.close(f.getDoor());
    }
}
