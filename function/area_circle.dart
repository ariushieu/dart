import 'dart:math';

double calculateCircleArea(double radius){
    if(radius <= 0){
        print('Ban kinh khong hop le');
        return -1;
    }
    return pi * radius * radius;
}

void main(){
    double radius = 5.0;
    double area = calculateCircleArea(radius);
    if(area != -1){
        print('Dien tich hinh tron (r = $radius): ${area.toStringAsFixed(2)}');
    }
}