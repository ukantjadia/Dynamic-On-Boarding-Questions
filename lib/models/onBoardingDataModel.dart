class OnBoardingDataModel {
  OnBoardingDataModel({
      this.status, 
      this.message, 
      this.userDetail, 
      this.eduactionBoards, 
      this.nationalities, 
      this.preferredYears, 
      this.onboardCategories, 
      this.cities,});

  OnBoardingDataModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    userDetail = json['user_detail'] != null ? UserDetail.fromJson(json['user_detail']) : null;
    eduactionBoards = json['eduaction_boards'] != null ? json['eduaction_boards'].cast<String>() : [];
    nationalities = json['nationalities'] != null ? json['nationalities'].cast<String>() : [];
    preferredYears = json['preferred_years'] != null ? json['preferred_years'].cast<String>() : [];
    if (json['onboard_categories'] != null) {
      onboardCategories = [];
      json['onboard_categories'].forEach((v) {
        onboardCategories?.add(OnboardCategories.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities?.add(Cities.fromJson(v));
      });
    }
  }
  num? status;
  String? message;
  UserDetail? userDetail;
  List<String>? eduactionBoards;
  List<String>? nationalities;
  List<String>? preferredYears;
  List<OnboardCategories>? onboardCategories;
  List<Cities>? cities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (userDetail != null) {
      map['user_detail'] = userDetail?.toJson();
    }
    map['eduaction_boards'] = eduactionBoards;
    map['nationalities'] = nationalities;
    map['preferred_years'] = preferredYears;
    if (onboardCategories != null) {
      map['onboard_categories'] = onboardCategories?.map((v) => v.toJson()).toList();
    }
    if (cities != null) {
      map['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cities {
  Cities({
      this.id, 
      this.name,});

  Cities.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class OnboardCategories {
  OnboardCategories({
      this.id, 
      this.categoryName, 
      this.onboardQuestions,});

  OnboardCategories.fromJson(dynamic json) {
    id = json['id'];
    categoryName = json['category_name'];
    if (json['onboard_questions'] != null) {
      onboardQuestions = [];
      json['onboard_questions'].forEach((v) {
        onboardQuestions?.add(OnboardQuestions.fromJson(v));
      });
    }
  }
  num? id;
  String? categoryName;
  List<OnboardQuestions>? onboardQuestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_name'] = categoryName;
    if (onboardQuestions != null) {
      map['onboard_questions'] = onboardQuestions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OnboardQuestions {
  OnboardQuestions({
      this.id, 
      this.categoryId, 
      this.questionName, 
      this.placeholder, 
      this.options, 
      this.type, 
      this.attributeName, 
      this.locale, 
      this.createdAt, 
      this.updatedAt,});

  OnboardQuestions.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    questionName = json['question_name'];
    placeholder = json['placeholder'];
    options = json['options'];
    type = json['type'];
    attributeName = json['attribute_name'];
    locale = json['locale'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? categoryId;
  String? questionName;
  String? placeholder;
  String? options;
  String? type;
  String? attributeName;
  String? locale;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['question_name'] = questionName;
    map['placeholder'] = placeholder;
    map['options'] = options;
    map['type'] = type;
    map['attribute_name'] = attributeName;
    map['locale'] = locale;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class UserDetail {
  UserDetail({
      this.name, 
      this.lastName, 
      this.phone, 
      this.email, 
      this.countryCode,});

  UserDetail.fromJson(dynamic json) {
    name = json['name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    countryCode = json['country_code'];
  }
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['country_code'] = countryCode;
    return map;
  }

}