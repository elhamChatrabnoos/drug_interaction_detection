class NewDrugModel {
  NewDrugModel({
    this.drugName,
    this.drugNumber,
    this.dosageFrequency,
    this.drugType,
    this.dosage,
    this.usageType,
    this.startDate,
    this.endDate,
    this.note,
  });

  NewDrugModel.fromJson(dynamic json) {
    drugName = json['drug_name'];
    drugNumber = json['drug_number'];
    dosageFrequency = json['dosage_frequency'];
    drugType = json['drug_type'];
    dosage = json['dosage'];
    usageType = json['usage_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    note = json['note'];
  }

  String? drugName;
  String? drugNumber;
  String? dosageFrequency;
  String? drugType;
  String? dosage;
  String? usageType;
  String? startDate;
  String? endDate;
  String? note;

  NewDrugModel copyWith({
    String? drugName,
    String? drugNumber,
    String? dosageFrequency,
    String? drugType,
    String? dosage,
    String? usageType,
    String? startDate,
    String? endDate,
    String? note,
  }) =>
      NewDrugModel(
        drugName: drugName ?? this.drugName,
        drugNumber: drugNumber ?? this.drugNumber,
        dosageFrequency: dosageFrequency ?? this.dosageFrequency,
        drugType: drugType ?? this.drugType,
        dosage: dosage ?? this.dosage,
        usageType: usageType ?? this.usageType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        note: note ?? this.note,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['drug_name'] = drugName;
    map['drug_number'] = drugNumber;
    map['dosage_frequency'] = dosageFrequency;
    map['drug_type'] = drugType;
    map['dosage'] = dosage;
    map['usage_type'] = usageType;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['note'] = note;
    return map;
  }
}
