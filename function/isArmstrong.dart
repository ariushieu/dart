import 'dart:math';

bool isArmstrong(int n) {
  if (n <= 0) return false;
  int temp = n;
  int digits = n.toString().length;
  int sum = 0;
  while (temp > 0) {
    int digit = temp % 10;
    sum += pow(digit, digits).toInt();
    temp ~/= 10;
  }
  return sum == n;
}

void main() {
  int number = 153;
  print('$number ${isArmstrong(number) ? "la":"khong phai"} so Armstrong');
}