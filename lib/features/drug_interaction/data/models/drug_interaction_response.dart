class DrugInteractionResponse {
  DrugInteractionResponse({
    this.message,
    this.data,
  });

  DrugInteractionResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null
        ? DrugInteractionResult.fromJson(json['data'])
        : null;
  }

  String? message;
  DrugInteractionResult? data;

  DrugInteractionResponse copyWith({
    String? message,
    DrugInteractionResult? data,
  }) =>
      DrugInteractionResponse(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class DrugInteractionResult {
  DrugInteractionResult({
    this.result,
  });

  DrugInteractionResult.fromJson(dynamic json) {
    result = json['result'] != null ? json['result'].cast<String>() : [];
  }

  List<String>? result;

  DrugInteractionResult copyWith({
    List<String>? result,
  }) =>
      DrugInteractionResult(
        result: result ?? this.result,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    return map;
  }
}
