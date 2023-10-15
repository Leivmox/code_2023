package ch3_17.a;
//
//public class PlayGame {
//    public static void main(String[] args) {
//
//
//
//    Person solider = new Person("战士");
//    Person enemyl = new Person("敌人");
//
//    Supply redbull = new Supply("红牛", 100);
//    Supply kfc = new Supply("kfc", 300);
//
//    solider.takeSupply(redbull);
//    solider.eatSupply();
//    }
//
//}

public class PlayGame {
    public static void main(String[] args) {
        Person solider = new Person("战士");
        Person enemy = new Person("敌人");

        Supply redbull = new Supply("红牛", 100);
        Supply kfc = new Supply("KFC", 300);


        solider.takeSupply(redbull);
        solider.eatSupply();
        enemy.takeSupply(kfc);
        enemy.eatSupply();

        Gun smallgun = new Gun("小手抢");
        Gun penzi = new Gun("喷子");
        Bullet smallgunbullet = new Bullet(5, 20);
        Bullet penzibullet = new Bullet(5, 50);

        solider.takeGun(penzi);
        solider.takeBullet(penzibullet);
        solider.loadBullet();
        solider.shootGun(enemy);
        solider.shootGun(enemy);

        enemy.takeGun(smallgun);
        enemy.takeBullet(smallgunbullet);
        enemy.loadBullet();
        enemy.shootGun(solider);
        enemy.shootGun(solider);
        

        solider.shootGun(enemy);
        solider.shootGun(enemy);
        solider.shootGun(enemy);
        solider.shootGun(enemy);
        solider.shootGun(enemy);
        solider.shootGun(enemy);
        solider.shootGun(enemy);

    }
}
