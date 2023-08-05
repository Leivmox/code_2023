package constructor_test;

public class Person {
    private int age;
    private String name;

    public Person(String n, int a) {
        name = n;
        age = a;
    }

    public Person() {
        age = 18;
        name = "Tom";
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
