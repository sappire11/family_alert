class User {
  String? _account;
  // String? _email;
  String? _password;

  User({String? account, String? email, String? password}) {
    if (account != null) {
      this._account = account;
    }
    // if (email != null) {
    //   this._email = email;
    // }
    if (password != null) {
      this._password = password;
    }
  }

  String? get account => _account;
  set account(String? account) => _account = account;
  // String? get email => _email;
  // set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;

  User.fromJson(Map<String, dynamic> json) {
    _account = json['account'];
    // _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this._account;
    // data['email'] = this._email;
    data['password'] = this._password;
    return data;
  }
}