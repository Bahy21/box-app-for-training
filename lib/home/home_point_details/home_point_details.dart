part of 'home_point_details_import.dart';

class PointSettings extends StatelessWidget {
  const PointSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar point
      appBar: const HomePointDetailAppBarPoints(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //point count
            const HomePointDetailsPointCount(),
            const SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            //point details
            const HomePointDetailsPointDetails(),
          ],
        ),
      ),
    );
  }
}
