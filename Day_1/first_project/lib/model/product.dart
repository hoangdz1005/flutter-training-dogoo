class Product {
  late String name;
  late double price;
  late int quantity;
  Product(this.name, this.price, [this.quantity = 0]);
  double getTotalPrice() {
    return price * quantity;
  }
}