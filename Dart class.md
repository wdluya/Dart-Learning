# Class 类

## 构造方法

类的构造方法是通过创建具有与类相同的名字的函数来声明的。根据构造方法是否附加了描述性质的标识符。可以将类的构造方法分为两类：

* 未命名的构造方法：构造方法上没有附加标识符。
* 命名的构造方法：构造方法上附加了标识符。

### 未命名的构造方法

`Dart`类的未命名的构造方法：一个方法名与类名相同的特殊方法，用来初始化类的实例。两个特点：

* 方法名和类名一样。
* 没有返回值

```dart
void main(List<String> args) {
  Person p = Person("jack", 25);
  print("name = ${p.name}。age = ${p.age}");
}

class Person {
  String name = "rose";
  int age = 18;

  Person(String name, int age) {//构造方法
    this.name = name;
    this.age = age;
  }
}

//打印结果：name = jack。age = 25
```

#### 默认构造方法

如果我们没有给一个类添加构造方法，编译器会自动为该类添加一个默认的构造方法。默认构造方法是一个无参构造方法。如果我们为该类添加了构造方法，则编译器不会再为该类添加默认构造方法了。

```dart
void main(List<String> args) {
  Person p = Person();
  print("name = ${p.name}。age = ${p.age}");
}

class Person {
  String name = "rose";
  int age = 18;
  // Person() {}; 编译器会默认为该类添加无参构造方法
}
//打印结果：name = rose。age = 18
```

### 命名的构造方法

命名的构造方法:命名的构造方法就是在未命名的构造方法后面添加一个描述作用的标识符。语法形式`constructor.identifier(){}`

```dart
void main(List<String> args) {
  Map data = {"name": "jack", "age": 26};
  Person p = Person.fromJson(data);
  print("name = ${p.name}。age = ${p.age}");
}

class Person {
  String name = "rose";
  int age = 18;
  Person.fromJson(Map data) {//命名的构造方法
    name = data["name"];
    age = data["age"];
  }
}
//打印结果：name = jack。age = 26
```

### 继承中的构造方法

默认情况下，子类中的构造方法会调用父类的默认构造方法（如果存在）。

```dart
void main(List<String> arguments) {
  Children c = Children();
}

class Person {
  String? name;
  int? age;

  Person() {
    print("person construtor");
  }
}

class Children extends Person {
  String? kindergarten;
}
```



