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

        leadingWidth: 220,
        leading: Padding(
          padding: const EdgeInsets.only(right:10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  "assets/images/user.svg",
                  width: 28,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    children: [
                      const Text(
                        "أهلاً, Salah Hamed",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5,),

                      SvgPicture.asset(
                        "assets/images/verification.svg",
                        width: 16,
                      ),


                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "نقاطك",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "500",
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // أيقونة الإشعارات
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      ///TODO فى ايقون ناقصه جنب التيكست
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:CustomOrangeButton(
          image: Image.asset(
            "assets/images/calendar 1.png",
            width: 30,
            height: 30,
          ),
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
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// الصف الأول
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "وحدات قريبة من موقعي",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset("assets/images/down-arrow.png"),


                          ],
                        ),

                        const SizedBox(height: 30),

                        /// الصف الثاني
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "اختيار وحدة محددة",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset("assets/images/down-arrow.png"),

                          //  const Icon(Icons.arrow_back_ios, size: 20),

                          ],
                        ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Vector (5).png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "موقعك غير مفعّل",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                       SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset(
                          'assets/images/Vector (7).png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(height: 15),
              ///TODO !...خخخخخخخخ قولتلك ما تعملش الحركه دى ليه تيكست فيلد يابني
              /// TODO وحط لينك اى صوره من النت networkImage استعمل
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
                  color: Colors.grey.shade100,
                  border: Border.all(
                    color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
                height: 200,
                /// TODO review.md شوف ملف
               // width: double.infinity,
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/log-out.png", // اسم صح بدون مسافات
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "إلغاء الحجز",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )

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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "الوحدة رقم: 1234",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 9),
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
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical:10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text("إلغاء الحجز",style: TextStyle(fontWeight: FontWeight.bold),)),

                      ],
                    ),
                  ],
                ),
              ),              ///TODO  واحد فيه الارتفاع كله (sized box ) استعمل
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
