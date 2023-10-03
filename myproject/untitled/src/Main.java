public class Main {
    private int a =1;
    private int b = 2;
    private double c = 3.14;
    private String Name = "Tom";

    public Main(int a, int b, double c, String name) {
        this.a = a;
        this.b = b;
        this.c = c;
        Name = name;
    }

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public int getB() {
        return b;
    }

    public void setB(int b) {
        this.b = b;
    }

    public double getC() {
        return c;
    }

    public void setC(double c) {
        this.c = c;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public static void main(String[] args) {
        System.out.println("Hello world!");
    }
}
