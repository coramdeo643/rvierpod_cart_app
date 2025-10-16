import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
  }) = _User;
}

void main() {
  User user1 = User(id: 1, name: "Gil", email: "a@naver.com");
  User user2 = User(id: 1, name: "Gil", email: "a@naver.com");
  print(user1 == user2);
  User user3 = user1.copyWith(name: "GilDong");
  print(user3.toString());
}
