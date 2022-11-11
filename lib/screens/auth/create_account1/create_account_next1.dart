import 'package:aphaa_app/api/controllers/hospital_controller.dart';
import 'package:aphaa_app/get/new_account_getx_controller.dart';
import 'package:aphaa_app/model/Eligibility.dart';
import 'package:aphaa_app/screens/drawer_screens/buttom_navication.dart';
import 'package:aphaa_app/screens/main_screens/done_login/done_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../api/controllers/auth_api_controller.dart';
import '../../../firebase/fb_auth_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/dropdown_item.dart';
import '../../../general/dropdown_item_insurance.dart';
import '../../../general/edittext_item.dart';

import 'package:aphaa_app/helper/helpers.dart';
import '../../../model/InsuranceCompany.dart';
import '../../../model/api_response.dart';
import '../../../preferences/shared_pref_controller.dart';
import '../../drawer_screens/home_screen/home_screen.dart';

class CreateAccountNext1 extends StatefulWidget {
  static String routeName = "/create_account_next1";
  final String? restorationId = "1";

  @override
  State<CreateAccountNext1> createState() => _CreateAccountNext1State();
}

class _CreateAccountNext1State extends State<CreateAccountNext1>
    with SingleTickerProviderStateMixin, RestorationMixin, Helpers1 {
  late TabController controller;
  late TextEditingController insurance_number;
  late TextEditingController insurance_date;
  late TextEditingController employer;
  String name = 'assets/images/image2.svg';

  int myIndex = 0;
  String payType = "insurance";
  List<InsuranceCompany> myData = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    insurance_number = TextEditingController(text: "1203256");
    insurance_date = TextEditingController();
    employer = TextEditingController();
    getData();
  }

  getData() async {
    NewAccountGetxController.to.eligibility!.isInsured == "true"
        ? payType = "insurance"
        : payType = "cash";
    isLoading = true;
    myData = await HospitalApiController().getInsuranceCompany();
    setState(() {
      isLoading = false;
    });
  }

  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        insurance_date.text =
            "${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}";

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            // physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 30.h,
              ),
              SvgPicture.asset(name, semanticsLabel: 'Acme Logo'),
              SizedBox(
                height: 8.h,
              ),
              Divider(
                height: 2.h,
                thickness: 1,
                endIndent: 16,
                indent: 16,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 50.h,
              ),
              Visibility(
                visible:
                    NewAccountGetxController.to.eligibility?.isInsured ==
                        "true",
                child: Column(
                  children: [
                    EditTextItem('assets/images/snum.svg',
                        AppLocalizations.of(context)!.insurance_number,
                        controler: insurance_number),
                    InkWell(
                      onTap: () {
                        _restorableDatePickerRouteFuture.present();
                      },
                      child: EditTextItem('assets/images/Calendarg.svg',
                          AppLocalizations.of(context)!.insurance_end_date,
                          controler: insurance_date, b: false),
                    ),
                    DropDownInsuranceItem(
                      myData,
                      'assets/images/company.svg',
                      AppLocalizations.of(context)!.insurance_companies,
                      dropIntValue: 1,
                    ),
                    BtnLayout(
                        AppLocalizations.of(context)!
                            .register,
                        () => _performRegister()),
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible:
                    NewAccountGetxController.to.eligibility?.isInsured ==
                        "false",
                child: Column(
                  children: [
                    EditTextItem(
                      'assets/images/company.svg',
                      AppLocalizations.of(context)!.employer,
                      controler: employer,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BtnLayout(AppLocalizations.of(context)!.create_account,
                        () => _performRegister()),
                    SizedBox(
                      height: 80.h,
                    ),
                    Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
        await _login();
    }
  }

  // checkEligibility() async {
  //   Eligibility? eligibility = await HospitalApiController()
  //       .getPtElg(patientId: insurance_number.text);
  //   if (eligibility!.patientCode!.isNotEmpty) {
  //     NewAccountGetxController.to.patient.p_code = eligibility.patientCode;
  //     print(eligibility);
  //     await _login();
  //   } else {
  //     showSnackBar2(context,
  //         message:
  //             'رقم  التأمين الذي أدخلته خاطئ ، قم باستكمال التسجيل إلى كاش ، ومن تم تسجيل الدخول للتطبيق',
  //         error: true);
  //   }
  // }

  bool _checkData() {
    if (payType == "insurance") {
      if (insurance_date.text.isNotEmpty && insurance_number.text.isNotEmpty) {
        return true;
      }
    } else {
      if (employer.text.isNotEmpty) return true;
    }

    showSnackBar(context,
        message: AppLocalizations.of(context)!.enter_required_data,
        error: true);
    return false;
  }

  Future<void> _login() async {
    print(NewAccountGetxController.to.patient);
    showLoaderDialog(context);
    NewAccountGetxController.to.flag = false;
    if (payType == "insurance") {
      NewAccountGetxController.to.patient.insuranceNumber =
          insurance_number.text;
      NewAccountGetxController.to.patient.insuranceDate = insurance_date.text;
      NewAccountGetxController.to.patient.insuranceName =
          NewAccountGetxController.to.companyName;
      NewAccountGetxController.to.patient.payingType = payType;
    } else {
      NewAccountGetxController.to.patient.payingType = payType;
      NewAccountGetxController.to.patient.Employer = employer.text;
      NewAccountGetxController.to.flag = true;
    }

    FireBaseAuthController().verifyPhoneNumber1(
        context: context, userPhone: 568828102,flag :NewAccountGetxController.to.flag);

    // print(NewAccountGetxController.to.patient);
    // print(NewAccountGetxController.to.patient.insuranceDate);
  }
}
