import 'package:boxapp/home/home_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveBooking extends StatelessWidget {
  const ActiveBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 25),
    itemCount: 6,
    separatorBuilder: (context, index) => const SizedBox(height: 20),
    itemBuilder: (context, index) {
    return GestureDetector(
    onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => HomeBooking()),

    );
    },
        child: Container(
        margin: EdgeInsets.only(top: 30,right: 20,left: 20,),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(15)
        ),
        height: 220,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/images/door.svg"),
                Text("كود فتح الباب",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(width: 100),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "589678",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
            const Divider(thickness: 1),
            SizedBox(height: 15,),
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
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.orange[500],
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/log-out.png",),
                      const SizedBox(width: 8),
                      const Text(
                        "مغادرة الوحدة",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
            ),
    );
    }
        ));
  }

}
