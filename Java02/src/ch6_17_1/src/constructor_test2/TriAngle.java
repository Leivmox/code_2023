package constructor_test2;

public class TriAngle {
    private double base;
    private double height;


    public TriAngle() {

    }
    public TriAngle(double b, double h) {
        base = b;
        height = h;
    }

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }
}
