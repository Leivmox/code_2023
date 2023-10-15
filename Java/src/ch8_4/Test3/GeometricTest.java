package ch8_4.Test3;

public class GeometricTest {
    public static void main(String[] args) {
        GeometricTest g = new GeometricTest();
        Circle C1 = new Circle("red",100,10);
        MyRectangle M1 = new MyRectangle("red", 100, 10, 10);
        g.equalsArea(C1, M1);
        g.displaytGemetricObject(C1);
        g.displaytGemetricObject(M1);
    }

    public void equalsArea(GeometricObject g1, GeometricObject g2) {
        if (g1.findArea() == g2.findArea()) {
            System.out.println("两个对象面积相等");

        } else {
            System.out.println("两个对象面积不相等");
        }
    }

    public void displaytGemetricObject(GeometricObject g) {
        System.out.println(g.findArea());
    }
}
