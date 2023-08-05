package ch8_1.Override;

/*
 * 2.修改练习1.2中定义的类Kids，在Kids中重新定义employeed()方法，
 * 	  覆盖父类ManKind中定义的employeed()方法，
 *   输出“Kids should study and no job.”
 */
public class Kids extends ManKind{

    private int yearsOld;	//年限

    public Kids() {

    }

    public Kids(int yearsOld) {
        this.yearsOld = yearsOld;
    }

    public int getYearsOld() {
        return yearsOld;
    }

    public void setYearsOld(int yearsOld) {
        this.yearsOld = yearsOld;
    }

    public void printAge(){
        System.out.println("I am " + yearsOld);
    }

    public void employeed(){
        System.out.println("Kids should study and no job.");
    }
}