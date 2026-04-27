// 1. Кружка и Человек
class Cup {
  int volume = 100; // мл
  int current = 100; // текущее количество

  void drink(int amount) {
    if (amount <= current) {
      current -= amount;
      print('Выпито $amount мл. Осталось $current мл.');
    } else {
      print('В кружке недостаточно воды.');
    }
  }
}

class Human {
  void drinkFromCup(Cup cup, int amount) {
    cup.drink(amount);
  }
}

// 2. Шкаф с системами хранения
class StorageSystem {
  List<String> items = [];

  void put(String item) => items.add(item);
  String? take(String item) {
    if (items.remove(item)) return item;
    return null;
  }
}

class Cupboard {
  List<StorageSystem> storages = [];

  void addStorage(StorageSystem storage) => storages.add(storage);
  void putItem(String item, int storageIndex) {
    if (storageIndex < storages.length) {
      storages[storageIndex].put(item);
    }
  }
  String? takeItem(String item, int storageIndex) {
    if (storageIndex < storages.length) {
      return storages[storageIndex].take(item);
    }
    return null;
  }
}

// 3. Гриф и Блин
class Plate {
  double weight;
  Plate(this.weight);
}

class Barbell {
  double maxLoad;
  List<Plate> leftPlates = [];
  List<Plate> rightPlates = [];

  Barbell(this.maxLoad);

  double get currentLoad {
    double sum = 0;
    for (var p in leftPlates) sum += p.weight;
    for (var p in rightPlates) sum += p.weight;
    return sum;
  }

  bool canAdd(Plate plate) => currentLoad + plate.weight <= maxLoad;

  void addLeft(Plate plate) {
    if (canAdd(plate)) leftPlates.add(plate);
    else print('Превышение нагрузки!');
  }

  void addRight(Plate plate) {
    if (canAdd(plate)) rightPlates.add(plate);
    else print('Превышение нагрузки!');
  }
}

// 4. Конвертация валют
class CurrencyConverter {
  static double convert(double amount, String from, String to) {
    // упрощённые курсы
    Map<String, double> rates = {
      'USD': 1.0,
      'EUR': 0.85,
      'RUB': 75.0,
    };
    if (!rates.containsKey(from) || !rates.containsKey(to)) return amount;
    double inUSD = amount / rates[from]!;
    return inUSD * rates[to]!;
  }
}

// 5. Гараж с дженериками
class Garage<T> {
  List<T> items = [];
  void store(T item) => items.add(item);
  T? retrieve(int index) => index < items.length ? items[index] : null;
}

// 6. Класс с перегрузкой арифметических операций
class Vector2 {
  double x, y;
  Vector2(this.x, this.y);

  Vector2 operator +(Vector2 other) => Vector2(x + other.x, y + other.y);
  Vector2 operator -(Vector2 other) => Vector2(x - other.x, y - other.y);
  Vector2 operator *(double scalar) => Vector2(x * scalar, y * scalar);
  Vector2 operator /(double scalar) => Vector2(x / scalar, y / scalar);
  bool operator ==(Object other) =>
      other is Vector2 && x == other.x && y == other.y;

  @override
  String toString() => 'Vector2($x, $y)';
}

// 7. Автомобиль с перечислениями
enum CarState { stop, moving, turning }

class Car {
  CarState state = CarState.stop;
  void drive() => state = CarState.moving;
  void turn() => state = CarState.turning;
  void stop() => state = CarState.stop;
  void showState() => print('Состояние: $state');
}

// 8. Геометрические фигуры
abstract class Shape {
  double area();
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);
  @override
  double area() => width * height;
}

class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);
  @override
  double area() => 0.5 * base * height;
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override
  double area() => 3.14159 * radius * radius;
}

// 9. Конвертер систем счисления
class NumberBaseConverter {
  static String fromDecimal(int number, int base) {
    if (base == 16) return number.toRadixString(16).toUpperCase();
    if (base == 8) return number.toRadixString(8);
    if (base == 10) return number.toString();
    return 'Unsupported base';
  }

  static int toDecimal(String value, int base) {
    return int.parse(value, radix: base);
  }
}

// 10. Список фигур с поиском максимальной площади
class ShapeCollection {
  List<Shape> shapes = [];
  void add(Shape shape) => shapes.add(shape);
  Shape? getMaxAreaShape() {
    if (shapes.isEmpty) return null;
    return shapes.reduce((a, b) => a.area() > b.area() ? a : b);
  }
}

// 11. Стол и столовые приборы
abstract class Cutlery {
  String name;
  Cutlery(this.name);
}

class Fork extends Cutlery { Fork() : super('Вилка'); }
class Spoon extends Cutlery { Spoon() : super('Ложка'); }
class Knife extends Cutlery { Knife() : super('Нож'); }

class Table {
  List<Cutlery> items = [];
  void put(Cutlery item) => items.add(item);
  bool remove(Cutlery item) => items.remove(item);
  void showItems() => print('На столе: ${items.map((c) => c.name).join(', ')}');
}

// Пример использования (можно закомментировать)
void main() {
  // 1
  var cup = Cup();
  var human = Human();
  human.drinkFromCup(cup, 30);

  // 2
  var cupboard = Cupboard();
  cupboard.addStorage(StorageSystem());
  cupboard.putItem('Книга', 0);
  print(cupboard.takeItem('Книга', 0));

  // 3
  var barbell = Barbell(100);
  barbell.addLeft(Plate(20));
  barbell.addRight(Plate(20));
  print('Текущий вес: ${barbell.currentLoad}');

  // 4
  print(CurrencyConverter.convert(100, 'USD', 'EUR'));

  // 5
  var garage = Garage<String>();
  garage.store('Велосипед');
  print(garage.retrieve(0));

  // 6
  var v1 = Vector2(1, 2);
  var v2 = Vector2(3, 4);
  print(v1 + v2);

  // 7
  var car = Car();
  car.drive();
  car.showState();

  // 8
  var rect = Rectangle(5, 10);
  print('Площадь прямоугольника: ${rect.area()}');

  // 9
  print(NumberBaseConverter.fromDecimal(255, 16)); // FF
  print(NumberBaseConverter.toDecimal('FF', 16)); // 255

  // 10
  var coll = ShapeCollection();
  coll.add(Circle(5));
  coll.add(Rectangle(4, 6));
  print('Макс площадь: ${coll.getMaxAreaShape()?.area()}');

  // 11
  var table = Table();
  table.put(Fork());
  table.put(Spoon());
  table.showItems();
}