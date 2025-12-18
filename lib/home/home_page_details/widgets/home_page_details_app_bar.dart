part of 'home_page_details_w_imports.dart';

class HomePageDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomePageDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      leadingWidth: 220,
      leading: Padding(
        padding: const EdgeInsets.only(right: 10),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
