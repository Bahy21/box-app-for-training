
import 'package:box_app/core/di/di.config.dart';
import 'package:box_app/core/di/di.dart';

import '../../home/register_page_folder/register/cubit/create_acc_user_cubit.dart' show CreateAccUserCubit;



class CreatAccountHelper {

  CreatAccountHelper._();


  static CreatAccountHelper instance = CreatAccountHelper._();



  // Future<CreateAccUserCubit>  createAccUserCubit() async {
  //   if(!getIt.isRegistered<CreateAccUserCubit>()){
  //     await getIt.init();
  //     return getIt<CreateAccUserCubit>();
  //   }
  //   return getIt<CreateAccUserCubit>();
  // }


 CreateAccUserCubit get createAccUserCubit  {
    return getIt<CreateAccUserCubit>();
  }



}