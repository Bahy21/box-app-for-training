import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gps extends StatelessWidget {
  const Gps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.white,);
  }
}
/*
Column(
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

 */
