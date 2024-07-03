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
  final PayAllAtOnce payAllAtOnce;
  final PayIn2Times payIn2Times;
  final PayIn3Times payIn3Times;

  Data({
    required this.payAllAtOnce,
    required this.payIn2Times,
    required this.payIn3Times,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
  final num firstPayment;

  PayAllAtOnce({
    required this.firstPayment,
  });

  factory PayAllAtOnce.fromJson(String str) =>
      PayAllAtOnce.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayAllAtOnce.fromMap(Map<String, dynamic> json) => PayAllAtOnce(
        firstPayment: json["firstPayment"] is int
            ? json["firstPayment"]
            : (json["firstPayment"] as double).toInt(),
      );

  Map<String, dynamic> toMap() => {
        "firstPayment": firstPayment,
      };
}

class PayIn2Times {
  final num firstPayment;
  final num secondPayment;

  PayIn2Times({
    required this.firstPayment,
    required this.secondPayment,
  });

  factory PayIn2Times.fromJson(String str) =>
      PayIn2Times.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayIn2Times.fromMap(Map<String, dynamic> json) => PayIn2Times(
        firstPayment: json["firstPayment"] is int
            ? json["firstPayment"]
            : (json["firstPayment"] as double).toInt(),
        secondPayment: json["secondPayment"] is int
            ? json["secondPayment"]
            : (json["secondPayment"] as double).toInt(),
      );

  Map<String, dynamic> toMap() => {
        "firstPayment": firstPayment,
        "secondPayment": secondPayment,
      };
}

class PayIn3Times {
  final num firstPayment;
  final num secondPayment;
  final num thirdPayment;

  PayIn3Times({
    required this.firstPayment,
    required this.secondPayment,
    required this.thirdPayment,
  });

  factory PayIn3Times.fromJson(String str) =>
      PayIn3Times.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayIn3Times.fromMap(Map<String, dynamic> json) => PayIn3Times(
        firstPayment: json["firstPayment"] is int
            ? json["firstPayment"]
            : (json["firstPayment"] as double).toInt(),
        secondPayment: json["secondPayment"] is int
            ? json["secondPayment"]
            : (json["secondPayment"] as double).toInt(),
        thirdPayment: json["thirdPayment"] is int
            ? json["thirdPayment"]
            : (json["thirdPayment"] as double).toInt(),
      );

  Map<String, dynamic> toMap() => {
        "firstPayment": firstPayment,
        "secondPayment": secondPayment,
        "thirdPayment": thirdPayment,
      };
}
