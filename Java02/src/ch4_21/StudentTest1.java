package ch4_21;

public class StudentTest1 {
    //将StudentTest改进，将方法封装
    public static void main(String[] args) {

        Student[] stus = new Student[20];

        for (int i = 0; i < stus.length; i++) {
            stus[i] = new Student();
            stus[i].number = (i + 1);
            stus[i].state = (int) (Math.random() * (6 - 1 + 1) + 1);
            stus[i].score = (int) (Math.random() * (100 - 0 + 1));
        }

        StudentTest1 test = new StudentTest1();

        test.searchState(stus, 3);
        test.sort(stus);
        test.print(stus);

    }

    public void searchState(Student[] stus, int state){
        for(int i = 0; i < stus.length; i++){
            if(stus[i].state == state)
                System.out.println(stus[i].info());
        }
        System.out.println("********************");
    }

    public void sort(Student[] stus){
        for(int i = 0; i < stus.length - 1; i ++){
            for(int j = 0; j < stus.length - 1 - i; j ++){
                if(stus[j].score > stus[j+1].score) {
                    Student temp = stus[j];
                    stus[j] = stus[j + 1];
                    stus[j +  1] = temp;
                }
            }
        }
    }

    public void print(Student[] stus) {
        for (int i = 0; i < stus.length; i++) {
            System.out.println(stus[i].info());
        }
        System.out.println("*********************");
    }
}