import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/providers/services/service.dart';
import 'package:nike_prctice/Pages/Auth/view/signupart3.dart';
import 'package:nike_prctice/Pages/Auth/view/signuppart2.dart';
import 'package:nike_prctice/Pages/Home/view/Maindashboard.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/utils/commonutils.dart';

class Authprovider extends ChangeNotifier {
  // Variables
  DateTime? selecteddate;
  int? selectedday;
  int? selectedmonth;
  int? selectedyear;
  String? errorMessage = '';
  TextEditingController daycontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fistnamecontroller = TextEditingController();
  TextEditingController surnamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  String _getMonthName(int monthNumber) {
    const List<String> monthNames = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[monthNumber];
  }

  bool ispasswordObscured = true;
  bool get passwordObscured => ispasswordObscured;

  // Pick Day function
  Future<void> pickday(BuildContext context) async {
    final DateTime? pickedday = await showDatePicker(
      initialDate: selecteddate ?? DateTime.now(),
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (pickedday != null && pickedday.day != selectedday) {
      selectedday = pickedday.day;
      selecteddate = DateTime(pickedday.year, pickedday.month, pickedday.day);
      daycontroller.text = selectedday.toString();
      notifyListeners();
    }
  }

  // Pick month
  Future<void> pickmonth(BuildContext context) async {
    final DateTime? pickedMonthDate = await showDatePicker(
      initialDate: selecteddate ?? DateTime.now(),
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (pickedMonthDate != null && pickedMonthDate.month != selectedmonth) {
      selectedmonth = pickedMonthDate.month;
      selecteddate = DateTime(
        pickedMonthDate.year,
        pickedMonthDate.month,
        pickedMonthDate.day,
      );
      monthcontroller.text = _getMonthName(selectedmonth!);
      notifyListeners();
    }
  }

  // Function for selecting year
  Future<void> pickyear(BuildContext context) async {
    final DateTime? pickedYearDate = await showDatePicker(
      initialDate: selecteddate ?? DateTime.now(),
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (pickedYearDate != null && pickedYearDate.year != selectedyear) {
      selectedyear = pickedYearDate.year;
      selecteddate = DateTime(
        pickedYearDate.year,
        pickedYearDate.month,
        pickedYearDate.day,
      );
      yearcontroller.text = selectedyear.toString();
      notifyListeners();
    }
  }

  // Obscuring
  void toggleabilitypassword() {
    ispasswordObscured = !ispasswordObscured;
    notifyListeners();
  }

  // SiginUP and verify otp
  Future<void> verifyOtpAndSignUp(BuildContext context) async {
    final String username = fistnamecontroller.text;
    try {
      final otpResponse = await PostApiServices().resetemailotpverify(
        emailcontroller.text,
        otpcontroller.text,
      );

      if (otpResponse['status'] == 'success') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Email verified successfully")));
        final signUpResponse = await PostApiServices().signUp(
          fistnamecontroller.text,
          surnamecontroller.text,
          passwordcontroller.text,
          daycontroller.text,
          monthcontroller.text,
          yearcontroller.text,
          emailcontroller.text.trim(),
        );

        if (signUpResponse["status"] == "success") {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Signed up successfully")));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => Signupart3(prefilledname: username),
            ),
          );
        } else {
          errorMessage = signUpResponse["message"];
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorMessage!)));
        }
      } else {
        errorMessage = otpResponse["message"];
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage!)));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong: $e")));
    }

    notifyListeners();
  }

  // Signin

  void sendvaluestosigninapi(BuildContext context) async {
    try {
      final response = await PostApiServices().signin(emailcontroller.text);
      if (response['status'] == 'success') {
        final String username = response['Firstname'] ?? '';
        print("signined in with username:$username");
        MessengerUtil.showSnackBar(
          context,
          'Signin Successfully',
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.validIconGreen,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Maindashboard(fetchedusername: username),
          ),
        );
      } else {
        errorMessage = response['message'];
      }
    } catch (e) {
      MessengerUtil.showSnackBar(
        context,
        '$e',
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.accent,
      );
    }
    notifyListeners();
  }

  // Send email otp

  void sendvaluestoemailotp(BuildContext context) async {
    final String useremail = emailcontroller.text;
    try {
      final response = await PostApiServices().emailotpsend(useremail);
      if (response['status'] == 'success') {
        print("User signed in successfully with name: $useremail");
        MessengerUtil.showSnackBar(
          context,
          'OTP send via Email',
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.validIconGreen,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Signuppart2(prefilledEmail: useremail),
          ),
        );
      } else {
        errorMessage = response['message'];
      }
    } catch (e) {
      MessengerUtil.showSnackBar(
        context,
        '$e',
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.accent,
      );
    }
    notifyListeners();
  }

  // validate

  Future<bool> validateall(
    BuildContext context,
    GlobalKey<FormState> key,
  ) async {
    final formState = key.currentState;
    if (formState != null && formState.validate()) {
      MessengerUtil.showSnackBar(
        context,
        'Validation Sucessfull',
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.validIconGreen,
      );
      return true;
    } else {
      MessengerUtil.showSnackBar(
        context,
        'Validation Failed',
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.accent,
      );
      return false;
    }
  }

  // disposing
  @override
  void dispose() {
    daycontroller.dispose();
    monthcontroller.dispose();
    yearcontroller.dispose();
    super.dispose();
  }
}
