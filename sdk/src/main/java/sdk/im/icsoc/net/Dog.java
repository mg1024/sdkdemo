package sdk.im.icsoc.net;

/**
 * Created by 张龙臣 on 2017/11/7.
 */

public class Dog {
    public void setAge(int age) {
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public String getName() {
        return name;
    }

    public Dog(int age) {
        this.age = age;
    }

    public Dog(int age, String name) {
        this.age = age;
        this.name = name;
    }

    private int age;
    private String name;

}
