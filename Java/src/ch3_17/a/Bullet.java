package ch3_17.a;

public class Bullet {
    public int num;
    public int damage;

    public Bullet(int num, int damage){
       this.num = num;
       this.damage = damage;

    }

    public static void main(String[] args) {
       Bullet bullet = new Bullet(6,100);
        System.out.println(bullet.damage);
        System.out.println(bullet.num);
    }

}


