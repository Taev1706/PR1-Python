import "dart:io";
import "dart:convert";

void main() {
  stdout.writeln("Задача 1");
  stdout.writeln("Введите Имя:");
  String? name = stdin.readLineSync(encoding: utf8);

  stdout.writeln("Введите Фамилию:");
  String? surname = stdin.readLineSync(encoding: utf8);

  stdout.writeln("Введите Отчество:");
  String? patronymic = stdin.readLineSync(encoding: utf8);

  if (patronymic != null && patronymic.trim().isEmpty) {
    patronymic = null;
  }

  stdout.writeln("Результат: ${formatName(name!, surname!, patronymic)}");
  stdout.writeln("");

  stdout.writeln("Задача 2");
  stdout.writeln("Введите первое число:");
  double num1 = double.parse(stdin.readLineSync(encoding: utf8)!);

  stdout.writeln("Введите второе число:");
  double num2 = double.parse(stdin.readLineSync(encoding: utf8)!);

  stdout.writeln("Введите операцию (+, -, *, /):");
  String op = stdin.readLineSync(encoding: utf8)!;

  var result = calculate(num1, num2, op);
  if (result == null) {
    stdout.writeln("Деление на ноль или неверная операция.");
  } else {
    stdout.writeln("Результат: $result");
  }
  stdout.writeln("");

  stdout.writeln("Задача 3");
  stdout.writeln("Введите список целых чисел через пробел (5 -2 0 10):");
  String inputList = stdin.readLineSync(encoding: utf8)!;
  List<int> numbers = inputList.split(" ").map((e) => int.parse(e)).toList();

  countSigns(numbers);
  stdout.writeln("");

  stdout.writeln("Задача 4");
  stdout.writeln("Введите список целых чисел через пробел (5 -2 0 10):");
  String inputTransform = stdin.readLineSync(encoding: utf8)!;
  List<int> listToTransform = inputTransform
      .split(" ")
      .map((e) => int.parse(e))
      .toList();

  List<int> transformed = transformList(listToTransform, (x) => x * x);

  stdout.writeln("Исходный список: $listToTransform");
  stdout.writeln("После преобразования (квадрат числа): $transformed");
  stdout.writeln("");

  stdout.writeln("Задача 5");
  stdout.writeln("Введите положительное целое число:");
  int numberForSum = int.parse(stdin.readLineSync(encoding: utf8)!);

  stdout.writeln(
    "Сумма цифр числа $numberForSum равна: ${sumDigits(numberForSum)}",
  );
}

String formatName(String firstName, String lastName, [String? middleName]) {
  if (middleName == null) {
    return "$lastName $firstName";
  } else {
    return "$lastName $firstName $middleName";
  }
}

num? calculate(num a, num b, String operation) {
  switch (operation) {
    case "+":
      return a + b;
    case "-":
      return a - b;
    case "*":
      return a * b;
    case "/":
      if (b == 0) return null;
      return a / b;
    default:
      return null;
  }
}

void countSigns(List<int> numbers) {
  int positive = 0;
  int negative = 0;
  int zero = 0;

  for (int num in numbers) {
    if (num > 0) {
      positive++;
    } else if (num < 0) {
      negative++;
    } else {
      zero++;
    }
  }

  stdout.writeln("Положительных: $positive");
  stdout.writeln("Отрицательных: $negative");
  stdout.writeln("Нулевых: $zero");
}

List<int> transformList(List<int> list, int Function(int) transformer) {
  return list.map(transformer).toList();
}

int sumDigits(int n) {
  if (n < 10) {
    return n;
  }
  return (n % 10) + sumDigits(n ~/ 10);
}
