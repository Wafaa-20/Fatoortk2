class LineItemModel {
  final String? description;
  final double? quantity;
  final double? unitPrice;
  final double? totalAmount;

  LineItemModel({this.description, this.quantity, this.unitPrice, this.totalAmount});

  factory LineItemModel.fromJson(Map<String, dynamic> json) {
    return LineItemModel(
      description: json['description'],
      quantity: (json['quantity'] ?? 0).toDouble(),
      unitPrice: (json['unit_price'] ?? 0).toDouble(),
      totalAmount: (json['total_amount'] ?? 0).toDouble(),
    );
  }
}
