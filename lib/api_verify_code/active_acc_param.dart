class ActiveAccParameter {
  final String phone;
  final String code;

  ActiveAccParameter({
    required this.phone,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "code": code,
  };
}
