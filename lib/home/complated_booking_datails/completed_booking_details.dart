part of 'completed_booking_details_imports.dart';
class BookingCompletedResv extends StatelessWidget {
  const BookingCompletedResv({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar:CompletedBookingDetailsAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //unit info

                    UnitInfoWidgets(),

                    SizedBox(height: 10),
                    //booking date and time
                    CompletedBookingDateTime(),
                    SizedBox(height: 10),
                    Divider(height: 25, color: Colors.grey),
                    //unit location widget
                    CompletedBookingLocationWidgets(),
                    Divider(height: 25, color: Colors.grey),
                    SizedBox(height: 6),
                    //payment details
                    CompletedBookingPaymentDetails(),
                    SizedBox(height: 20),

                    Divider(height: 25, color: Colors.grey),
                    //booking information

                    CompletedBookingSummary(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
