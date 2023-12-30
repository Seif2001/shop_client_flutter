class User {
  String id;
  String phone;
  String password;
  String name;
  bool isStore;
  String address;
  
  User(
      {required this.id,
      required this.phone,
      required this.password,
      required this.name,
      required this.isStore,
      required this.address
      });
  User.empty()
      : id = '',
        phone = '',
        password = '',
        name = '',
        isStore = false,
        address = '';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      name: json['name'] ?? '',
      isStore: json['isStore'] ?? false,
      address: json['address'] ?? '',
    );
  }
}
