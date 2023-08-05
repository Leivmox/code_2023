public class Demo02 {
    public static void main(String[] args) {
        double[] score = {35, 25, 56, 78, 65};
        double total = 0;
        double average = 0;
        int bjg =0;
        for (int i = 0; i < score.length; i++) {
            total += score[i];
        }
        System.out.println(total/ score.length);
        System.out.println("***********************");


        for (int i = 0; i < score.length; i++) {
            if (score[i]<60)
                bjg += 1;
        }
        System.out.println("bjg: "+ bjg);

        System.out.println("***********************");
        for (int i = 0; i < score.length; i++) {
            if (score[i]<60)
                score[i] = 60;
            System.out.print(score[i]+" ");

        }
        System.out.println("");
        System.out.println("***********************");

    }
}
