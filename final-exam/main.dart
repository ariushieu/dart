import 'dart:convert';

const String orderJsonString = '''
[{"Item": "A1000", "ItemName": "Iphone 15","Price": 1200,"Currency": "USD", "Quantity":1},
{"Item": "A1001", "ItemName": "Iphone 16","Price": 1500,"Currency": "USD", "Quantity":1}]
''';

class Order {
  final String item;
  final String itemName;
  final num price; 
  final int quantity;
  final String currency;

  Order({
    required this.item,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.currency,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      item: json['Item'] as String,
      itemName: json['ItemName'] as String,
      price: json['Price'] as num, 
      quantity: json['Quantity'] as int,
      currency: json['Currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Item': item,
      'ItemName': itemName,
      'Price': price,
      'Currency': currency,
      'Quantity': quantity,
    };
  }
}

void _displayOrders(List<Order> list, String title) {
  print('================================================================');
  print('  $title');
  print('================================================================');
  if (list.isEmpty) {
    print('  Không có đơn hàng nào.');
    return;
  }
  
  print('| ID      | Item Name           | Qty | Price       | Currency |');
  print('|---------|---------------------|-----|-------------|----------|');
  
  for (var order in list) {
    print(
      '| ${order.item.padRight(7)} | ${order.itemName.padRight(19)} | ${order.quantity.toString().padRight(3)} | ${order.price.toString().padRight(11)} | ${order.currency.padRight(8)} |'
    );
  }
  print('================================================================');
}

void main() {
  
  final List<dynamic> jsonList = jsonDecode(orderJsonString);
  List<Order> orders = jsonList.map((json) => Order.fromJson(json)).toList();

  _displayOrders(orders, 'Danh sách Đơn hàng Ban đầu');
  
  Order newOrder = Order(
    item: 'A1002',
    itemName: 'Macbook Air M3',
    price: 999.99, 
    currency: 'USD',
    quantity: 2,
  );
  
  orders.add(newOrder);

  _displayOrders(orders, 'Danh sách sau khi Thêm đơn hàng (Macbook Air M3)');
  
  String searchKeyword = 'Iphone'; 
  
   List<Order> searchResults = orders.where((order) {
    return order.itemName.toLowerCase().contains(searchKeyword.toLowerCase());
  }).toList();
  
  _displayOrders(searchResults, 'Kết quả Tìm kiếm với từ khóa: "$searchKeyword"');

  String emptySearchKeyword = 'Samsung';
  List<Order> emptySearchResults = orders.where((order) {
    return order.itemName.toLowerCase().contains(emptySearchKeyword.toLowerCase());
  }).toList();
  
  _displayOrders(emptySearchResults, 'Kết quả Tìm kiếm với từ khóa: "$emptySearchKeyword"');
}