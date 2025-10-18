import 'dart:math';

double rectanglePerimeter(double length, double width) {
  if (length <= 0 || width <= 0) return -1;
  return 2 * (length + width);
}

double rectangleArea(double length, double width) {
  if (length <= 0 || width <= 0) return -1;
  return length * width;
}

double circlePerimeter(double radius) {
  if (radius <= 0) return -1;
  return 2 * pi * radius;
}

double circleArea(double radius) {
  if (radius <= 0) return -1;
  return pi * radius * radius;
}

double trianglePerimeter(double a, double b, double c) {
  if (a <= 0 || b <= 0 || c <= 0 || a + b <= c || b + c <= a || a + c <= b) return -1;
  return a + b + c;
}

double triangleArea(double a, double b, double c) {
  if (a <= 0 || b <= 0 || c <= 0 || a + b <= c || b + c <= a || a + c <= b) return -1;
  double s = (a + b + c) / 2;
  return sqrt(s * (s - a) * (s - b) * (s - c));
}

void main() {
  double rectLength = 5.0, rectWidth = 3.0;
  double radius = 4.0;
  double triA = 3.0, triB = 4.0, triC = 5.0;

  print(
      'Hình chữ nhật: Chu vi ${rectanglePerimeter(rectLength, rectWidth).toStringAsFixed(2)}, Diện tích ${rectangleArea(rectLength, rectWidth).toStringAsFixed(2)}');
  print(
      'Hình tròn: Chu vi ${circlePerimeter(radius).toStringAsFixed(2)}, Diện tích ${circleArea(radius).toStringAsFixed(2)}');
  print(
      'Hình tam giác: Chu vi ${trianglePerimeter(triA, triB, triC).toStringAsFixed(2)}, Diện tích ${triangleArea(triA, triB, triC).toStringAsFixed(2)}');
}