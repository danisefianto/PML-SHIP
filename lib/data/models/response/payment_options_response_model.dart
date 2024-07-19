import 'dart:convert';

class PaymentOptionsResponseModel {
  final String status;
  final String message;
  final Data data;

  PaymentOptionsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PaymentOptionsResponseModel.fromJson(String str) =>
      PaymentOptionsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentOptionsResponseModel.fromMap(Map<String, dynamic> json) =>
      PaymentOptionsResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final int totalBill;
  final PaymentOptions paymentOptions;

  Data({
    required this.totalBill,
    required this.paymentOptions,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        totalBill: json["total_bill"],
        paymentOptions: PaymentOptions.fromMap(json["payment_options"]),
      );

  Map<String, dynamic> toMap() => {
        "total_bill": totalBill,
        "payment_options": paymentOptions.toMap(),
      };
}

class PaymentOptions {
  final PayAllAtOnce payAllAtOnce;
  final PayIn2Times payIn2Times;
  final PayIn3Times payIn3Times;

  PaymentOptions({
    required this.payAllAtOnce,
    required this.payIn2Times,
    required this.payIn3Times,
  });

  factory PaymentOptions.fromJson(String str) =>
      PaymentOptions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentOptions.fromMap(Map<String, dynamic> json) => PaymentOptions(
        payAllAtOnce: PayAllAtOnce.fromMap(json["payAllAtOnce"]),
        payIn2Times: PayIn2Times.fromMap(json["payIn2Times"]),
        payIn3Times: PayIn3Times.fromMap(json["payIn3Times"]),
      );

  Map<String, dynamic> toMap() => {
        "payAllAtOnce": payAllAtOnce.toMap(),
        "payIn2Times": payIn2Times.toMap(),
        "payIn3Times": payIn3Times.toMap(),
      };
}

class PayAllAtOnce {
  final int firstPayment;

  PayAllAtOnce({
    required this.firstPayment,
  });

  factory PayAllAtOnce.fromJson(String str) =>
      PayAllAtOnce.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayAllAtOnce.fromMap(Map<String, dynamic> json) => PayAllAtOnce(
        firstPayment: json["firstPayment"],
      );

  Map<String, dynamic> toMap() => {
        "firstPayment": firstPayment,
      };
}

class PayIn2Times {
  final int firstPayment;
  final int secondPayment;

  PayIn2Times({
    required this.firstPayment,
    required this.secondPayment,
  });

  factory PayIn2Times.fromJson(String str) =>
      PayIn2Times.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayIn2Times.fromMap(Map<String, dynamic> json) => PayIn2Times(
        firstPayment: json["firstPayment"],
        secondPayment: json["secondPayment"],
      );

  Map<String, dynamic> toMap() => {
        "firstPayment": firstPayment,
        "secondPayment": secondPayment,
      };
}

class PayIn3Times {
  final double firstPayment;
  final double secondPayment;
  final double thirdPayment;

  PayIn3Times({
    required this.firstPayment,
    required this.secondPayment,
    required this.thirdPayment,
  });

  factory PayIn3Times.fromJson(String str) =>
      PayIn3Times.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayIn3Times.fromMap(Map<String, dynamic> json) => PayIn3Times(
        firstPayment: json["firstPayment"]?.toDouble(),
        secondPayment: json["secondPayment"]?.toDouble(),
        thirdPayment: json["thirdPayment"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "firstPayment": firstPayment,
        "secondPayment": secondPayment,
        "thirdPayment": thirdPayment,
      };
}
