import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_flutter/data/sample_product.dart';

import '../models/product.dart';

// 창고 관리자
// Provider : Read Only data provide
// 읽기 전용 데이터를 보관할때 Provider 사용가능
final productListProvider = Provider<List<Product>>((ref) {
  // ref 파라미터는 다른 provider를 참조할때 사용할수 있다
  return sampleProducts;
});
