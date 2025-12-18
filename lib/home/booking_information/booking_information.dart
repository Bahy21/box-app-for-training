part of 'booking_information_import.dart';

class HomeBooking extends StatelessWidget {
  const HomeBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      //app bar
      appBar: BookingInformationAppBar(),
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
                    BookingInformationUnitInfo(),
                    SizedBox(height: 10),
                    // booking date and time
                    BookingInformationBookingDateAndTime(),
                    SizedBox(height: 10),
                    Divider(height: 25, color: Colors.grey),
                    //location widgets
                    BookingInformationLocationWidgets(),
                    Divider(height: 25, color: Colors.grey),
                    SizedBox(height: 6),
                    //payment details
                    BookingInformationPaymentDetails(),
                    SizedBox(height: 20),

                    Divider(height: 25, color: Colors.grey),
                    //booking information
                    BookingInformationDetails(),
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
