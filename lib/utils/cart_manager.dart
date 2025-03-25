class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartManager {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(String name, double price) {
    final existingIndex = _items.indexWhere((item) => item.name == name);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(name: name, price: price));
    }
  }

  void removeItem(String name) {
    final existingIndex = _items.indexWhere((item) => item.name == name);
    if (existingIndex >= 0) {
      if (_items[existingIndex].quantity > 1) {
        _items[existingIndex].quantity--;
      } else {
        _items.removeAt(existingIndex);
      }
    }
  }

  void clearCart() {
    _items.clear();
  }
}
