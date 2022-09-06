import 'package:aphaa_app/api/controllers/quick_service_api_controller.dart';
import 'package:aphaa_app/general/doctor_dropdown_item.dart';
import 'package:aphaa_app/general/dropdown_item.dart';
import 'package:aphaa_app/get/quick_service_getx_controller.dart';
import 'package:aphaa_app/helper/helper.dart';
import 'package:aphaa_app/model/doctor.dart';
import 'package:aphaa_app/screens/main_screens/send_consult/text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aphaa_app/helper/helpers.dart' as myHelper;

import '../../../api/controllers/App_api_controller.dart';
import '../../../api/controllers/auth_api_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';
import '../../../model/api_response.dart';

class SendConsultScreen extends StatefulWidget {
  static String routeName = "/send_consult";
  @override
  State<SendConsultScreen> createState() => _SendConsultScreenState();
}

class _SendConsultScreenState extends State<SendConsultScreen> with Helpers ,myHelper.Helpers{
  var myData = ["شركة1", "شركة2", "شركة3"];
  List<Doctor> myDataDoctor = [];

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController consultText;

  @override
  void initState() {
    name = TextEditingController(text: "aisal yosef alsawaf");
    email = TextEditingController(text: "aisal@hotmail.com");
    phone = TextEditingController(text: "0154421157");
    consultText = TextEditingController(text: "any thing");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getAllDoctors();
  }

  Future<void> getAllDoctors() async {
    myDataDoctor = await AppApiController().getAllDoctors();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.consultation_request,style:  TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin:  EdgeInsets.all(15.0.r),
              padding:  EdgeInsets.all(5.0.r),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5.r)),
              child:  Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              )),
        ),
      ),
      body: ListView(
        children: [
           SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: Text(
              AppLocalizations.of(context)!.head_of_consult_screen,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Form(
            child: Column(
              children: [
                EditTextItem('assets/images/Profile.svg',AppLocalizations.of(context)!.pasent_name ,controler: name,),
                EditTextItem('assets/images/Message.svg', AppLocalizations.of(context)!.email,controler: email,),
                EditTextItem('assets/images/phone.svg', AppLocalizations.of(context)!.phone,controler: phone,),
                DropDownItem(
                    myData, 'assets/images/hospital.svg', AppLocalizations.of(context)!.clenice_choesse,dropIntValue: 3,),
                DoctorDropDownItem(
                    myDataDoctor, 'assets/images/docgreen.svg', AppLocalizations.of(context)!.dovtor_choesse,dropIntValue: 2,),
                 TextAreaWidget(consultText)
              ],
            ),
          ),
           SizedBox(height: 10.h),
          BtnLayout(AppLocalizations.of(context)!.consult_send, () => _performAction()),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  Future<void> _performAction() async {
    if (_checkData()) {
      await _sendConsult();
    }
  }

  bool _checkData() {

    if (email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        consultText.text.isNotEmpty  &&
        name.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _sendConsult() async {
    print(QuickServiceGetxController().doctorId.value);
    showLoaderDialog(context);
    ApiResponse apiResponse = await QuickServiceApiController().consultation(email: email.text,mobile: phone.text,name: name.text,description: consultText.text,clinic: QuickServiceGetxController.to.clinicName,doctors_id: QuickServiceGetxController.to.doctorId);
    if (apiResponse.success) {
      Navigator.pop(context);
      showAlertDialog(context);
    }
    Navigator.pop(context);
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
