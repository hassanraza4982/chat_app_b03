class UserModel{
  String id;
  String token;
  String? userId;
  String? userName;
  String? userEmail;
  String? userDpUrl; // ? dp = display picture or profile picture url
  String? password;
  bool? isOnline;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.id,
    required this.token,
    this.userId,
    this.userName,
    this.userEmail,
    this.userDpUrl,
    this.password,
    this.isOnline,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          token == other.token &&
          userId == other.userId &&
          userName == other.userName &&
          userEmail == other.userEmail &&
          userDpUrl == other.userDpUrl &&
          password == other.password &&
          isOnline == other.isOnline);

  @override
  int get hashCode =>
      id.hashCode ^
      token.hashCode ^
      userId.hashCode ^
      userName.hashCode ^
      userEmail.hashCode ^
      userDpUrl.hashCode ^
      password.hashCode ^
      isOnline.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' id: $id,' +
        ' token: $token,' +
        ' userId: $userId,' +
        ' userName: $userName,' +
        ' userEmail: $userEmail,' +
        ' userDpUrl: $userDpUrl,' +
        ' password: $password,' +
        ' isOnline: $isOnline,' +
        '}';
  }

  UserModel copyWith({
    String? id,
    String? token,
    String? userId,
    String? userName,
    String? userEmail,
    String? userDpUrl,
    String? password,
    bool? isOnline,
  }) {
    return UserModel(
      id: id ?? this.id,
      token: token ?? this.token,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userDpUrl: userDpUrl ?? this.userDpUrl,
      password: password ?? this.password,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'token': this.token,
      'userId': this.userId,
      'userName': this.userName,
      'userEmail': this.userEmail,
      'userDpUrl': this.userDpUrl,
      'password': this.password,
      'isOnline': this.isOnline,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      token: map['token'] as String,
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
      userDpUrl: map['userDpUrl'] as String,
      password: map['password'] as String,
      isOnline: map['isOnline'] as bool,
    );
  }

//</editor-fold>
}
