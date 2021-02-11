int getItemCount(Map<String, int> cart) {
  int total = 0;

  cart.keys.map((item) {
    total += cart[item];
  }).toList();

  return total;
}
