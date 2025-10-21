class Rectangle{
  double _length;
  double _width;

  Rectangle(this._length, this._width){
    if(_length <= 0 || _width <= 0) throw Exception ('Kich thuoc khong hop le');
  }

  Rectangle.square(double size) : _length = size, _width = size{
    if(size <= 0) throw Exception('Kich thuoc khong hop le');
  }

  double get length => _length;
  double get width => _width;

  set length(double value){
    if(value <= 0) throw Exception('Chieu dai khong hop le');
    _length = value;
  }

  set width(double value){
    if(value <= 0) throw Exception('Chieu rong khong hop le');
    _width = value;
  }

  double caculateArea() => _length * _width;
  double caculatePerimeter() => 2 * (_length + _width);

}

void main(){
  var rect = Rectangle(5.0, 3.0);
  var square = Rectangle.square(4.0);

  print('Hinh chu nhat: Chieu dai: ${rect.length}, chieu rong: ${rect.width}');
  print('Chu vi: ${rect.caculatePerimeter().toStringAsFixed(2)}, Dien tich: ${rect.caculateArea().toStringAsFixed(2)}');
  print('Hinh vuong: Chieu dai: ${square.length}, chieu rong: ${square.width}');
  print('Chu vi: ${square.caculatePerimeter().toStringAsFixed(2)}, Dien tich: ${square.caculateArea().toStringAsFixed(2)}');
}