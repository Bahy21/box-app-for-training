part of 'settings_app_imports.dart';

class ViewSettings extends StatelessWidget {
  const ViewSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: SettingAppAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(radius: 30),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileSettings(), // هنا حط اسم الصفحة اللي عايز تروح لها
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Abdallrhman"),
                        Text("abdallrhman@gmail.com"),
                      ],
                    ),
                  ),
                  SizedBox(width: 100),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileSettings(), // هنا حط اسم الصفحة اللي عايز تروح لها
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/Vector (22).png",
                      height: 10,
                    ),
                  ),
                ],
              ),
            ),

            // SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PointSettings(),
                    ),
                  );
                },
                //points
                child: SettingAppPoints()),
            // support for
            SettingAppSupportFor(),
            // app settings
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 30),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "إعدادات التطبيق",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: SvgPicture.asset("assets/images/language.svg"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "اللغة",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 225),
                    Text(
                      "اللغة",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 300,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // 👈 منتصف عمودي
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // 👈 محاذاة يمين
                                  children: [
                                    // الصف الأول
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 20),
                                          child: Image.asset(
                                              "assets/images/Clip path group.png"),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "اللغة العربية",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 30),

                                    // Divider بين الصفوف
                                    const Divider(
                                      height: 10,
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),

                                    const SizedBox(height: 30),

                                    // الصف الثاني
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 20),
                                          child: Image.asset(
                                              "assets/images/united.png"),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "English",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset("assets/images/Vector (22).png"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child:
                      SvgPicture.asset("assets/images/Group 48096074.svg"),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "المظهر",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 152), // مسافة بسيطة بين النصوص
                    Text(
                      "الوضع النهاري",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/images/Group (1).svg",
                      width: 20, // خليها مناسبة
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Image.asset(
                        "assets/images/Vector (23).png",
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "المظهر",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 152), // مسافة بسيطة بين النصوص
                    Text(
                      "الوضع النهاري",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/images/Group (1).svg",
                      width: 20, // خليها مناسبة
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  // عشان نتحكم كامل في الحجم
                                  content: SizedBox(
                                      width: 460, // هنا تتحكم في العرض
                                      height: 237, // هنا تتحكم في الطول
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 30, left: 240),
                                              child: Image.asset(
                                                  "assets/images/Vector (28).png"),
                                            ),
                                            const Text(
                                              "لايمكن حذف الحساب أثناء وجود طلبات نشطة",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 50),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                          ),
                                                          contentPadding: EdgeInsets.zero,
                                                          content: SizedBox(
                                                            width: 460, // عرض الـ Dialog
                                                            height: 237, // ارتفاع الـ Dialog
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                const Text(
                                                                  "هل متأكد من حذف حسابك؟",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold, fontSize: 18),
                                                                ),
                                                                const SizedBox(height: 20),
                                                                const Text(
                                                                  "سيتم مسح جميع المعلومات الخاصة بك عند حذف الحساب",
                                                                  textAlign: TextAlign.center,
                                                                ),
                                                                const SizedBox(height: 20),

                                                                // Row للزرين جنب بعض
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    // زر حذف الحساب
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Container(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                        constraints: const BoxConstraints(
                                                                          minWidth: 70,
                                                                          maxWidth: 110,
                                                                          minHeight: 35,
                                                                          maxHeight: 40,
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.red,
                                                                          border: Border.all(color: Colors.orange),
                                                                          borderRadius: BorderRadius.circular(250),
                                                                        ),
                                                                        child: const Center(
                                                                          child: Text(
                                                                            "حذف الحساب",
                                                                            style: TextStyle(color: Colors.white, fontSize: 10),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    const SizedBox(width: 20), // مسافة بين الزرين

                                                                    // زر إلغاء / حسناً
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Container(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                        constraints: const BoxConstraints(
                                                                          minWidth: 70,
                                                                          maxWidth: 110,
                                                                          minHeight: 35,
                                                                          maxHeight: 40,
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                          //color: Colors.orange,
                                                                          border: Border.all(color: Colors.grey),
                                                                          borderRadius: BorderRadius.circular(250),

                                                                        ),
                                                                        child: const Center(
                                                                          child: Text(
                                                                            "إلغاء",
                                                                            style: TextStyle(color: Colors.black, fontSize: 14),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      border: Border.all(color: Colors.orange),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "حسناً",
                                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ])));
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/images/switch.svg",
                          width: 20, // حجم الصورة حسب رغبتك
                          height: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: SvgPicture.asset(
                        "assets/images/Vector (9).svg",
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "حذف الحساب",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
