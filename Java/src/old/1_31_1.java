class sanyuan{
    public static void main(String[] args){
        int num1 = 3;
        int num2 = 7;
        int num3 = 2;
        int max1 = (num1 > num2)? num1 : num2;
        int max2 = (max1 > num3)? max1 : num3;
        System.out.println(max2);
    }
}
