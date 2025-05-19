class SupplierCompanyRegistrationModel {
  final String? type;
  final String? value;

  SupplierCompanyRegistrationModel({this.type, this.value});

  factory SupplierCompanyRegistrationModel.fromJson(Map<String, dynamic> json) {
    return SupplierCompanyRegistrationModel(
      type: json['type'],
      value: json['value'],
    );
  }
}
