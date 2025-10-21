import 'dart:io';

class Book{
  String _title;
  String _author;
  double _price;
  String _category;

  Book(this._title, this._author, this._price, this._category){
    if(_price <= 0) throw Exception('Gia khong hop le');
    if(!['Van hoc', 'Khoa hoc', 'Ky thuat'].contains(_category)){
      throw Exception('The loai khong hop le');
    }
  }

  String get title => _title;
  double get price => _price;
  String get category => _category;

  set price(double value) {
    if(value <= 0) throw Exception('Gia khong hop le');
    _price = value;
  }

  String getDetails() => '[$title]: $_author, $_category, Gia: $_price';
}

class Library{
  List<Book> _books = [];

  void addBook(Book book){
    _books.add(book);
  }

  void removeBook(String title){
    _books.removeWhere((book) => book.title == title);
  }

  List<Book> findBooksByCategory(String category) {
    return _books.where((book) => book.category == category).toList();
  }
  double calculateTotalValue(){
    return _books.fold(0, (sum, book) => sum + book.price);
  }
  List<Book> get books => _books;

 
}

 void enterBooks(Library library){
    print('Nhap sach moi.');

    stdout.write('Nhap title: ');
    var title = stdin.readLineSync() ?? '';
    stdout.write('Nhập Tác giả: ');
    var author = stdin.readLineSync() ?? '';

    while (true) {
    try {
      stdout.write('Nhập Giá (Ví dụ: 99.99): ');
      var priceInput = stdin.readLineSync();
      var price = double.parse(priceInput ?? '0'); 
      
      stdout.write('Nhập Thể loại (Van hoc/Khoa hoc/Ky thuat): ');
      var category = stdin.readLineSync() ?? '';
      
      var newBook = Book(title, author, price, category);
      library.addBook(newBook);
      
      print('✅ Đã thêm sách "$title" vào thư viện.');
      break; 
      
    } on FormatException {
      print('❌ Lỗi: Giá trị nhập vào không phải là số hợp lệ. Vui lòng thử lại.');
    } on Exception catch (e) {
      print('❌ Lỗi Logic: ${e.toString().replaceAll('Exception: ', '')}. Vui lòng thử lại.');
    }
  }
  }

void main(){
  var library = Library();
  print('Ban muon nhap may quyen sach?');
  int count = 0;

  var input = stdin.readLineSync();
  count = int.tryParse(input ?? '0') ?? 0;


for(int i = 1; i <= count; i++){
 enterBooks(library);
}
 

  print('\n--- THƯ VIỆN HIỆN TẠI ---');
  library.books.forEach((book) {
    print(book.getDetails());
  });
  print('Tổng giá trị sách: ${library.calculateTotalValue().toStringAsFixed(2)}');
}