package ch8_1.Override2;

public class Person {
    private int id;

    public Person() {
    }

    private String name;

    public Person(String name, String major) {
        this.name = name;
        this.major = major;
    }

    public Person(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Person(String name) {
        this.name = name;
    }

    public Person(int id) {
        this.id = id;
    }

    public Person(int id, String name, String major) {
        this.id = id;
        this.name = name;
        this.major = major;
    }

    private String major;


}