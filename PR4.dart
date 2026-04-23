//1
class Cup {
  void drink() {
    print('Человек пьет из кружки');
  }
}

class Person {
  void drinkFrom(Cup cup) {
    cup.drink();
  }
}

//2
class Storage {
  String name;
  List<String> items = [];

  Storage(this.name);

  void addItem(String item) {
    items.add(item);
  }

  String? removeItem() {
    if (items.isNotEmpty) {
      return items.removeLast();
    }
    return null;
  }
}

class Wardrobe {
  Storage hanger = Storage('Вешалка');
  Storage shelf = Storage('Полка');

  void putOnHanger(String item) {
    hanger.addItem(item);
  }

  void putOnShelf(String item) {
    shelf.addItem(item);
  }

  String? takeFromHanger() {
    return hanger.removeItem();
  }

  String? takeFromShelf() {
    return shelf.removeItem();
  }
}

//3
class Plate {
  double weight;

  Plate(this.weight);
}

class Barbell {
  double maxWeight;
  double barWeight = 20;
  List<Plate> left = [];
  List<Plate> right = [];

  Barbell(this.maxWeight);

  double currentWeight() {
    double sum = barWeight;

    for (var p in left) {
      sum += p.weight;
    }
    for (var p in right) {
      sum += p.weight;
    }

    return sum;
  }

  void addLeft(Plate plate) {
    if (currentWeight() + plate.weight <= maxWeight) {
      left.add(plate);
    } else {
      print('Превышен вес');
    }
  }

  void addRight(Plate plate) {
    if (currentWeight() + plate.weight <= maxWeight) {
      right.add(plate);
    } else {
      print('Превышен вес');
    }
  }
}

//4
class ConvMoney {
  void convert(double rub, double rate, String name) {
    double result = rub / rate;
    print("Сумма $rub рублей в $name: $result");
  }
}

//5
class Garage<T> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
    print('Добавлено: $item');
  }

  void remove(T item) {
    if (items.contains(item)) {
      items.remove(item);
      print('Удалено: $item');
    } else {
      print('Нет такого элемента');
    }
  }
}

//6
class Number {
  double value;

  Number(this.value);

  Number operator +(Number other) {
    return Number(value + other.value);
  }

  Number operator -(Number other) {
    return Number(value - other.value);
  }

  Number operator *(Number other) {
    return Number(value * other.value);
  }

  Number operator /(Number other) {
    return Number(value / other.value);
  }
}

//7
enum State { stop, drive, turn }

class Car {
  State state = State.stop;

  void stop() {
    state = State.stop;
    print('Машина стоит');
  }

  void drive() {
    state = State.drive;
    print('Машина едет');
  }

  void turn() {
    state = State.turn;
    print('Машина поворачивает');
  }
}

//8
class Shape {
  void draw() {
    print("Рисуем фигуру");
  }

  double area() => 0;
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  void draw() {
    print("Рисуем прямоугольник");
  }

  @override
  double area() => width * height;
}

class Triangle extends Shape {
  double width;
  double height;

  Triangle(this.width, this.height);

  @override
  void draw() {
    print("Рисуем треугольник");
  }

  @override
  double area() => 0.5 * width * height;
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  void draw() {
    print("Рисуем окружность");
  }

  @override
  double area() => 3.14 * radius * radius;
}

//9
class Converter {
  String convert(String value, int fromBase, int toBase) {
    int number = int.parse(value, radix: fromBase);
    String result = number.toRadixString(toBase);

    print('Из $fromBase в $toBase: $value = $result');

    return result;
  }
}

//10
class Shape10 {
  double area() {
    return 0;
  }
}

class Rectangle10 extends Shape10 {
  double a;
  double b;

  Rectangle10(this.a, this.b);

  @override
  double area() {
    return a * b;
  }
}

class Circle10 extends Shape10 {
  double r;

  Circle10(this.r);

  @override
  double area() {
    return 3.14 * r * r;
  }
}

class ShapeList {
  List<Shape10> shapes = [];

  void add(Shape10 shape) {
    shapes.add(shape);
  }

  Shape10? maxArea() {
    if (shapes.isEmpty) return null;

    Shape10 max = shapes[0];

    for (var s in shapes) {
      if (s.area() > max.area()) {
        max = s;
      }
    }

    return max;
  }
}

//11
abstract class TableItem {
  String name;

  TableItem(this.name);
}

class Fork extends TableItem {
  Fork() : super('Вилка');
}

class PlateItem extends TableItem {
  PlateItem() : super('Тарелка');
}

class Spoon extends TableItem {
  Spoon() : super('Ложка');
}

class Table {
  List<TableItem> items = [];
  void add(TableItem item) {
    items.add(item);
    print('Добавили: ${item.name}');
  }

  void remove(TableItem item) {
    if (items.contains(item)) {
      items.remove(item);
      print('Убрали: ${item.name}');
    } else {
      print('Такого предмета нет');
    }
  }
}

void main() {
  print("\nЗадание 1");
  Cup cup = Cup();
  Person person = Person();

  person.drinkFrom(cup);

  print("\nЗадание 2");
  Wardrobe wardrobe = Wardrobe();

  wardrobe.putOnHanger('Куртка');
  wardrobe.putOnShelf('Свитер');

  print(wardrobe.takeFromHanger());
  print(wardrobe.takeFromShelf());

  print("\nЗадание 3");
  Barbell barbell = Barbell(200);

  barbell.addLeft(Plate(30));
  barbell.addRight(Plate(30));

  print('Текущий вес: ${barbell.currentWeight()}');

  barbell.addLeft(Plate(100));
  barbell.addRight(Plate(100));

  print("\nЗадание 4");
  ConvMoney m = ConvMoney();

  m.convert(1000, 90, "долларах");
  m.convert(1000, 100, "франках");
  m.convert(1000, 12, "юанях");

  print("\nЗадание 5");
  Garage<String> garage = Garage<String>();

  garage.add('Машина');
  garage.remove('Машина');

  Garage<int> numberGarage = Garage<int>();

  numberGarage.add(10);
  numberGarage.remove(10);

  print("\nЗадание 6");
  Number a = Number(10);
  Number b = Number(5);

  print((a + b).value);
  print((a - b).value);
  print((a * b).value);
  print((a / b).value);

  print("\nЗадание 7");
  Car car = Car();

  car.drive();
  car.turn();
  car.stop();

  print("\nЗадание 8");
  var r = Rectangle(4, 5);
  var t = Triangle(4, 3);
  var c = Circle(3);

  r.draw();
  print(r.area());

  t.draw();
  print(t.area());

  c.draw();
  print(c.area());

  print("\nЗадание 9");
  Converter cc = Converter();

  cc.convert('10', 10, 2);
  cc.convert('FF', 16, 10);
  cc.convert('77', 8, 10);

  print("\nЗадание 10");
  ShapeList list = ShapeList();

  list.add(Rectangle10(2, 3));
  list.add(Circle10(2));
  list.add(Rectangle10(5, 5));

  Shape10? max = list.maxArea();

  print('Максимальная площадь: ${max?.area()}');

  print("\nЗадание 11");
  Table table = Table();

  var fork = Fork();
  var plate = PlateItem();
  var spoon = Spoon();

  table.add(fork);
  table.add(plate);
  table.add(spoon);

  table.remove(spoon);
}
