class SearchedDrugResponse {
  SearchedDrugResponse({
    this.message,
    this.data,
  });

  SearchedDrugResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SearchedDrug.fromJson(v));
      });
    }
  }

  String? message;
  List<SearchedDrug>? data;

  SearchedDrugResponse copyWith({
    String? message,
    List<SearchedDrug>? data,
  }) =>
      SearchedDrugResponse(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SearchedDrug {
  SearchedDrug({
    this.drugNumber,
    this.drugName,
  });

  SearchedDrug.fromJson(dynamic json) {
    drugNumber = json['drug_number'];
    drugName = json['drug_name'];
  }

  String? drugNumber;
  String? drugName;

  SearchedDrug copyWith({
    String? drugNumber,
    String? drugName,
  }) =>
      SearchedDrug(
        drugNumber: drugNumber ?? this.drugNumber,
        drugName: drugName ?? this.drugName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['drug_number'] = drugNumber;
    map['drug_name'] = drugName;
    return map;
  }
}
