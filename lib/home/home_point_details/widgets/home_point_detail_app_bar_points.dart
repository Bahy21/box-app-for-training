part of 'home_point_details_w_imports.dart';
class HomePointDetailAppBarPoints extends StatelessWidget implements PreferredSizeWidget {
  const HomePointDetailAppBarPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/images/right-arrow.png",
                width: 30,
                height: 30,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "نقاط ولاء",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(50);
}
