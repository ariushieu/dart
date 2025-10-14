void main() {
  List<String> names = ['Cường', 'An', 'Bình', 'Đức', 'Hùng'];
  List<String> ascending = List.from(names)..sort();
  List<String> descending = List.from(names)..sort((a, b) => b.compareTo(a));
  
  print('Danh sách gốc: ${names.join(', ')}');
  print('Tăng dần: ${ascending.join(', ')}');
  print('Giảm dần: ${descending.join(', ')}');
}