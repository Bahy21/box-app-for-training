import 'package:boxapp/home/bookingcompleted.dart';
import 'package:boxapp/home/home_reservation.dart';
import 'package:flutter/material.dart';

import 'active_booking/activebooking.dart';

class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  State<Reservations> createState() => _Reservations();
}

class _Reservations extends State<Reservations> {
  int appSelected = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,

          title: Center(
            child: Text(
              "حجوزاتي",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.orange,


           indicatorPadding: EdgeInsets.only(top:12),
            onTap: (value) {
              setState(() {
                appSelected = value;
              });
            },
            dividerHeight:1,
            dividerColor: Colors.grey,

            tabs: [
              Text(
                "تم الحجز",
                style: TextStyle(
                  fontSize: 16,
                  color: appSelected == 0 ? Colors.orange : Colors.grey,
                ),
              ),
              Text(
                "حجز نشط",
                style: TextStyle(
                  fontSize: 16,
                  color: appSelected == 1 ? Colors.orange : Colors.grey,
                ),
              ),
              Text(
                "حجز مكتمل",
                style: TextStyle(
                  fontSize: 16,

                  color: appSelected == 2 ? Colors.orange : Colors.grey,
                ),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            HomeReservation(),
            ActiveBooking(),
            BookingCompleted(),
          ],
        ),
      ),
    );
  }
}