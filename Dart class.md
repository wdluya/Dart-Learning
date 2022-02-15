# Class 类

## 构造器

类的构造器是通过创建具有与类相同的名字的函数来声明的。根据构造器是否附加了描述性质的标识符。可以将类的构造器分为两类：

* 未命名的构造器：构造器上没有附加标识符。
* 命名的构造器：构造器上附加了标识符。

### 未命名的构造器

`Dart`类的未命名的构造器：一个方法名与类名相同的特殊方法，用来初始化类的实例。两个特点：

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

  Person(String name, int age) {//构造器
    this.name = name;
    this.age = age;
  }
}

//打印结果：name = jack。age = 25
```

**注意：**一个类中只能有一个未命名的构造器，否则编译报错。

```dart
void main(List<String> arguments) {
}

class Person {
  String name = "rose";
  int age = 18;

  Person() {
    print("person construtor");
  }

  Person(String name, int age) {
    // ignore: prefer_initializing_formals
    this.name = name;
    // ignore: prefer_initializing_formals
    this.age = age;
    print("person construtor:name=${this.name},age=${this.age}");
  }
}

/*
 编译报错： The unnamed constructor is already defined.
				   Try giving one of the constructors a name.dartduplicate_constructor
*/		   
```



#### 默认构造器

如果我们没有给一个类添加构造器，编译器会自动为该类添加一个默认的构造器。默认构造器是一个无参构造器。如果我们为该类添加了构造器，则编译器不会再为该类添加默认构造器了。

```dart
void main(List<String> args) {
  Person p = Person();
  print("name = ${p.name}。age = ${p.age}");
}

class Person {
  String name = "rose";
  int age = 18;
  // Person() {}; 编译器会默认为该类添加无参构造器
}
//打印结果：name = rose。age = 18
```

### 命名的构造器

命名的构造器:命名的构造器就是在未命名的构造器后面添加一个描述作用的标识符。语法形式`constructor.identifier(){}`

```dart
void main(List<String> args) {
  Map data = {"name": "jack", "age": 26};
  Person p = Person.fromJson(data);
  print("name = ${p.name}。age = ${p.age}");
}

class Person {
  String name = "rose";
  int age = 18;
  Person.fromJson(Map data) {//命名的构造器
    name = data["name"];
    age = data["age"];
  }
}
//打印结果：name = jack。age = 26
```

### 语法糖

```dart
class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
    Point.from(double x, double y) {
    this.x = x;
    this.y = y;
  }
}
```

上面的代码通过构造器给成员变量赋值。我们可以使用`Dart`语法糖简化。

```dart
class Point {
  double x = 0;
  double y = 0;

  // Point(double x, double y) {
  //   this.x = x;
  //   this.y = y;
  // }
  Point(this.x, this.y) {
    print("x = $x,y = $y");
  }

  // Point.from(double x, double y) {
  //   this.x = x;
  //   this.y = y;
  // }
  Point.from(this.x, this.y);
}
//使用该语法糖，实例变量的赋值操作是在constructor body运行之前。
```

### 初始化列表

```dart
//初始化列表
class InitializerListDemo {
  String var1 = "";
  String var2 = "";

  InitializerListDemo()
      : var1 = "abc",
        var2 = "def" {
    print("var1=$var1,var2=$var2");
  }

  InitializerListDemo.fromData()
      : var1 = "zxy",
        var2 = "opq" {
    print("var1=$var1,var2=$var2");
  }
}

```





###  继承链中的构造器

* 默认情况下，子类中的构造器会调用父类的默认构造器（如果存在）。

  ```dart
  void main(List<String> arguments) {
    Children c = Children();//调用Children的默认构造器，其会调用父类Person的默认构造器
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
  
  //打印结果：person construtor
  ```

  ```dart
  void main(List<String> arguments) {
    // Children c = Children();
    Children c1 = Children("七色光");//调用Children的构造器，其会调用父类Person的默认构造器
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
  
    Children(String kindergarten) {
      this.kindergarten = kindergarten;
    }
  }
  
  //打印结果：person construtor
  ```

* 如果子类中要调用父类中的非默认构造器，则需要使用`:super()`

  ```dart
  void main(List<String> arguments) {
    // Children c = Children();
    Children c1 = Children("七色光");
  }
  
  class Person {
    String? name;
    int? age;
  
    // Person() {
    //   print("person construtor");
    // }
  
    Person(String name, int age) {
      this.name = name;
      this.age = age;
      print("person construtor:	");
    }
    
      Person.initFromMap(Map data) {
      name = data["name"];
      age = data["age"];
    }
    
  }
  
  class Children extends Person {
    String? kindergarten;
  	
    /* demo1
     Children(String kindergarten) {
      // ignore: prefer_initializing_formals
      this.kindergarten = kindergarten;
    }
    //由于子类构造器默认会调用父类的默认构造器。但是Children的父类Person没有默认的构造器，所以编译报错。
    */
    
    /* demo2
    Children(String kindergarten) : super("jack", 18) {
      // ignore: prefer_initializing_formals
      this.kindergarten = kindergarten;
    }
    */
    
    /* demo3
     Children(String kindergarten, String name, int age) : super(name, age) {
      this.kindergarten = kindergarten;
    }
    */
    
    /* demo4 这种写法是语法糖，后面会讲到
    Children(this.kindergarten, Map data):super.initFromMap(data);
    */
    
    /*
    Children.fromData(this.kindergarten, List data) : super.initFromArray(data);
    */
  }
  //以上几个demo展示了子类调用父类的构造器
  ```
  
  



