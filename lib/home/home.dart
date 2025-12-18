import 'package:boxapp/home/home_page.dart';
import 'package:boxapp/home/reservations.dart';
import 'package:boxapp/settings/view_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../wallet/view_wallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(children: [
          const HomePage(),
          Reservations(),
          ViewWallet(),
          ViewSettings(),
        ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                onTap: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabs: [
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
