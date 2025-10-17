import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState(
      {
      // 장바구니에 담긴 상품 목록
      @Default([]) List<CartItem> items,
      // Loading state
      @Default(false) bool isLoading,
      String? error}) = _CartState;
}
