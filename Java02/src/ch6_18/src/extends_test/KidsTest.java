package extends_test;

public class KidsTest {
    public static void main(String[] args) {
        Kids someKid = new Kids(12);

        someKid.setSex(0);
        someKid.printAge();
        System.out.println(someKid.getSex());;
        someKid.manOrWoman();
        
    }
}
