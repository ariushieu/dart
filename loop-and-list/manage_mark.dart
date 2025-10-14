import 'dart:io';

void main() {
  print('Nhập số lượng học sinh: ');
  int n = int.parse(stdin.readLineSync()!);
  
  List<double> scores = [];
  
  for (int i = 0; i < n; i++) {
    print('Nhập điểm học sinh ${i + 1}: ');
    double score = double.parse(stdin.readLineSync()!);
    
    if (score >= 0 && score <= 10) {
      scores.add(score);
    } else {
      print('Điểm không hợp lệ');
      i--;
    }
  }
  
  int aboveAverage = 0;
  
  for (double score in scores) {
    if (score >= 5.0) {
      aboveAverage++;
    }
  }
  
  print('Danh sách điểm: ${scores.join(', ')}');
  print('Số học sinh trên trung bình: $aboveAverage');
}