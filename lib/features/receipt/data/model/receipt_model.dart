import 'package:project4/features/receipt/data/model/line_item_model.dart';
import 'package:project4/features/receipt/data/model/supplier_company_registration_model.dart';
import 'package:project4/features/receipt/data/model/taxes_model.dart';

class ReceiptModel {
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
  final List<SupplierCompanyRegistrationModel>? supplierCompanyRegistrations;

  // Financial
  final double? totalAmount;
  final double? totalNet;
  final double? totalTax;
  final double? tipAndGratuity;
  final List<TaxesModel>? taxes;

  // Items
  final List<LineItemModel>? lineItems;

  ReceiptModel({
    this.supplierName,
    this.supplierAddress,
    this.supplierPhoneNumber,
    this.supplierCompanyRegistrations,
    this.receiptNumber,
    this.imageOrientation,
    this.totalAmount,
    this.totalNet,
    this.totalTax,
    this.tipAndGratuity,
    this.taxes,
    this.documentType,
    this.purchaseDate,
    this.purchaseTime,
    this.expenseLocale,
    this.purchaseCategory,
    this.purchaseSubcategory,
    this.lineItems,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    final prediction = json['document']['inference']['prediction'];
    return ReceiptModel(
      supplierName: prediction['supplier_name']?['value'],
      supplierAddress: prediction['supplier_address']?['value'],
      supplierPhoneNumber: prediction['supplier_phone_number']?['value'],
      supplierCompanyRegistrations:
          prediction['supplier_company_registrations'] != null
              ? List<SupplierCompanyRegistrationModel>.from(
                prediction['supplier_company_registrations'].map(
                  (e) => SupplierCompanyRegistrationModel.fromJson(e),
                ),
              )
              : null,
      receiptNumber: prediction['receipt_number']?['value'],
      imageOrientation:
          prediction['image_orientation']?['value']?.toDouble() ?? 0.0,
      totalAmount: prediction['total_amount']?['value']?.toDouble(),
      totalNet: prediction['total_net']?['value']?.toDouble(),
      totalTax: prediction['total_tax']?['value']?.toDouble(),
      tipAndGratuity: prediction['tip']?['value']?.toDouble(),
      taxes:
          prediction['taxes'] != null
              ? List<TaxesModel>.from(
                prediction['taxes'].map((e) => TaxesModel.fromJson(e)),
              )
              : null,
      documentType: prediction['document_type']?['value'],
      purchaseDate: prediction['date']?['value'],
      purchaseTime: prediction['time']?['value'],
      expenseLocale: prediction['locale']?['value'],
      purchaseCategory: prediction['category']?['value'],
      purchaseSubcategory: prediction['subcategory']?['value'],
      lineItems:
          prediction['line_items'] != null
              ? List<LineItemModel>.from(
                prediction['line_items'].map((e) => LineItemModel.fromJson(e)),
              )
              : null,
    );
  }
}
