part of 'login_page_w_import.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAccUserCubit>();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "الأسم كامل",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomTextField(hintText: "الأسم الأول",
         controller: cubit.registerNameCtr,
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "البريد الاكتوني",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hintText: "البريد الإلكتروني",
          controller: cubit.registerEmailCtr,
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "المدينة",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        CustomDropDownField(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 12,
          ),
          value: cubit.dropDownVal,
          hintText: 'حدد المدينة'.tr(),
          hintStyle: AppTextStyles.textStyle14(
            context,
          ).copyWith(color: context.themeColors.textPrimary),
          autoValidateMode: AutovalidateMode.onUserInteraction,
          validator: AppValidator.dropDownCityValidator(),
          items: List.generate(
            cubit.cities.length,
                (index) => DropdownMenuItem(
              value: cubit.cities[index].id.toString(),
              child: Text(
                cubit.cities[index].name,
                style: AppTextStyles.textStyle14(
                  context,
                ),
              ),
            ),
          ),
          onChanged: (value) {
            cubit.changeValue(value);
          },
        ),
        const SizedBox(
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            textAlign: TextAlign.right,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "من خلال إنشاء حساب فإنك توافق على ",
                  style: TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontWeight: FontWeight.w600,

                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "الشروط والأحكام           ",
                  style: TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontWeight: FontWeight.w600,

                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
                TextSpan(
                  text: "و ",
                  style: TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontWeight: FontWeight.w600,

                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                TextSpan(
                  text: "سياسة الخصوصية",
                  style: TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontWeight: FontWeight.w600,

                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
