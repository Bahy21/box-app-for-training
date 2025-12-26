import 'package:flutter/material.dart';

class CustomOrangeButton extends StatelessWidget {
  final String text;

  /// القديم
  final VoidCallback? onTap;

  /// الجديد
  final VoidCallback? onPressed;

  final Widget? image;

  const CustomOrangeButton({
    super.key,
    required this.text,
    this.onTap,
    this.onPressed,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? onTap, // ✅ لو فيه onPressed استخدمه، غير كده onTap
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) ...[
              image!,
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
