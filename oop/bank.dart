class BankAccount{
  String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance){
    if(_balance < 0) throw Exception('So du ban dau khong hop le');
  }

  String get accountNumber => _accountNumber;
  double get balance => _balance;

  void deposit(double amount) {
    if(amount <= 0) throw Exception('So tien nap khong hop le');
    _balance += amount;
  }

  void withdraw(double amount){
    if(amount <= 0) throw Exception('So tien rut khong hop le');
    if(_balance < amount) throw Exception('So du khong du');
    _balance -= amount;
  }
}


  void main(){
    var account = BankAccount('123456789', 1000.0);
    account.deposit(500.0);
    account.withdraw(200.0);

    print('Tai khoan: ${account.accountNumber}');
    print('So du: ${account.balance.toStringAsFixed(2)}');
  }