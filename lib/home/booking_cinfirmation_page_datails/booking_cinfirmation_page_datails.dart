part of 'booking_cinfirmation_page_datails_imports.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingConfirmationPageDatailsAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // رقم الوحدة
                    // unit details
                    BookingCinfirmationPageUnitDetails(),
                    const SizedBox(height: 5),
                    const Divider(height: 25, color: Colors.grey),
                    const SizedBox(height: 10),

                    // الموقع
                    // location
                    BookingCinfirmationPageLocationDatails(),

                    const SizedBox(height: 5),
                    const Divider(height: 25, color: Colors.grey),
                    const SizedBox(height: 10),

                    // طريقة الدفع
                    // payment
                    BookingCinfirmationPagePayment(),
                    const SizedBox(height: 10),
                    const Divider(height: 25, color: Colors.grey),

                    // ملخص الحجز
                    //payment details
                    BookingConfiomationPagePaymentDatails(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // زر إلغاء الحجز
            // un click button
            BookingCinfirmationPageOnClickDatails(),          ],
        ),
      ),
    );
  }
}
