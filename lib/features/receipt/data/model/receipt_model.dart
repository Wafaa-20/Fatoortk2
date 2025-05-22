class ReceiptModel {
  final String? imagePath;
  final String? warrantyDuration;
  final String? importantInfo;
  //Purchase Info
  final String? documentType;
  final String? purchaseDate;
  final String? purchaseTime;
  final String? expenseLocale; //Country
  final String? purchaseCategory;
  final String? purchaseSubcategory;
  // Receipt Identification
  final String? receiptNumber;
  final double? imageOrientation;

  // Supplier Info
  final String? supplierName;
  final String? supplierAddress;
  final String? supplierPhoneNumber;

  // Financial
  final double? totalAmount;
  final double? totalNet;
  final double? totalTax;
  final double? tipAndGratuity;

  ReceiptModel({
    this.imagePath,
    this.warrantyDuration,
    this.importantInfo,
    this.supplierName,
    this.supplierAddress,
    this.supplierPhoneNumber,
    this.receiptNumber,
    this.imageOrientation,
    this.totalAmount,
    this.totalNet,
    this.totalTax,
    this.tipAndGratuity,

    this.documentType,
    this.purchaseDate,
    this.purchaseTime,
    this.expenseLocale,
    this.purchaseCategory,
    this.purchaseSubcategory,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    final prediction = json['document']['inference']['prediction'];
    return ReceiptModel(
      supplierName: prediction['supplier_name']?['value'],
      supplierAddress: prediction['supplier_address']?['value'],
      supplierPhoneNumber: prediction['supplier_phone_number']?['value'],

      receiptNumber: prediction['receipt_number']?['value'],
      imageOrientation:
          prediction['image_orientation']?['value']?.toDouble() ?? 0.0,
      totalAmount: prediction['total_amount']?['value']?.toDouble(),
      totalNet: prediction['total_net']?['value']?.toDouble(),
      totalTax: prediction['total_tax']?['value']?.toDouble(),
      tipAndGratuity: prediction['tip']?['value']?.toDouble(),

      documentType: prediction['document_type']?['value'],
      purchaseDate: prediction['date']?['value'],
      purchaseTime: prediction['time']?['value'],
      expenseLocale: prediction['locale']?['value'],
      purchaseCategory: prediction['category']?['value'],
      purchaseSubcategory: prediction['subcategory']?['value'],
    );
  }
}
