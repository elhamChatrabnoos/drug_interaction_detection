class SuccessResponse {
  SuccessResponse({
    this.message,
    this.data,
  });

  SuccessResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }

  String? message;
  dynamic data;

  SuccessResponse copyWith({
    String? message,
    dynamic data,
  }) =>
      SuccessResponse(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
