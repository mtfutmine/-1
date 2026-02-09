import 'dart:math';
import 'dart:io';

void main() {
  print('Введите 1-е число:');
  String input1 = stdin.readLineSync() ?? '';
  double num1 = double.tryParse(input1) ?? 0.0;
  
  print('Введите 2-е число:');
  String input2 = stdin.readLineSync() ?? '';
  double num2 = double.tryParse(input2) ?? 0.0;
  
  print('Выберите операцию:');
  print('+ сложение');
  print('- вычитание');
  print('* умножение');
  print('/ деление');
  print('~/ целочисленное деление');
  print('% остаток от деления');
  print('^ возведение в степень');
  print('== равно');
  print('!= не равно');
  print('> больше');
  print('< меньше');
  print('>= больше или равно');
  print('<= меньше или равно');
  
  String operation = stdin.readLineSync() ?? '';
  
  switch(operation) {
    case '+':
      print('Результат: ${num1 + num2}');
      break;
    case '-':
      print('Результат: ${num1 - num2}');
      break;
    case '*':
      print('Результат: ${num1 * num2}');
      break;
    case '/':
      if(num2 != 0) {
        print('Результат: ${num1 / num2}');
      } else {
        print('Ошибка: деление на ноль');
      }
      break;
    case '~/':
      if(num2 != 0) {
        print('Результат: ${num1 ~/ num2}');
      } else {
        print('Ошибка: деление на ноль');
      }
      break;
    case '%':
      if(num2 != 0) {
        print('Результат: ${num1 % num2}');
      } else {
        print('Ошибка: деление на ноль');
      }
      break;
    case '^':
      print('Результат: ${pow(num1, num2)}');
      break;
    case '==':
      print('Результат: ${num1 == num2}');
      break;
    case '!=':
      print('Результат: ${num1 != num2}');
      break;
    case '>':
      print('Результат: ${num1 > num2}');
      break;
    case '<':
      print('Результат: ${num1 < num2}');
      break;
    case '>=':
      print('Результат: ${num1 >= num2}');
      break;
    case '<=':
      print('Результат: ${num1 <= num2}');
      break;
    default:
      print('Неизвестная операция');
  }
}