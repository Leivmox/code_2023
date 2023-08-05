package ch8_1.Override;

public class KidsTest {
    public static void main(String[] args) {

        Kids someKid = new Kids(12);

        someKid.printAge();

        someKid.setYearsOld(15);
        someKid.setSalary(0);
        someKid.setSex(1);
        someKid.employeed();
        someKid.manOrWoman();
    }
}