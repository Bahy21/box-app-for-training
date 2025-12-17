import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/images/Rectangle.png",
            width: 74,
            height: 74,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),

        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Row(
            children: const [
              Text("رقم الوحدة:", style: TextStyle(fontSize: 10)),
              SizedBox(width: 4),
              Text(
                "5697827",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/calender.svg",
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 5),
              const Text(
                "16 سبتمبر 2026",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
