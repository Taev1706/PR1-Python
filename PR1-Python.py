print("ㅤ" * 9, "Калькулятор")
lin = ("_" * 50)
print(lin)
while True:
    try:
        one = float(input("Введите первое число: "))
        break
    except ValueError:
        print("Это не правильный ввод.")
print(lin)
while True:
    try:
        two = float(input("Введите второе число: "))
        break
    except ValueError:
        print("Это не правильный ввод.")
print(lin)
while True:
    
    op = input("Выберите действие:\n 1)Арифметические операторы( +, -, *, /, //, %, ** )\n 2)Операторы сравнения( ==, !=, >, <, >=, <= )\n 3)Логические операторы( and, or, not )\n 4)Операторы принадлежности( in, not in)\n 5)Операторы тождественности( is, is not)\n Ввод:")
    
    if op == "+":
        print("Ответ:", one + two)
        break
    elif op == "-":
        print("Ответ:", one - two)
        break
    elif op == "*":
        print("Ответ:", one * two)
        break
    elif op == "/":
        if two == 0:
            print("Действие с 0 невозможно.")
            continue
        else:
            print("Ответ:", one / two)
            break
    elif op == "//":
        if two == 0:
            print("Действие с 0 невозможно.")
            continue
        else:
            print("Ответ:", one // two)
            break
    elif op == "%":
        if two == 0:
            print("Действие с 0 невозможно.")
            continue
        else:
            print("Ответ:", one % two)
            break
    elif op == "**":
        print("Ответ:", one ** two)
        break
    elif op == "==":
        print("Ответ:", one == two)
        break
    elif op == "!=":
        print("Ответ:", one != two)
        break
    elif op == ">":
        print("Ответ:", one > two)
        break
    elif op == "<":
        print("Ответ:", one < two)
        break
    elif op == ">=":
        print("Ответ:", one >= two)
        break
    elif op == "<=":
        print("Ответ:", one <= two)
        break
    elif op == "and":
        print("Ответ:", bool(one) and bool(two))
        break
    elif op == "or":
        print("Ответ:", bool(one) or bool(two))
        break
    elif op == "not":
        print("Ответ для первого числа:", not bool(one))
        print("Ответ для второго числа:", not bool(two))
        break
    elif op == "in":
        print("Ответ:", str(one) in str(two))
        break
    elif op == "not in":
        print("Ответ:", str(one) not in str(two))
        break
    elif op == "is":
        print("Ответ:", one is two)
        break
    elif op == "is not":
        print("Ответ:", one is not two)
        break
    else:
        print(lin)
        print("Неправильный ввод, повторите попытку")