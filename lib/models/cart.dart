import 'package:mobx/mobx.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  final cart = ObservableMap<String, int>.of({});

  @action
  void update({String id, int itemCount}) {
    print('add to cart');
    cart[id] = itemCount;
  }

  @action
  void clear() {
    print('cart cleared');
    cart.clear();
  }
}
