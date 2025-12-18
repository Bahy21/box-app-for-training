part of 'home_page_tap_bar_import.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(children: [
          HomePage(),
          Reservations(),
          ViewWallet(),
          ViewSettings(),
        ]),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomePageTapBarWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
