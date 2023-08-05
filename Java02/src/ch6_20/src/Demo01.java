public class Demo01 {
    public static void main(String[] args) {
        int sum = 0;
        int sum2 = 0;
        int sum3 = 0;

        for (int i = 0; i < 101; i++) {
            sum += i;
        }
        System.out.println(sum);

        for (int i = 0; i < 101; i+=2) {
            sum2 += i;
/*            System.out.println(sum);*/

        }
        System.out.println(sum2);

        for (int i = 1; i < 101; i+=2) {

            sum3 += i;
        }
        System.out.println(sum3);

    }
}


