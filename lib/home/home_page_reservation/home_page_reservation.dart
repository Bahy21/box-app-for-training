part of 'home_page_reservation_imports.dart';

class HomeReservation extends StatelessWidget {
  const HomeReservation({super.key});

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
                  builder: (context) => const BookingDetails(),
                ),
              );
            },
            child: const HomePageReservationWidgetsCard(),
          );
        },
      ),
    );
  }
}
