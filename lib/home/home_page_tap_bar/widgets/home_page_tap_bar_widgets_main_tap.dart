part of 'home_page_tap_bar_w_imports.dart';
class HomePageTapBarWidgets extends StatefulWidget {
  const HomePageTapBarWidgets({super.key});

  @override
  State<HomePageTapBarWidgets> createState() => _HomePageTapBarWidgetsState();
}

class _HomePageTapBarWidgetsState extends State<HomePageTapBarWidgets> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return  TabBar(
      onTap: (value) {
        setState(() {
          selected = value;
        });
      },
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      tabs: [
        //main tap
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/home.svg",
              height: 28,
              colorFilter: ColorFilter.mode(
                selected == 0 ? Colors.orange : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "الرئيسية",
              style: TextStyle(
                fontSize: 12,
                color: selected == 0 ? Colors.orange : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/wallet.svg",
              height: 28,
              colorFilter: ColorFilter.mode(
                selected == 1 ? Colors.orange : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "حجوزاتي",
              style: TextStyle(
                fontSize: 12,
                color: selected == 1 ? Colors.orange : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/calendar.svg",
              height: 28,
              colorFilter: ColorFilter.mode(
                selected == 2 ? Colors.orange : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "حجوزاتي",
              style: TextStyle(
                fontSize: 12,
                color: selected == 2 ? Colors.orange : Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/more.svg",
              height: 28,
              colorFilter: ColorFilter.mode(
                selected == 3 ? Colors.orange : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "المزيد",
              style: TextStyle(
                fontSize: 12,
                color: selected == 3 ? Colors.orange : Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
