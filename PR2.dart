void main() {
  List<String> students = [
    "Афанасьев Александр",
    "Исаханян Давид",
    "Коротаев Даниил",
    "Куприков Антон",
    "Лозовой Даниил",
    "Мирзаев Жасурбек",
    "Сушков Илья",
  ];

  List<String> predmets = [
    "Основы алгоритмизации",
    "Операционные системы",
    "Основы философии",
    "Разработка мобилок",
    "Программные модули",
  ];

  List<List<int>> grades = [
    [3, 2, 4, 3, 3], // Афанасьев Александр
    [4, 4, 5, 4, 4], // Исаханян Давид
    [5, 5, 5, 5, 5], // Коротаев Даниил
    [5, 4, 4, 5, 4], // Куприков Антон
    [2, 3, 3, 2, 3], // Лозовой Даниил
    [4, 5, 4, 4, 5], // Мирзаев Жасурбек
    [5, 5, 5, 5, 5], // Сушков Илья
  ];

  print("    Аналитика успеваемости    \n");

  print("1. Группы студентов:");
  List<String> excellent = [];
  List<String> good = [];
  List<String> others = [];

  for (int i = 0; i < students.length; i++) {
    int sum = 0;
    for (int j = 0; j < grades[i].length; j++) {
      sum += grades[i][j];
    }
    double avg = sum / grades[i].length;

    if (avg >= 4.5) {
      excellent.add(students[i]);
    } else if (avg >= 3.5) {
      good.add(students[i]);
    } else {
      others.add(students[i]);
    }
  }

  print("Отличники (>= 4.5): $excellent");
  print("Хорошисты (3.5 - 4.5): $good");
  print("Остальные: $others");
  print("");

  print("2. Статистика оценок:");
  int count2 = 0, count3 = 0, count4 = 0, count5 = 0;

  for (int i = 0; i < grades.length; i++) {
    for (int j = 0; j < grades[i].length; j++) {
      int g = grades[i][j];
      if (g == 2)
        count2++;
      else if (g == 3)
        count3++;
      else if (g == 4)
        count4++;
      else if (g == 5)
        count5++;
    }
  }

  print("Двоек: $count2");
  print("Троек: $count3");
  print("Четверок: $count4");
  print("Пятерок: $count5");
  print("");

  print("3. Студенты с оценкой 5 по предметам:");
  for (int j = 0; j < predmets.length; j++) {
    List<String> with5 = [];
    for (int i = 0; i < students.length; i++) {
      if (grades[i][j] == 5) {
        with5.add(students[i]);
      }
    }
    print("${predmets[j]}: $with5");
  }
  print("");

  print("4. Предметы без двоек:");
  for (int j = 0; j < predmets.length; j++) {
    bool has2 = false;
    for (int i = 0; i < students.length; i++) {
      if (grades[i][j] == 2) {
        has2 = true;
        break;
      }
    }
    if (!has2) {
      print("- ${predmets[j]}");
    }
  }
  print("");

  print("5. Предмет с наибольшим количеством двоек:");
  String worstSubject = "";
  int max2 = -1;

  for (int j = 0; j < predmets.length; j++) {
    int c = 0;
    for (int i = 0; i < students.length; i++) {
      if (grades[i][j] == 2) c++;
    }
    if (c > max2) {
      max2 = c;
      worstSubject = predmets[j];
    }
  }

  if (max2 > 0) {
    print("$worstSubject (двоек: $max2)");
  } else {
    print("Двоек нет");
  }
  print("");

  print("6. Студенты с наибольшим количеством пятёрок:");
  int max5 = -1;

  for (int i = 0; i < students.length; i++) {
    int c = 0;
    for (int j = 0; j < grades[i].length; j++) {
      if (grades[i][j] == 5) c++;
    }
    if (c > max5) max5 = c;
  }

  List<String> top = [];
  for (int i = 0; i < students.length; i++) {
    int c = 0;
    for (int j = 0; j < grades[i].length; j++) {
      if (grades[i][j] == 5) c++;
    }
    if (c == max5) top.add(students[i]);
  }

  print("($max5 пятёрок): $top");
  print("");

  print("7. Студенты с оценками ниже 4:");
  for (int i = 0; i < students.length; i++) {
    List<String> bad = [];
    for (int j = 0; j < grades[i].length; j++) {
      if (grades[i][j] < 4) {
        bad.add(predmets[j]);
      }
    }
    if (bad.length > 0) {
      print("${students[i]}: $bad (${bad.length} шт.)");
    } else {
      print("${students[i]}: нет оценок ниже 4");
    }
  }
  print("");

  print("8. Пары (Студент - Предмет) с оценкой 5:");
  for (int i = 0; i < students.length; i++) {
    for (int j = 0; j < grades[i].length; j++) {
      if (grades[i][j] == 5) {
        print("${students[i]} - ${predmets[j]}");
      }
    }
  }
}
