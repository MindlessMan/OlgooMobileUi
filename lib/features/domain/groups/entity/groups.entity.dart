class MainModel {
  final int id;
  final String title;
  final String status;
  final DateTime registerDate;
  final List<SmsTemplate> smsTemplates;
  final Company company;
  final List<OrderedCategory> orderedCategories;

  MainModel({
    required this.id,
    required this.title,
    required this.status,
    required this.registerDate,
    required this.smsTemplates,
    required this.company,
    required this.orderedCategories,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      registerDate: DateTime.parse(json['registerDate']),
      smsTemplates: (json['smsTemplates'] as List<dynamic>)
          .map((e) => SmsTemplate.fromJson(e))
          .toList(),
      company: Company.fromJson(json['company']),
      orderedCategories: (json['orderedCategories'] as List<dynamic>)
          .map((e) => OrderedCategory.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'registerDate': registerDate.toIso8601String(),
      'smsTemplates': smsTemplates.map((e) => e.toJson()).toList(),
      'company': company.toJson(),
      'orderedCategories': orderedCategories.map((e) => e.toJson()).toList(),
    };
  }
}

class SmsTemplate {
  final int id;
  final String desc1;
  final String desc2;
  final String desc3;
  final Template template;

  SmsTemplate({
    required this.id,
    required this.desc1,
    required this.desc2,
    required this.desc3,
    required this.template,
  });

  factory SmsTemplate.fromJson(Map<String, dynamic> json) {
    return SmsTemplate(
      id: json['id'],
      desc1: json['DESC1'],
      desc2: json['DESC2'],
      desc3: json['DESC3'],
      template: Template.fromJson(json['template']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'DESC1': desc1,
      'DESC2': desc2,
      'DESC3': desc3,
      'template': template.toJson(),
    };
  }
}

class Template {
  final int id;
  final String templateId;
  final List<List<String>> tokens;
  final String context;

  Template({
    required this.id,
    required this.templateId,
    required this.tokens,
    required this.context,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      id: json['id'],
      templateId: json['templateId'],
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((item) => item as String).toList())
          .toList(),
      context: json['context'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'templateId': templateId,
      'tokens': tokens,
      'context': context,
    };
  }
}

class Company {
  final int id;
  final String title;
  final String phoneNumber;
  final String status;
  final DateTime registerDate;

  Company({
    required this.id,
    required this.title,
    required this.phoneNumber,
    required this.status,
    required this.registerDate,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      title: json['title'],
      phoneNumber: json['phoneNumber'],
      status: json['status'],
      registerDate: DateTime.parse(json['registerDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'phoneNumber': phoneNumber,
      'status': status,
      'registerDate': registerDate.toIso8601String(),
    };
  }
}

class OrderedCategory {
  final Category category;

  OrderedCategory({required this.category});

  factory OrderedCategory.fromJson(Map<String, dynamic> json) {
    return OrderedCategory(
      category: Category.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category.toJson(),
    };
  }
}

class Category {
  final int id;
  final String title;
  final bool isCustom;

  Category({
    required this.id,
    required this.title,
    required this.isCustom,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      isCustom: json['isCustom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCustom': isCustom,
    };
  }
}