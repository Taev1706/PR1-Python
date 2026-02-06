import 'dart:io';
import 'dart:math';

void main() {
  print("Введите первое число");
  var num = double.parse(stdin.readLineSync()!);

  print("Введите второе число");
  var num1 = double.parse(stdin.readLineSync()!);

  print(
    "Выбирите операцию(+, -, *, /, ~/, %, pow, ==, !=, >, <, >=, <=, &&, ||, !, 0 - выход):",
  );
  String op = stdin.readLineSync()!;

  switch (op) {
    case "+":
      print(num + num1);
      break;
    case "-":
      print(num - num1);
      break;
    case "*":
      print(num * num1);
      break;
    case "/":
      if (num1 != 0) {
        print(num / num1);
      } else {
        print("Делить на ноль нельзя");
      }
      break;
    case "~/":
      print(num ~/ num1);
      break;
    case "%":
      print(num % num1);
      break;
    case "pow":
      print(pow(num, num1));
      break;
    case "==":
      print("Результат: ${num == num1}");
      break;
    case "!=":
      print("Результат: ${num != num1}");
      break;
    case ">":
      print("Результат: ${num > num1}");
      break;
    case "<":
      print("Результат: ${num < num1}");
      break;
    case ">=":
      print("Результат: ${num >= num1}");
      break;
    case "<=":
      print("Результат: ${num <= num1}");
      break;
    case "&&":
      bool bool1 = num != 0;
      bool bool2 = num1 != 0;
      print("Результат: ${bool1 && bool2}");
      break;
    case "||":
      bool bool1 = num != 0;
      bool bool2 = num1 != 0;
      print("Результат: ${bool1 || bool2}");
      break;
    case "!":
      bool bool1 = num != 0;
      print("Результат: ${!bool1}");
      break;
    case "0":
      print("Выход");
      break;
    default:
      print("Ошибка: введите правильную операцию");
  }
}
