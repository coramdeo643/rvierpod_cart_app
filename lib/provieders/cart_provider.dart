import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_flutter/models/cart_item.dart';
import 'package:work_flutter/models/cart_state.dart';
import 'package:work_flutter/models/product.dart';

//창고 데이터(Cart State) in models package
// 창고 관리자(비즈니스 로직 + 창고 데이터 = state)
class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return const CartState();
  }

  // 장바구니 상품 추가
  void addProduct(Product productToAdd) {
    // 1. 기존 장바구니 가져와서 새 리스트 선언한다
    List<CartItem> copiedProductList = List.from(state.items);
    // Riverpod = 참조 주소(메모리 주소)를 비교해서 상태변경을 감지한다
    // 상태 관리 : 정확히 리버팟이 상태 변경을 감지하기 위함이다
    for (int i = 0; i < copiedProductList.length; i++) {
      // 1. 기존 상품을 찾았다면 수량을 1로 증가시켜줘야한다
      if (productToAdd.id == copiedProductList[i].product.id) {
        CartItem exisitingItem = copiedProductList[i];
        copiedProductList[i] =
            exisitingItem.copyWith(quantity: exisitingItem.quantity + 1);
        state = state.copyWith(items: copiedProductList);
        return; // Early return pattern
      }
    }
    // 여기까지 코드가 오면 새로운 상품(기존장바구니에 없는)이니까 장바구니 추가
    copiedProductList.add(CartItem(product: productToAdd));
    state = state.copyWith(items: copiedProductList);
    // Riverpod state management core (old Data) = new Data
  }

  // 장바구니 상품 삭제
  void removeProduct(int productId) {
    List<CartItem> copiedProductList = List.from(state.items);
    // 해당 상품을 찾아서 제거
    for (int i = 0; i < copiedProductList.length; i++) {
      if (copiedProductList[i].product.id == productId) {
        copiedProductList.removeAt(i);
        state = state.copyWith(items: copiedProductList);
        return; //
      }
    }
  }

  // 장바구니 상품 수정
  void updateQuantity(int productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeProduct(productId);
      return;
    }
    List<CartItem> copiedProductList = List.from(state.items);
    for (int i = 0; i < copiedProductList.length; i++) {
      if (copiedProductList[i].product.id == productId) {
        copiedProductList[i] =
            copiedProductList[i].copyWith(quantity: newQuantity);
        state = state.copyWith(items: copiedProductList);
        return; //
      }
    }
  }
}

// 3. 창고 생성
final cartProvider =
    NotifierProvider<CartNotifier, CartState>(() => CartNotifier());

// 4. Side effect
final cartItemCountProvider = Provider<int>((ref) {
  final cartState = ref.watch(cartProvider);
  final cartItems = cartState.items;
  int totalQuantity = 0;
  for (var item in cartItems) {
    totalQuantity += item.quantity;
  }
  return totalQuantity;
});

// 5. Side effect
final cartTotalPriceProvider = Provider<int>((ref) {
  // 직접 각 아이템의 상품 * 가격을 관리하는 창고 만들고 화면에 표시
  final cartState = ref.watch(cartProvider);
  final cartItems = cartState.items;
  int totalPrice = 0;
  for (var item in cartItems) {
    totalPrice += (item.quantity * item.product.price);
  }
  return totalPrice;
});
