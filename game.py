inventory = []
completed_actions = set()
locations = {
    "кабинет": ["коридор", "окно"],
    "коридор": ["кабинет", "кухня", "выход"],
    "кухня": ["коридор"]
}
items = {
    "огнетушитель": "Находится в углу кухни",
    "ключи": "Лежат на столе в кабинете",
    "телефон": "Мобильный телефон на полке"
}

def show_inventory():
    """Показать инвентарь"""
    if inventory:
        print(f"Инвентарь: {', '.join(inventory)}")
    else:
        print("Инвентарь пуст")

def first_stage():
    print("=== Часть 1: Пробуждение ===")
    print("Вы просыпаетесь от запаха дыма. Офис заполняется дымом.")
    print("Действия:")
    print("1 - Осмотреть кабинет")
    print("2 - Немедленно бежать к выходу")
    
    choice = input("Ваш выбор: ")
    
    if choice == "1":
        print("Вы осматриваете кабинет и находите:")
        print("- Ключи от окон на столе")
        print("- Мобильный телефон на полке")
        inventory.extend(["ключи", "телефон"])
        completed_actions.add("осмотр кабинета")
        show_inventory()
    elif choice == "2":
        print("Вы бежите в коридор, но дверь в выход заблокирована!")
    else:
        print("Нужно действовать быстро! Выберите 1 или 2")
        return first_stage()
    
    return second_stage()

def second_stage():
    print("=== Часть 2: Эвакуация ===")
    print("Вы в коридоре. Видны три пути:")
    print("1 - Вернуться в кабинет")
    print("2 - Попробовать открыть выход")
    print("3 - Зайти на кухню")
    
    choice = input("Ваш выбор: ")
    
    if choice == "1":
        if "ключи" in inventory:
            print("Вы возвращаетесь в кабинет и открываете окно ключами!")
            completed_actions.add("открыто окно")
            return ending_escape()
        else:
            print("Окно закрыто на замок. Нужно найти ключи!")
            return second_stage()
    elif choice == "2":
        print("Дверь завалена. Нужно найти другой путь!")
        return second_stage()
    elif choice == "3":
        print("На кухне вы находите огнетушитель!")
        inventory.append("огнетушитель")
        completed_actions.add("найден огнетушитель")
        show_inventory()
        return third_stage()
    else:
        print("Дым сгущается! Выберите действие 1-3")
        return second_stage()

def third_stage():
    print("=== Часть 3: Решающий момент ===")
    print("У вас есть огнетушитель. Что делаем?")
    print("1 - Попробовать потушить пожар у выхода")
    print("2 - Вернуться в кабинет к окну")
    
    choice = input("Ваш выбор: ")
    
    if choice == "1":
        print("Вы пытаетесь тушить пожар...")
        print("Огнетушитель почти пуст! Пламя ненадолго отступает.")
        completed_actions.add("попытка тушения")
        return ending_rescue()
    elif choice == "2":
        if "ключи" in inventory:
            print("Вы открываете окно и спускаетесь по пожарной лестнице!")
            return ending_escape()
        else:
            print("Окно закрыто! Вы заперты...")
            return ending_trapped()
    else:
        print("Времени на раздумья нет! Выберите 1 или 2")
        return third_stage()

def ending_escape():
    print("=== КОНЦОВКА 1: Спасение ===")
    print("Вы благополучно выбрались из горящего здания!")
    print("С помощью телефона вы вызвали пожарных.")
    print("Все коллеги были эвакуированы благодаря вам!")
    print("Выжившие: множество")
    print("Потери: 0")
    show_stats()

def ending_rescue():
    print("=== КОНЦОВКА 2: Спасение с помощью ===")
    print("Ваши попытки потушить пожар привлекли внимание!")
    print("Пожарные выбивают дверь и эвакуируют вас.")
    print("Вы спасены, но получили легкое отравление дымом.")
    print("Выжившие: все, кроме одного")
    print("Потери: 1 (охранник, который вернулся за документами)")
    show_stats()

def ending_trapped():
    print("=== КОНЦОВКА 3: Гибель ===")
    print("Дым становится невыносимым...")
    print("Вы теряете сознание...")
    print("Пожарные находят вас слишком поздно.")
    print("Выжившие: большинство")
    print("Потери: 1 (вы)")
    show_stats()

def show_stats():
    print(f"Статистика:")
    print(f"Выполнено действий: {len(completed_actions)}")
    print(f"Собрано предметов: {len(inventory)}")
    print(f"Уникальные действия: {completed_actions}")

print("=== ПОЖАР В ОФИСЕ ===")
print("Текстовая игра-новелла")
print("Сделайте выбор в критической ситуации!")

first_stage()

print("Спасибо за игру!")