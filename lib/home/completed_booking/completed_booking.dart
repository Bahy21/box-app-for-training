part of 'completed_booking_import.dart';

class BookingCompleted extends StatelessWidget {
  const BookingCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 25),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookingCompletedResv(),
                ),
              );
            },
            child: CompletedBookingWidgetCard(),
          );
        },
      ),
    );
  }
}
