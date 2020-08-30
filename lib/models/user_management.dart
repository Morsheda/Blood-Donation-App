class MyUsers {
  //final String userId;
  final String name;
  final String age;
  final String bloodGroup;
  final String lastDate;
  final String mobile;
  final String address;
  final String email;
  final String password;

  MyUsers(
      { //this.userId,
      this.name,
      this.age,
      this.bloodGroup,
      this.lastDate,
      this.mobile,
      this.address,
      this.email,
      this.password});

  Map<String, dynamic> toMap() {
    return {
      //'userId': this.userId,
      'name': this.name,
      'age': this.age,
      'bloodGroup': this.bloodGroup,
      'last date of donation': this.lastDate,
      'mobile': this.mobile,
      'address': this.address,
      'email': this.email,
      'password': this.password
    };
  }
}
