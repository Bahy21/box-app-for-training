import 'package:boxapp/home/show_registration_screen/widget/show_registration_screen_w_import.dart';
import 'package:boxapp/home/api/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../custem_text_filed.dart';
import '../../model_buttom.dart';
import '../api/api_servies.dart';
import '../api_login/cubit/my_cubit.dart';
import '../api_login/cubit/my_state.dart';
import '../api_login/my _repo.dart';
import '../api_login/user.dart';
import '../api_login/web_services.dart';
import '../send_otp_page/send_otp_page_import.dart';



part 'show_registration_screen.dart';
part 'show_registration_screen_controller.dart';