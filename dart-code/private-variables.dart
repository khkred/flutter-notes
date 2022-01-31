void main() {
  var account1 = BankAccount("Mike", 1234, 985.23, "Hyderabad");

  print("The user name is ${account1.userName}");
  print("The account No is ${account1.accountNo}");
  print("The bank branch is ${account1.bankBranch}");

  print("\n===========\n");

  account1.bankBranch = "Pune";
  print("The new bank branch is ${account1.bankBranch}");

  account1.userName = "Mike1234";
  print("The new user name is ${account1.userName}");

  print("The user's bank balance is ${account1.balance}");
}

class BankAccount {
  String userName;
  int accountNo;
  double _accountBalance;
  String bankBranch;

  BankAccount(
      this.userName, this.accountNo, this._accountBalance, this.bankBranch);

  // This is a getter method.
  double get balance {
    return _accountBalance;
  }
}
