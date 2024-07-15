import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:irctctest/features/Items/binding/items_add_binding.dart';
import 'package:irctctest/features/Items/view/items_add_page.dart';
import 'package:irctctest/features/Logout/view/logout_page.dart';
import 'package:irctctest/features/addPassenger/binding/add_passenger_binding.dart';
import 'package:irctctest/features/addPassenger/view/add_passenger_view.dart';
import 'package:irctctest/features/home/home/home_page_binding.dart';
import 'package:irctctest/features/home/home/home_page_view.dart';
import 'package:irctctest/features/imgUpload/binding/img_upload_binding.dart';
import 'package:irctctest/features/imgUpload/view/img_upload_page.dart';
import 'package:irctctest/features/login/binding/login_page_binding.dart';
import 'package:irctctest/features/login/view/login_page_view.dart';
import 'package:irctctest/features/otpScreen/binding/otp_screen_binding.dart';
import 'package:irctctest/features/otpScreen/view/otp_screen_view.dart';
import 'package:irctctest/features/passengerEditDetails/binding/passenger_edit_binding.dart';
import 'package:irctctest/features/passengerEditDetails/view/passenger_edit_page.dart';
import 'package:irctctest/features/passengerList/binding/passenger_list_binding.dart';
import 'package:irctctest/features/passengerList/view/passenger_list_view.dart';
import 'package:irctctest/features/phoneAuthentication/binding/phone_binding.dart';
import 'package:irctctest/features/phoneAuthentication/view/phone_page.dart';
import 'package:irctctest/features/searchTrain/binding/search_train_binding.dart';
import 'package:irctctest/features/searchTrain/view/search_train_view.dart';
import 'package:irctctest/features/signUp/binding/signUp_page_binding.dart';
import 'package:irctctest/features/signUp/view/signUp_page_view.dart';
import 'package:irctctest/features/splash/splash_screen_binding.dart';
import 'package:irctctest/features/splash/splash_screen_view.dart';

List<GetPage> getpages = [
  GetPage(
    name: RoutesConstant.splash,
    page: () => const SplashScreenView(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: RoutesConstant.login,
    page: () => const LoginPageView(),
    binding: LoginPageBinding(),
  ),
  GetPage(
    name: RoutesConstant.signUp,
    page: () => const SignUpPageView(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: RoutesConstant.phone,
    page: () => const PhonePage(),
    binding: PhoneBinding(),
  ),
  GetPage(
    name: RoutesConstant.otp,
    page: () => const OtpScreenView(),
    binding: OtpScreenBinding(),
  ),
  GetPage(
   name: RoutesConstant.home,
    page: () => const HomePageView(),
    binding: HomePageBinding(),
  ),

  GetPage(
    name: RoutesConstant.item,
    page: () => const ItemsAddPage(),
    binding: ItemsAddBinding(),
  ),

  GetPage(
    name: RoutesConstant.imgupload,
    page: () => const ImgUploadPage(),
    binding: ImageUploadBinding(),
  ),
  GetPage(
    name: RoutesConstant.searchTrain,
    page: () => const SearchTrainView(),
    binding: SearchTrainBinding(),
  ),
  GetPage(
    name: RoutesConstant.passengerList,
    page: () => const PassengerListView(),
    binding: PassengerListBinding(),
  ),

  GetPage(
      name: RoutesConstant.addPassenger,
      page: () => const AddPassengerView(),
    binding: AddPassengerBinding(),
  ),

  GetPage(
    name: RoutesConstant.editPassenger,
    page: () =>  PassengerEditPage(),
    binding: PassengerEditBinding(),
  ),

  GetPage(
    name: RoutesConstant.logout,
    page: () => const LogoutPage(),
    binding: LoginPageBinding(),
  ),


];