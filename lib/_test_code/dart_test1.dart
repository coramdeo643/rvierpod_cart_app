void main() {
  var p1 = Product(id: 1, name: 'iPhone 16');
  var p2 = Product(id: 1, name: 'iPhone 16');
  var p3 = p1;

  print(p1 == p2);
  var mySet = {p1, p2};
  print(mySet.length);

  /*
  참조 동일성
  컴퓨터 기본적으로 객체의 같음 여부를 참조 동일성을 비교한다
  논리적으로 같은 객체다 라고 판단해야하는 경우,
  논리적 동등성을 클래스를 설계가능
   */

  /*
  참조 동일성 : 메모리 주소가 같으면, 같은 객체로 판단한다.
  논리적 동일성 : 속성 값들이 같으면, 같은 객체로 판단한다.
   */
}

class Product {
  int id;
  String name;
  Product({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  // == 재정의, 반드시 hashCode 재정의 필수
  @override
  int get hashCode => id.hashCode;
}
