List<String> processNames(List<String> names, String Function(String) processor) {
  return names.map(processor).toList();
}

void main() {
  List<String> names = ['An', 'Bình', 'Cường']; 

  var uppercaseNames = processNames(
    names, 
    (name) => name.toUpperCase()
  ); 

  var prefixedNames = processNames(
    names, 
    (name) => 'Mr./Ms. $name'
  );

  print('Danh sách in hoa: ${uppercaseNames.join(', ')}');
  print('Danh sách với tiền tố: ${prefixedNames.join(', ')}');
}