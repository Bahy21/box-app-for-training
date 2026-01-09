import 'package:box_app/home/login_page/widgets/login_page_w_import.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as context;

import '../../api_register/arguments/create_acc_argument.dart';
import '../../api_register/cubit/create_acc_user_cubit.dart';
import '../../api_register/params/create_acc_user_param.dart';
import '../../api_verify_code/pin_code_cubit/user_cubit.dart';
import '../../api_verify_code/user_model.dart';
import '../../core/di/di.dart';
import '../../core/framework/spaces.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_error.dart';
import '../../core/widgets/custom_loading.dart';
import '../../core/widgets/custom_toast.dart';
import '../../custem_text_filed.dart';
import '../../model_buttom.dart';
import '../nafth_page/nafth_page_import.dart';


part 'login_page.dart';
part 'login_page_controller.dart';
