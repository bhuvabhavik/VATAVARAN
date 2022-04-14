import 'dart:io';

void main() {
  methods();
}

void methods() async {
  task1();
  String numberFromTask2 = await task2();

  task3(numberFromTask2);
}

Future<String> task2() async {
  Duration duration = await Duration(seconds: 3);

  sleep(duration);
  print('task2');
  return 'data from task2 = 154';
}

void task3(String number) {
  print('task3 done with $number');
}

void task1() {
  print('task1');
}
