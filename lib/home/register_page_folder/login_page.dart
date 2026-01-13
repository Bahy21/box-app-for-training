part of 'login_page_import.dart';
/*
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _RegisterState();
}
class _RegisterState extends State<register> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateAccUserCubit>(
      create: (_) => getIt<CreateAccUserCubit>()..fetchCities(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
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
                LoginPageShowBottomsheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 */

class RegisterPageContent extends StatefulWidget {
  const RegisterPageContent({super.key});

  @override
  State<RegisterPageContent> createState() => _RegisterPageContentState();
}

class _RegisterPageContentState extends State<RegisterPageContent> {


  // final LoginPageController controller = LoginPageController();


  late final CreateAccUserCubit? _createAccUserCubit;

  @override
  void initState() {
    super.initState();
    try {
      _createAccUserCubit = CreatAccountHelper.instance.createAccUserCubit;
      _createAccUserCubit!.fetchCities();
    } catch (e) {
      _createAccUserCubit = null;
      print(' inisde the page GetIt initialized: ${getIt.isRegistered<CreateAccUserCubit>()}');
      // Log the error
      debugPrint('Error getting CreateAccUserCubit: $e');
      // You might want to create a fallback or show an error
    }
  }

  @override
  void dispose() {
    _createAccUserCubit?.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (_createAccUserCubit == null) {
      return Scaffold(
        body: Center(
          child: Text('Error loading dependencies'),
        ),
      );
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (_) => getIt<UserCubit>(),
        ),
        BlocProvider<CreateAccUserCubit>.value(
          value: _createAccUserCubit,
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: LoginPageAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginPageTextTitle(),
                SizedBox(height: 30),
                LoginPageScreen(cubit: _createAccUserCubit ),
                SizedBox(height: 20),
                LoginPageShowBottomsheet(cubit: _createAccUserCubit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
