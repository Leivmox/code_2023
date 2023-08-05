package ch6_17;

//封装性
public class ch6_17_1 {
    public static void main(String[] args) {
        Animal a = new Animal();
        a.setLeg(6);
        System.out.println(a.getLeg());
    }
}

class Animal {
    private int leg;

    public int getLeg() {
        return leg;
    }

    public void setLeg(int l) {
        if (leg >= -1 && leg % 2 == 0)
            leg = l;
        else leg = -1;
    }
}
