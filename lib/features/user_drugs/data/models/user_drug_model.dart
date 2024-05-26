class UserDrugModel {
  UserDrugModel({
    this.message,
    this.data,
  });

  UserDrugModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DrugModel.fromJson(v));
      });
    }
  }

  String? message;
  List<DrugModel>? data;

  UserDrugModel copyWith({
    String? message,
    List<DrugModel>? data,
  }) =>
      UserDrugModel(
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

class DrugModel {
  DrugModel({
    this.drug,
    this.isEnded,
    this.interactions,
  });

  DrugModel.fromJson(dynamic json) {
    drug = json['drug'] != null ? Drug.fromJson(json['drug']) : null;
    isEnded = json['is_ended'];
    interactions = json['interactions'] != null
        ? Interactions.fromJson(json['interactions'])
        : null;
  }

  Drug? drug;
  bool? isEnded;
  Interactions? interactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (drug != null) {
      map['drug'] = drug?.toJson();
    }
    map['is_ended'] = isEnded;
    if (interactions != null) {
      map['interactions'] = interactions?.toJson();
    }
    return map;
  }
}

class Interactions {
  Interactions({
    this.foodInteractions,
    this.drugInteractions,
  });

  Interactions.fromJson(dynamic json) {
    if (json['food_interactions'] != null) {
      foodInteractions = [];
      // json['food_interactions'].forEach((v) {
      //   foodInteractions?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['drug_interactions'] != null) {
      drugInteractions = [];
      // json['drug_interactions'].forEach((v) {
      //   drugInteractions?.add(Dynamic.fromJson(v));
      // });
    }
  }

  List<dynamic>? foodInteractions;
  List<dynamic>? drugInteractions;

  Interactions copyWith({
    List<dynamic>? foodInteractions,
    List<dynamic>? drugInteractions,
  }) =>
      Interactions(
        foodInteractions: foodInteractions ?? this.foodInteractions,
        drugInteractions: drugInteractions ?? this.drugInteractions,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (foodInteractions != null) {
      map['food_interactions'] =
          foodInteractions?.map((v) => v.toJson()).toList();
    }
    if (drugInteractions != null) {
      map['drug_interactions'] =
          drugInteractions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Drug {
  Drug({
    this.id,
    this.created,
    this.modified,
    this.drugType,
    this.drugName,
    this.drugNumber,
    this.dosageFrequency,
    this.dosage,
    this.usageType,
    this.sideEffects,
    this.foodInteractions,
    this.timings,
    this.startDate,
    this.endDate,
    this.note,
    this.user,
  });

  Drug.fromJson(dynamic json) {
    id = json['id'];
    created = json['created'];
    modified = json['modified'];
    drugType = json['drug_type'];
    drugName = json['drug_name'];
    drugNumber = json['drug_number'];
    dosageFrequency = json['dosage_frequency'];
    dosage = json['dosage'];
    usageType = json['usage_type'];
    if (json['side_effects'] != null) {
      sideEffects = [];
      // json['side_effects'].forEach((v) {
      //   sideEffects?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['food_interactions'] != null) {
      foodInteractions = [];
      // json['food_interactions'].forEach((v) {
      //   foodInteractions?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['timings'] != null) {
      timings = [];
      // json['timings'].forEach((v) {
      //   timings?.add(Dynamic.fromJson(v));
      // });
    }
    startDate = json['start_date'];
    endDate = json['end_date'];
    note = json['note'];
    user = json['user'];
  }

  num? id;
  String? created;
  String? modified;
  String? drugType;
  String? drugName;
  String? drugNumber;
  String? dosageFrequency;
  String? dosage;
  String? usageType;
  List<dynamic>? sideEffects;
  List<dynamic>? foodInteractions;
  List<dynamic>? timings;
  String? startDate;
  String? endDate;
  String? note;
  num? user;

  Drug copyWith({
    num? id,
    String? created,
    String? modified,
    String? drugType,
    String? drugName,
    String? drugNumber,
    String? dosageFrequency,
    String? dosage,
    String? usageType,
    List<dynamic>? sideEffects,
    List<dynamic>? foodInteractions,
    List<dynamic>? timings,
    String? startDate,
    String? endDate,
    String? note,
    num? user,
  }) =>
      Drug(
        id: id ?? this.id,
        created: created ?? this.created,
        modified: modified ?? this.modified,
        drugType: drugType ?? this.drugType,
        drugName: drugName ?? this.drugName,
        drugNumber: drugNumber ?? this.drugNumber,
        dosageFrequency: dosageFrequency ?? this.dosageFrequency,
        dosage: dosage ?? this.dosage,
        usageType: usageType ?? this.usageType,
        sideEffects: sideEffects ?? this.sideEffects,
        foodInteractions: foodInteractions ?? this.foodInteractions,
        timings: timings ?? this.timings,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        note: note ?? this.note,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created'] = created;
    map['modified'] = modified;
    map['drug_type'] = drugType;
    map['drug_name'] = drugName;
    map['drug_number'] = drugNumber;
    map['dosage_frequency'] = dosageFrequency;
    map['dosage'] = dosage;
    map['usage_type'] = usageType;
    if (sideEffects != null) {
      map['side_effects'] = sideEffects?.map((v) => v.toJson()).toList();
    }
    if (foodInteractions != null) {
      map['food_interactions'] =
          foodInteractions?.map((v) => v.toJson()).toList();
    }
    if (timings != null) {
      map['timings'] = timings?.map((v) => v.toJson()).toList();
    }
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['note'] = note;
    map['user'] = user;
    return map;
  }
}
