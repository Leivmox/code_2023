package extends_test;

public class Kids extends ManKind {
    private int yearsOld;


    @Override
    public void manOrWoman() {
        if (getSex() == 1) {
            System.out.println("man!!!");
        } else if (getSex() == 0) {
            System.out.println("woman!!!");
        }
    }

    public Kids() {
    }

    public Kids(int yearsOld) {
        this.yearsOld = yearsOld;
    }

    public void printAge() {
        System.out.println(getYearsOld());
    }
    public int getYearsOld() {
        return yearsOld;
    }

    public void setYearsOld(int yearsOld) {
        this.yearsOld = yearsOld;
    }
}
