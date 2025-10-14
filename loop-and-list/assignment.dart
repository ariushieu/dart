import 'dart:io';

void main() {
  List<Map<String, dynamic>> products = [];
  int n = 5; // Giả lập nhập 5 sản phẩm
  
  // Nhập dữ liệu
  for (int i = 0; i < n; i++) {
    print('Nhập tên sản phẩm ${i + 1}: ');
    String? name = stdin.readLineSync();
    
    print('Nhập giá: ');
    double price = double.parse(stdin.readLineSync()!);
    
    print('Nhập số lượng tồn kho: ');
    int quantity = int.parse(stdin.readLineSync()!);
    
    if (price <= 0 || quantity < 0) {
      print('Dữ liệu không hợp lệ');
      i--;
      continue;
    }
    
    products.add({'name': name, 'price': price, 'quantity': quantity});
  }
  
  // Tính tổng giá trị kho
  double totalValue = 0;
  for (var product in products) {
    totalValue += product['price'] * product['quantity'];
  }
  
  // Chuong_2_Vong_lap_va_Danh_sach.markdown 2025-10-1110 / 12
  
  // Tìm giá cao nhất và thấp nhất
  var maxProduct = products[0];
  var minProduct = products[0];
  
  for (var product in products) {
    if (product['price'] > maxProduct['price']) {
      maxProduct = product;
    }
    if (product['price'] < minProduct['price']) {
      minProduct = product;
    }
  }
  
  // Lọc sản phẩm tồn kho thấp
  List<Map<String, dynamic>> lowStock = products.where((p) => p['quantity'] < 10).toList();
  lowStock.sort((a, b) => a['price'].compareTo(b['price']));
  
  // In kết quả
  print('Danh sách sản phẩm:');
  for (var product in products) {
    print('${product['name']}: Giá ${product['price']}, Tồn kho ${product['quantity']}');
  }
  
  print('Tổng giá trị kho: ${totalValue.toStringAsFixed(2)}');
  print('Sản phẩm giá cao nhất: ${maxProduct['name']}, Giá ${maxProduct['price']}');
  print('Sản phẩm giá thấp nhất: ${minProduct['name']}, Giá ${minProduct['price']}');
  
  print('Sản phẩm tồn kho thấp (<10):');
  for (var product in lowStock) {
    print('${product['name']}: Giá ${product['price']}');
  }
} 


//use DartPad

// void main() { 
//   List<Map<String, dynamic>> products = [
//     {'name': 'Laptop', 'price': 1500.0, 'quantity': 5}, 
//     {'name': 'Điện thoại', 'price': 800.0, 'quantity': 12}, 
//     {'name': 'Tai nghe', 'price': 100.0, 'quantity': 8}, 
//     {'name': 'Bàn phím', 'price': 50.0, 'quantity': 20}, 
//     {'name': 'Chuột', 'price': 30.0, 'quantity': 15}
//   ]; 
  
//   double totalValue = 0;
//   for (var product in products) {
//     totalValue += product['price'] * product['quantity'];
//   } 
  
//   var maxProduct = products[0]; 
//   var minProduct = products[0];
  
//   for (var product in products) {
//     if (product['price'] > maxProduct['price']) {
//       maxProduct = product; 
//     }
//     if (product['price'] < minProduct['price']) {
//       minProduct = product; 
//     } 
//   }
  
//   List<Map<String, dynamic>> lowStock = products.where((p) => p['quantity'] < 10).toList(); 
//   lowStock.sort((a, b) => a['price'].compareTo(b['price']));
  
//   print('Danh sách sản phẩm:'); 
//   for (var product in products) {
//     print('${product['name']}: Giá ${product['price']}, Tồn kho ${product['quantity']}');
//   }
  
//   print('Tổng giá trị kho: ${totalValue.toStringAsFixed(2)}'); 
//   print('Sản phẩm giá cao nhất: ${maxProduct['name']}, Giá ${maxProduct['price']}');
//   print('Sản phẩm giá thấp nhất: ${minProduct['name']}, Giá ${minProduct['price']}');
  
//   print('Sản phẩm tồn kho thấp (<10):');
//   for (var product in lowStock) {
//     print('${product['name']}: Giá ${product['price']}');
//   }
// }