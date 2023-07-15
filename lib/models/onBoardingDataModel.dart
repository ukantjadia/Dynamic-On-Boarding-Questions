class OnBoardingDataModel {
    OnBoardingDataModel({
        required this.status,
        required this.message,
        required this.userDetail,
        required this.eduactionBoards,
        required this.nationalities,
        required this.preferredYears,
        required this.onboardCategories,
        required this.cities,
    });

    final num? status;
    final String? message;
    final UserDetail? userDetail;
    final List<String> eduactionBoards;
    final List<String> nationalities;
    final List<String> preferredYears;
    final List<OnboardCategory> onboardCategories;
    final List<City> cities;

    factory OnBoardingDataModel.fromJson(Map<String, dynamic> json){ 
        return OnBoardingDataModel(
            status: json["status"],
            message: json["message"],
            userDetail: json["user_detail"] == null ? null : UserDetail.fromJson(json["user_detail"]),
            eduactionBoards: json["eduaction_boards"] == null ? [] : List<String>.from(json["eduaction_boards"]!.map((x) => x)),
            nationalities: json["nationalities"] == null ? [] : List<String>.from(json["nationalities"]!.map((x) => x)),
            preferredYears: json["preferred_years"] == null ? [] : List<String>.from(json["preferred_years"]!.map((x) => x)),
            onboardCategories: json["onboard_categories"] == null ? [] : List<OnboardCategory>.from(json["onboard_categories"]!.map((x) => OnboardCategory.fromJson(x))),
            cities: json["cities"] == null ? [] : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user_detail": userDetail?.toJson(),
        "eduaction_boards": eduactionBoards.map((x) => x).toList(),
        "nationalities": nationalities.map((x) => x).toList(),
        "preferred_years": preferredYears.map((x) => x).toList(),
        "onboard_categories": onboardCategories.map((x) => x.toJson()).toList(),
        "cities": cities.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$status, $message, $userDetail, $eduactionBoards, $nationalities, $preferredYears, $onboardCategories, $cities, ";
    }
}

class City {
    City({
        required this.id,
        required this.name,
    });

    final int? id;
    final String? name;

    factory City.fromJson(Map<String, dynamic> json){ 
        return City(
            id: json["id"],
            name: json["name"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    @override
    String toString(){
        return "$id, $name, ";
    }
}

class OnboardCategory {
    OnboardCategory({
        required this.id,
        required this.categoryName,
        required this.onboardQuestions,
    });

    final int? id;
    final String? categoryName;
    final List<OnboardQuestion> onboardQuestions;

    factory OnboardCategory.fromJson(Map<String, dynamic> json){ 
        return OnboardCategory(
            id: json["id"],
            categoryName: json["category_name"],
            onboardQuestions: json["onboard_questions"] == null ? [] : List<OnboardQuestion>.from(json["onboard_questions"]!.map((x) => OnboardQuestion.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "onboard_questions": onboardQuestions.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$id, $categoryName, $onboardQuestions, ";
    }
}

class OnboardQuestion {
    OnboardQuestion({
        required this.id,
        required this.categoryId,
        required this.questionName,
        required this.placeholder,
        required this.options,
        required this.type,
        required this.attributeName,
        required this.locale,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? id;
    final int? categoryId;
    final String? questionName;
    final String? placeholder;
    final String? options;
    final String? type;
    final String? attributeName;
    final String? locale;
    final dynamic createdAt;
    final dynamic updatedAt;

    factory OnboardQuestion.fromJson(Map<String, dynamic> json){ 
        return OnboardQuestion(
            id: json["id"],
            categoryId: json["category_id"],
            questionName: json["question_name"],
            placeholder: json["placeholder"],
            options: json["options"],
            type: json["type"],
            attributeName: json["attribute_name"],
            locale: json["locale"],
            createdAt: json["created_at"],
            updatedAt: json["updated_at"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "question_name": questionName,
        "placeholder": placeholder,
        "options": options,
        "type": type,
        "attribute_name": attributeName,
        "locale": locale,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };

    @override
    String toString(){
        return "$id, $categoryId, $questionName, $placeholder, $options, $type, $attributeName, $locale, $createdAt, $updatedAt, ";
    }
}

class UserDetail {
    UserDetail({
        required this.name,
        required this.lastName,
        required this.phone,
        required this.email,
        required this.countryCode,
    });

    final String? name;
    final String? lastName;
    final String? phone;
    final String? email;
    final String? countryCode;

    factory UserDetail.fromJson(Map<String, dynamic> json){ 
        return UserDetail(
            name: json["name"],
            lastName: json["last_name"],
            phone: json["phone"],
            email: json["email"],
            countryCode: json["country_code"],
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "country_code": countryCode,
    };

    @override
    String toString(){
        return "$name, $lastName, $phone, $email, $countryCode, ";
    }
}
