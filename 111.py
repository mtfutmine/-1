try:
    a = int(input("Введите первое число: "))
    b = int(input("Введите второе число: "))
    op = input("Введите оператор: ")
    if op == "+":
        print("Результат:", a + b)
    elif op == "-":
        print("Результат:", a - b)
    elif op == "*":
        print("Результат:", a * b)
    elif op == "/":
        if b != 0:
            print("Результат:", a / b)
        else:
            print("Ошибка: деление на ноль!")
    elif op == "//":
        if b != 0:
            print("Результат:", a // b)
        else:
            print("Ошибка: деление на ноль!")
    elif op == "%":
        if b != 0:
            print("Результат:", a % b)
        else:
            print("Ошибка: деление на ноль!")
    elif op == "**":
        print("Результат:", a ** b)
    elif op == "==":
        print("Результат:", a == b)
    elif op == "!=":
        print("Результат:", a != b)
    elif op == ">":
        print("Результат:", a > b)
    elif op == "<":
        print("Результат:", a < b)
    elif op == ">=":
        print("Результат:", a >= b)
    elif op == "<=":
        print("Результат:", a <= b)
    elif op == "and":
        print("Результат:", (a > 0) and (b > 0))
    elif op == "or":
        print("Результат:", (a > 0) or (b > 0))
    elif op == "not":
        print("Результат:", not (a > 0))
    elif op == "&":
        print("Результат:", a & b)
    elif op == "|":
        print("Результат:", a | b)
    elif op == "^":
        print("Результат:", a ^ b)
    elif op == "~":
        print("Результат:", ~a)
    elif op == "<<":
        print("Результат:", a << b)
    elif op == ">>":
        print("Результат:", a >> b)
    else:
        print("Ошибка: неизвестный оператор!")
except ValueError:
    print("Ошибка: вводите только числа!")
except Exception as e:
    print("Непредвиденная ошибка:", e)
