import 'package:flutter/foundation.dart';
import './item.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart. Stores the ids of each item.
  Map<Item, int> _items = {};

  set item(List<Item> items) {
    _items = {};
    for (var item in items) {
      _items[item] = 0;
    }
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of items in the cart.
  Map<Item, int> get items => _items;

  /// The current total price of all items.
  double get totalPrice {
    double total = 0;
    for (var item in _items.keys) {
      total += item.price * _items[item]!;
    }
    return total;
  }

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    if (!_items.containsKey(item)) {
      _items.putIfAbsent(item, () => 0);
    }
    _items[item] = _items[item]! + 1;
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  int getCount(Item item) {
    if (!_items.containsKey(item)) {
      _items.putIfAbsent(item, () => 0);
    }
    return _items[item]!;
  }

  void remove(Item item) {
    if (!_items.containsKey(item)) {
      return;
    }
    if (_items[item] == 1) {
      _items.remove(item);
      notifyListeners();
      return;
    }
    _items[item] = _items[item]! - 1;
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }
}
