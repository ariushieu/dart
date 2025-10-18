List<int> generateFibonacci(int n) {
  if (n <= 0) return [];
  List<int> fib = [0, 1];
  if (n == 1) return [0];
  
  for (int i = 2; i < n; i++) {
    fib.add(fib[i - 1] + fib[i - 2]);
  }
  
  return fib;
}

bool isFibonacciNumber(int x) {
  if (x < 0) return false;
  int a = 0, b = 1;
  
  while (a <= x) {
    if (a == x) return true;
    int temp = a + b;
    a = b;
    b = temp;
  }
  
  return false;
}

void main() {
  int n = 10;
  int x = 8;
  
  List<int> fibSequence = generateFibonacci(n);
  
  print('Dãy Fibonacci đến số thứ $n: ${fibSequence.join(', ')}');
  print('Số $x ${isFibonacciNumber(x) ? "thuộc" : "không thuộc"} dãy Fibonacci');
}