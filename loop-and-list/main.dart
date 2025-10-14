void main() {
    int a = 1;
    int b = 100;
    List<int> numbers = [];
    int sum = 0;
        for (int i = a; i <= b; i++) {
            if (i % 3 == 0 && i % 5 == 0) {
            numbers.add(i);
            sum += i;
        }
    }
    print('Các số chia hết cho 3 và 5 trong khoảng [$a, $b]:');
    print(numbers.join(', '));
    print('Tổng: $sum');
}