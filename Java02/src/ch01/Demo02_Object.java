package ch01;

// java代码运行的几种方式
// 1、
// 2、
// 3、





// 这里才是真正大象打开冰箱的代码
public class Demo02_Object {

	public static void main(String[] args) {

		Fridge fridge = new Fridge();
		Elephant elephant = new Elephant();

		elephant.open(fridge.getDoor());
		elephant.go(fridge.getName());
		elephant.close(fridge.getDoor());
	}
}
