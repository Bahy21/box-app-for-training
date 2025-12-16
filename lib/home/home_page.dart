import 'package:boxapp/custem_text_filed.dart';
import 'package:boxapp/home/Custom_TextField_image.dart';
import 'package:boxapp/home/view_screen.dart';
import 'package:boxapp/model_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      ///TODO مكان بعض (actions) و (leading) اعكس ال
     /// TODO ايقونه التوثيق تكون جنب الاسم
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/images/verification.svg"),
                    const Text(
                     "أهلاً, Salah Hamed",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    ///TODO  تيكست "نقاط 500" مش نفس اللون "نقاط ليها لون "و "500"ليها لون
                    const Text(
                      "نقاطك   500",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    "assets/images/user.svg",
                    width: 30,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ///TODO فى ايقون ناقصه جنب التيكست
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomOrangeButton(
          text: "احجز",
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              builder: (context) {
                return Container(
                  height: 350,
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "حدد نوع الحجز",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ViewScreen()),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            // مسافة صغيرة بين الأيقونة والنص
                            const Expanded(
                              child: Text(
                                "                 وحدات قريبة من موقعي",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow:
                                TextOverflow.ellipsis, // لو النص طويل
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_back_ios),
                            Text(
                              "                    وحدات قريبة من موقعي",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ///ُTODO SingleChildScrollView جوا  padding: استعمل ال
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              ///TODO radius قلل الارتفاع بتاع التيكست فيلد و قلل البوردر
              const CustomTextField(
                prefixIconPath: "assets/images/Vector (7).png",
                suffixIconPath: "assets/images/Vector (5).png",
                hintText: "موقعك غير مفعّل",
              ),
              const SizedBox(height: 15),
              ///TODO !...خخخخخخخخ قولتلك ما تعملش الحركه دى ليه تيكست فيلد يابني
              /// TODO وحط لينك اى صوره من النت networkImage استعمل
              CustomTextFieldImage(
                height: 140,
                width: double.infinity,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Rectangle.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ///TODO  start استعمل خليها  crossAxisALignment
              ///TODO Align شيل ال
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "حجوزات نشطة",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
                height: 200,
                /// TODO review.md شوف ملف
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1234",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SvgPicture.asset("assets/images/door.svg"),
                      ],
                    ),
                    const Divider(thickness: 1),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/Rectangle.png",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "الوحدة رقم: 1234",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "2024-12-10",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "200 ﷼",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ///TODO border Radius فى ايقونه ناقصه و ظبط
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text("مغادرة الوحدة"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ///TODO  start استعمل خليها  crossAxisALignment
              ///TODO Align شيل ال
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "حجوزات قادمة",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ///TODO شيل ال تيكست فيلد دا و اعمل الكونتينر عادى من غيره
              CustomTextFieldImage(
                height: 170,
                width: double.infinity,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/Rectangle.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "الوحدة رقم: 1234",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "2024-12-10",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "200 ﷼",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    padding: const EdgeInsets.all(20),

                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "إلغاء الحجز",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ///TODO  واحد فيه الارتفاع كله (sized box ) استعمل
              const SizedBox(height: 20),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
