part of 'home_page_details_imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      ///TODO مكان بعض (actions) و (leading) اعكس ال
      /// TODO ايقونه التوثيق تكون جنب الاسم
      /// app bar
      appBar: HomePageDetailsAppBar(),
      ///TODO فى ايقون ناقصه جنب التيكست
      /// on click buttom
      floatingActionButton:HomePageDetailsOnClickButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ///ُTODO SingleChildScrollView جوا  padding: استعمل ال
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              const SizedBox(height: 10),
              ///TODO radius قلل الارتفاع بتاع التيكست فيلد و قلل البوردر
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  /// location
                  child: HomePageDetailsWidgetsLocation(),
                ),
              ),
              SizedBox(height: 20),
              ContinuousTwoImageSwiper(),

              ///TODO !...خخخخخخخخ قولتلك ما تعملش الحركه دى ليه تيكست فيلد يابني
              /// TODO وحط لينك اى صوره من النت networkImage استعمل
              ///
              const SizedBox(height: 20),
              ///TODO  start استعمل خليها  crossAxisALignment
              ///TODO Align شيل ال
              /// active reservation
              HomePageDetailsWidgetsActiveReservation(),
              const SizedBox(height: 20),
              ///TODO  start استعمل خليها  crossAxisALignment
              ///TODO Align شيل ال
              ///up coming reservation
              HomePageDetailsUpComingReservation(),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
