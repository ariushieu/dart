import 'dart:io';

List<Map<String, dynamic>> inputBooks(int count) {
  List<Map<String, dynamic>> books = [];
  List<String> validGenres = ['Văn học', 'Khoa học', 'Kỹ thuật'];
  
  for (int i = 0; i < count; i++) {
    print('Nhập tên sách ${i + 1}: ');
    String? name = stdin.readLineSync();
    
    print('Nhập giá: ');
    double price = double.parse(stdin.readLineSync()!);
    
    print('Nhập số lượng: ');
    int quantity = int.parse(stdin.readLineSync()!);
    
    print('Nhập thể loại (Văn học, Khoa học, Kỹ thuật): ');
    String? genre = stdin.readLineSync();
    
    if (price <= 0 || quantity < 0 || !validGenres.contains(genre)) {
      print('Dữ liệu không hợp lệ');
      i--;
      continue;
    }
    
    books.add({'name': name, 'price': price, 'quantity': quantity, 'genre': genre});
  }
  return books;
}

double calculateTotalValue(List<Map<String, dynamic>> books) {
  double total = 0;
  
  for (var book in books) {
    total += book['price'] * book['quantity'];
  }
  
  return total;
}

Map<String, dynamic>? findMostExpensiveBook(
    List<Map<String, dynamic>> books, [String? genre]) {
  
  List<Map<String, dynamic>> filteredBooks = genre == null 
      ? books 
      : books.where((b) => b['genre'] == genre).toList();
  
  if (filteredBooks.isEmpty) return null;
  
  return filteredBooks.reduce((a, b) => a['price'] > b['price'] ? a : b);
}

List<Map<String, dynamic>> filterLowStockBooks(List<Map<String, dynamic>> books) {
  var lowStock = books.where((b) => b['quantity'] < 5).toList();
  lowStock.sort((a, b) => b['price'].compareTo(a['price']));
  return lowStock;
}

void main() {
  List<Map<String, dynamic>> books = inputBooks(3);
  double totalValue = calculateTotalValue(books);
  var mostExpensive = findMostExpensiveBook(books, 'Văn học');
  var lowStockBooks = filterLowStockBooks(books);
  
  print('Danh sách sách:');
  for (var book in books) {
    print('${book['name']}, Giá: ${book['price']}, Số lượng: ${book['quantity']}, Thể loại: ${book['genre']}');
  }
  
  print('Tổng giá trị kho: ${totalValue.toStringAsFixed(2)}');
  
  if (mostExpensive != null) {
    print('Sách giá cao nhất (thể loại Văn học): ${mostExpensive['name']}, Giá: ${mostExpensive['price']}');
  } else {
    print('Không có sách thể loại Văn học');
  }
  
  print('Sách tồn kho thấp (<5):');
  for (var book in lowStockBooks) {
    print('${book['name']}, Giá: ${book['price']}');
  }
}