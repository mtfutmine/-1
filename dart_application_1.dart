void main() {
  List<String> students = ['Владислав', 'Аким', 'Иван', 'Алевдин', 'Никита', 'Павел'];
  List<String> subjects = ['ОАИП', 'ОСИС', 'РПМ', 'РМП'];

  Map<String, Map<String, int>> grades = {
    'Владислав': {'ОАИП': 5, 'ОСИС': 4, 'РПМ': 5, 'РМП': 4},
    'Аким': {'ОАИП': 3, 'ОСИС': 4, 'РПМ': 3, 'РМП': 5},
    'Иван': {'ОАИП': 4, 'ОСИС': 5, 'РПМ': 4, 'РМП': 4},
    'Алевдин': {'ОАИП': 5, 'ОСИС': 5, 'РПМ': 5, 'РМП': 5},
    'Никита': {'ОАИП': 2, 'ОСИС': 3, 'РПМ': 4, 'РМП': 3},
    'Павел': {'ОАИП': 4, 'ОСИС': 4, 'РПМ': 4, 'РМП': 4},
  };

  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]}');
  }
  print('');

  for (int i = 0; i < subjects.length; i++) {
    print('${i + 1}. ${subjects[i]}');
  }
  print('');

  for (var student in students) {
    var studentGrades = grades[student]!;
    for (var subject in subjects) {
      print('$student — $subject: ${studentGrades[subject]}');
    }
  }
  print('');

  for (var subject in subjects) {
    double sum = 0;
    for (var student in students) {
      sum += grades[student]![subject]!;
    }
    double avg = sum / students.length;
    print('$subject: ${avg.toStringAsFixed(2)}');
  }
  print('');

  for (var student in students) {
    double sum = 0;
    var studentGrades = grades[student]!;
    for (var subject in subjects) {
      sum += studentGrades[subject]!;
    }
    double avg = sum / subjects.length;
    print('$student: ${avg.toStringAsFixed(2)}');
  }
  print('');

  String bestStudent = '';
  double bestAvg = 0;
  for (var student in students) {
    double sum = 0;
    for (var subject in subjects) {
      sum += grades[student]![subject]!;
    }
    double avg = sum / subjects.length;
    if (avg > bestAvg) {
      bestAvg = avg;
      bestStudent = student;
    }
  }
  print('$bestStudent ${bestAvg.toStringAsFixed(2)}');
  print('');

  String worstSubject = '';
  double worstAvg = double.infinity;
  for (var subject in subjects) {
    double sum = 0;
    for (var student in students) {
      sum += grades[student]![subject]!;
    }
    double avg = sum / students.length;
    if (avg < worstAvg) {
      worstAvg = avg;
      worstSubject = subject;
    }
  }
  print('$worstSubject ${worstAvg.toStringAsFixed(2)}');
  print('');

  double totalSum = 0;
  int totalCount = 0;
  for (var student in students) {
    for (var subject in subjects) {
      totalSum += grades[student]![subject]!;
      totalCount++;
    }
  }
  double overallAvg = totalSum / totalCount;
  print(overallAvg.toStringAsFixed(2));
  print('');

  print('${subjects.length} $subjects');
  print('');

  List<String> noTwos = [];
  for (var student in students) {
    bool hasTwo = false;
    var studentGrades = grades[student]!;
    for (var subject in subjects) {
      if (studentGrades[subject] == 2) {
        hasTwo = true;
        break;
      }
    }
    if (!hasTwo) {
      noTwos.add(student);
    }
  }
  print(noTwos.isEmpty ? 'нет' : noTwos.join(', '));
  print('');

  List<String> allFourPlus = [];
  for (var student in students) {
    bool allOk = true;
    var studentGrades = grades[student]!;
    for (var subject in subjects) {
      if (studentGrades[subject]! < 4) {
        allOk = false;
        break;
      }
    }
    if (allOk) {
      allFourPlus.add(student);
    }
  }
  print(allFourPlus.isEmpty ? 'нет' : allFourPlus.join(', '));
}