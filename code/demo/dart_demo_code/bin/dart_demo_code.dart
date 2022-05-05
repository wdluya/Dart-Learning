import 'package:dart_demo_code/dart_demo_code.dart' as dart_demo_code;

// Iterable<T> where(bool Function(T) predicate) {}

void main(List<String> arguments) {
  func1WithParameterOfFunctionType(func1AsParameter);
  func2WithParameterOfFunctionType(func2AsParameter);
  // func3WithParameterOfFunctionType(func3AsParameter);//编译报错类型不匹配
  func4WithParameterOfFunctionType(func3AsParameter);
}

void func1WithParameterOfFunctionType(void Function() fun) {
  fun();
}

void func2WithParameterOfFunctionType(void Function(String, String) fun) {
  fun("abc", "xyz");
}

/**
   参数 void Function(String testParam1, String testParam2) 和  void Function(String, String) 类型使用一样的
 */
void func3WithParameterOfFunctionType(
    void Function(String testParam1, String testParam2) fun) {
  // fun(testParam1: "123", testParam2: "456"); //编译报错
  fun("123", "456");
}

void func4WithParameterOfFunctionType(
    void Function({required String testParam1, required String testParam2})
        fun) {
  fun(testParam1: "123", testParam2: "456");
  // fun("123", "456");//编译报错
}

void func1AsParameter() {
  print("func1AsParameter");
}

void func2AsParameter(String testParam1, String testParam2) {
  //类型:void Function(String, String)
  print("func2AsParameter parameter - testParam1 = $testParam1");
  print("func2AsParameter parameter - testParam2 = $testParam2");
}

void func3AsParameter(
    //类型: void Function({required String testParam1, required String testParam2})
    {required String testParam1,
    required String testParam2}) {
  print("func3AsParameter parameter - testParam1 = $testParam1");
  print("func3AsParameter parameter - testParam2 = $testParam2");
}
