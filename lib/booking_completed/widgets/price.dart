import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Transform.translate(
        offset: const Offset(0, -28),
        child: const Padding(
          padding: EdgeInsets.only(right: 90),
          child: Text(
            "200 ﷼",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
