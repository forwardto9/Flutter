import 'dart:ffi';
import 'dart:math';

class MyPoint {
  /*
  num x;
  num y;

// C++ instructor
  MyPoint(num x, num y) {
    this.x = x;
    this.y = y;
  }
  */
  num x, y;
  MyPoint(this.x, this.y);

  // 默认构造
  MyPoint.init() {
    x = 0;
    y = 0;
  }
  // 部分默认构造
  MyPoint.alongXAxis(num x) : this(x, 8.28);
}

class Shape {
  String name;
  Shape() {
    this.name = "";
  }

  String description() => "this is $name";
}

class Retangle implements Shape {
  @override
  // TODO: implement name
  String get name => "Retangle";
  @override
  void set name(String _name) {
    // TODO: implement name
  }
  @override
  String description() {
    // TODO: implement description
    return null;
  }
}

class Circle extends Shape {
  MyPoint center;

  Circle(String name) {
    this.name = name;
  }

// You can create additional properties
// by implementing getters and setters,
// using the get and set keywords:
  // Define two calculated properties:
  String get info => "Hi," + this.name;
  set info(String n) => name = n + "hi";

  @override
  String description() {
    // TODO: implement description
    return super.description();
  }
}

// Use the factory keyword when implementing a constructor
// that doesn’t always create a new instance of its class.
// For example, a factory constructor might return an instance
// from a cache, or it might return an instance of a subtype.
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

abstract class Animal {
  void run();
}

class Bird extends Animal {
  @override
  void run() {
    // TODO: implement run
    print("I am a bird! I am running!");
  }
}

// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

Future<void> lookIndex() async {
  for (var i = 0; i < 999999999; i++) {
    if (i == 9999999) {
      print('object');
    }
  }
}

// Future wasteTimeToDO() async {
//   await lookIndex();
//   print("I do not want to wait!");
// }

// This is where the app starts executing.
Future main() async {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.

  var p0 = MyPoint(10.0, 100.0);
  print(p0.x);
  p0.x = 100;
  print(p0.x);

  if (p0 is MyPoint) {
    print("my point");
  }

  var p1 = new MyPoint(100, 18);
  print(p1.y);

  var p2 = new MyPoint.init();
  print(p2.x);

  var p3 = new MyPoint.alongXAxis(200);
  print('${p3.x}, ${p3.y}');

  var shape0 = Circle("Circle");
  var des = shape0.description();
  print('$des');

// 链式编程
  var shape1 = Circle("Circle")..center = MyPoint(99.89, 10);
  print(shape1.center.x);

// 询问式赋值
  var assignOpr;
  var a = assignOpr;
  var b = 12;
  b ??= assignOpr;

  print('$a, $b');

  var type = shape0.runtimeType.toString();
  print('$type');

  var logger = Logger('UI');
  logger.log('Clicked!');

  var cirle0 = Circle("haha")..center = MyPoint(99.89, 10);
  cirle0.info = "my";
  print('${cirle0.info}');

  await lookIndex();

  print(0);
}
