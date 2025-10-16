// import 'package:equatable/equatable.dart';
//
// class User extends Equatable {
//   final int id;
//   final String name;
//   final String email;
//
//   const User(
//     this.id,
//     this.name,
//     this.email,
//   );
//
//   @override
//   List<Object?> get props => [id, name, email];
//
//   // User Class > Reference > logical
//   // 재정의
//
//   // @override
//   // bool operator ==(Object other) {
//   //   // 1. 객체의 주소값이 같은지 먼저 비교
//   //   if (identical(this, other)) return true;
//   //   // 논리적인 개념 정의(개발자 직접 정의)
//   //   return other is User &&
//   //       other.id == id &&
//   //       other.name == name &&
//   //       other.email == email;
//   // }
//   //
//   // @override
//   // int get hashCode => Object.hash(id, name, email);
// }
//
// void main() {
//   User user1 = User(1, "Gil", "a@nate.com");
//   User user2 = User(1, "Gil", "a@nate.com");
//   User user3 = User(1, "Gil", "a@nate.com");
//
//   print(user1 == user2);
//   print(user1 == user3);
// }
