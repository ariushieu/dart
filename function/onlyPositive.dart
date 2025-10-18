int sumList(List<int> numbers, [bool onlyPositive = false]) {
  int sum = 0;
  
  for (int num in numbers) {
    if (onlyPositive && num <= 0) {
      continue;
    }
    sum += num;
  }
  
  return sum;
}

void main() {
  List<int> numbers = [-2, 3, -1, 5, 4];
  
  int total = sumList(numbers);

  int positiveTotal = sumList(numbers, true);
  
  print('Tổng danh sách: $total'); 
  print('Tổng số dương: $positiveTotal');
}