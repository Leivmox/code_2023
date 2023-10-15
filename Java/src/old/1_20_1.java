class num{
         public static void main(String[] args){
		int num1 = 10;
		int num2 = 20;
		num1 = num1 ^ num2;// ^异或符号
		num2 = num1 ^ num2;
		num1 = num1 ^ num2;
                System.out.println(num1);
                System.out.println(num2);
         }
}
//这种方法相对使用临时变量temp，可以减少另外声明一个temp变量
