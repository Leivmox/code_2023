package ch3_17.a;

public class Person {
    public String name;
    public int blood = 100;

    public Gun gun;
    public Bullet bullet;
    public Supply supply;

    public void takeSupply(Supply supply) {
        this.supply = supply;
        System.out.println(String.format("%s 捡到了 %s", this.name, supply.name));
    }

    public Person(String name) {
        this.name = name;
    }

    public void eatSupply() {
        if (this.blood > 0) {
            //System.out.println(String.format("%s 吃了 %s", this.name, supply.name));
            System.out.println(String.format("%s 吃了 %s", this.name, supply.name));

            this.blood += this.supply.energy;
        }
    }

    public void takeGun(Gun gun) {
        this.gun = gun;
        System.out.println(String.format("%s 捡到了 %s", this.name, gun.name));
    }

    public void takeBullet(Bullet bullet) {
        this.bullet = bullet;
        System.out.println(String.format("%s 捡到了 %d 颗子弹", this.name, bullet.num));
    }

    public void loadBullet() {
        this.gun.bullet += this.bullet.num;
        System.out.println(String.format("%s 装子弹，枪现在有子弹了", this.name));
    }

    public void shootGun(Person enemy) {
        if (this.gun.bullet <= 0) {
            System.out.println("危险!抢没有子弹!");
        } else {
            this.gun.bullet -= 1;
            enemy.blood -= this.bullet.damage;
            System.out.println(String.format("%s 向 %s 开枪", this.name, enemy.name));
            System.out.println(String.format("%s 中抢，血剩下%d", enemy.name, enemy.blood));
        }
    }

}


