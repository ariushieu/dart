void main() {
  int n = 145;
  int temp = n;
  int factorialSum = 0;
  
  while(temp > 0) {
    int digit = temp % 10;
    int fact = 1;
    for (int i = 1; i <= digit; i++){
      fact *= i;
    }
    factorialSum += fact;
    temp ~/=10;
  }
  print('Giai thừa của $n: ${calculateFactorial(n)}');
  print('$n ${factorialSum == n ? "là" : "không phải"} số mạnh');
}

int calculateFactorial(int n){
  int result = 1;
  while(n > 0){
    result *= n;
    n--;
  }
  return result;
}