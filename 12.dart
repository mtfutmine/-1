int maxOfThree(int a, int b, int c) {
  if (a >= b && a >= c) return a;
  if (b >= a && b >= c) return b;
  return c;
}

int sumList(List<int> list) {
  int s = 0;
  for (var x in list) s += x;
  return s;
}

int productList(List<int> list) {
  int p = 1;
  for (var x in list) p *= x;
  return p;
}

List<int> removeDuplicates(List<int> list) {
  var res = <int>[];        
  for (var x in list) {          
    bool found = false;
    for (var y in res) {
      if (y == x) found = true;
    }
    if (!found) 
      res.add(x);
  }
  return res;          
}

int factorial(int n) {
  int f = 1;
  for (int i = 2; i <= n; i++) f *= i;
  return f;
}

bool contains(List<int> list, int value) {
  for (var x in list) if (x == value) return true;
  return false;
}

void printOddIndex(List<int> list) {
  for (int i = 1; i < list.length; i += 2) 
  print(list[i]);
}

List<int> reverse(List<int> list) {
  var rev = <int>[];
  for (int i = list.length - 1; i >= 0; i--) 
  rev.add(list[i]);
  return rev;
}

double average(List<int> list) {
  return sumList(list) / list.length;
}

int count(List<int> list, int value) {
  int c = 0;
  for (var x in list) 
    if (x == value) c++;
  return c;
}

void main() {
  var list = [1, 2, 3, 2, 4, 3, 5];
  print(maxOfThree(52, 67, 1488));
  print(sumList(list));
  print(productList(list));
  print(removeDuplicates(list));
  print(factorial(5));
  print(contains(list, 3));
  printOddIndex(list);
  print(reverse(list));
  print(average(list));
  print(count(list, 2));
}