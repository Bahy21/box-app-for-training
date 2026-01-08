part of 'login_page_import.dart';

class ScreenName extends StatelessWidget {
  const ScreenName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateAccUserCubit>(
      create: (_) => getIt<CreateAccUserCubit>(),
      child:  Scaffold(
        appBar: LoginPageAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginPageTextTitle(),
                SizedBox(height: 30),
                LoginPageScreen(),
                SizedBox(height: 20),
                LoginPageShowBottomsheet(), // الزر
              ],
            ),
          ),
        ),
      ),
    );
  }
}
