class LoginParameter {
  final String phone;
  final String fcmToken;

  LoginParameter({
    required this.phone,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "fcm_token": fcmToken,
      };
}
