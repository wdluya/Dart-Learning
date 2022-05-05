/// final比const有更广的使用场景
/// const 只适用于top-level ,static和local variables

const String topLevelVariable = "abc";
void main(List<String> args) {
  const String localVariable = "cde";

  run();
}

class MyConstClass {
  final int field1;
  final List<String> field2;
  const MyConstClass(this.field1, this.field2);
}

class MyWannabeConstClass {
  // Future doesn't have a const constructor or a const factory
  final Future<int> field;
  // Dart allows us to define a seemingly nonsensical constructor:
  const MyWannabeConstClass(this.field);
}

void run() {
  // passing in a const variable
  const constVariable = 123456;
  const a = 123;
  final w = MyConstClass(123, ["hello"]);
  const x = MyConstClass(constVariable, ['hello', 'there']); //
  final y = MyConstClass(a, ["hello"]);
  // const z = MyConstClass(a, ["hello"]); error
  print(w == y);

// const x = MyWannabeConstClass(Future.value(123));//error
}
