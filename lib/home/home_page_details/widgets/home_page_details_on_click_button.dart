part of 'home_page_details_w_imports.dart';
class HomePageDetailsOnClickButton extends StatelessWidget {
  const HomePageDetailsOnClickButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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

    );
  }
}
