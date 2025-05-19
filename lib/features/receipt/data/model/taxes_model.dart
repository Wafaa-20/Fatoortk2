class TaxesModel {
  final double? value;
  final double? base;
  final double? rate;
  final String? code;

  TaxesModel({this.value, this.base, this.rate, this.code});

  factory TaxesModel.fromJson(Map<String, dynamic> json) {
    return TaxesModel(
      value: (json['value'] ?? 0).toDouble(),
      base: (json['base'] ?? 0).toDouble(),
      rate: (json['rate'] ?? 0).toDouble(),
      code: json['code'],
    );
  }
}
