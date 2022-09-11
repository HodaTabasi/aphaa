import 'dart:io';

import 'package:aphaa_app/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';


import '../../../api/controllers/quick_service_api_controller.dart';
import '../../../general/btn_layout.dart';
import '../../../general/edittext_item.dart';

import 'package:aphaa_app/helper/helpers.dart' as myHelper ;

import '../../../model/api_response.dart';

class OpeningMedicalFile extends StatefulWidget {
  static String routeName = "/open_media_file";

  @override
  State<OpeningMedicalFile> createState() => _OpeningMedicalFileState();
}

class _OpeningMedicalFileState extends State<OpeningMedicalFile> with Helpers, myHelper.Helpers {

  late TextEditingController name;
  late TextEditingController userId;
  late TextEditingController phone;
  late TextEditingController inCompany;
  late TextEditingController inId;

  XFile? _pickedImage;
  late ImagePicker _imagePicker;



  @override
  void initState() {
    name = TextEditingController(text: "aisal yosef alsawaf");
    userId = TextEditingController(text: "aisal@hotmail.com");
    phone = TextEditingController(text: "0154421157");
    inCompany = TextEditingController(text: "cash");
    inId = TextEditingController(text: "2520");
    _imagePicker = ImagePicker();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.opening_medical_file,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: () => Navigator.of(context, rootNavigator: true).pop(),
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
          const SizedBox(
            height: 10,
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
                EditTextItem('assets/images/Profile.svg',
                    AppLocalizations.of(context)!.pasent_name,controler: name,),
                EditTextItem('assets/images/id.svg', AppLocalizations.of(context)!.identity_iqama,controler: userId,),
                EditTextItem('assets/images/phone.svg',
                    AppLocalizations.of(context)!.phone,controler: phone,),
                EditTextItem('assets/images/scure.svg', AppLocalizations.of(context)!.insurance_company_cash,controler: inCompany,),
                EditTextItem(
                    'assets/images/scureId.svg', AppLocalizations.of(context)!.insurance_policy_number,controler: inId),
                InkWell(
                  onTap: () async {
                    await _pickImage();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Color(0xff0E4C8F), width: 0.5.w),
                    ),
                    margin: EdgeInsets.all(16.r),
                    child: Column(
                      children: [
                        // LinearProgressIndicator(
                        //   minHeight: 10,
                        //   backgroundColor: Colors.green.shade200,
                        //   color: Colors.green.shade700,
                        //   value: _progressValue,
                        // ),
                        Expanded(
                          child: _pickedImage != null
                              ? Image.file(File(_pickedImage!.path))
                              : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              SvgPicture.asset('assets/images/Upload.svg',
                                  semanticsLabel: 'Acme Logo'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(AppLocalizations.of(context)!.attach_a_copy_of_your_id,
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13.sp,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                  )),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          BtnLayout(AppLocalizations.of(context)!.opening_medical_file, () =>_performUpload()),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }


  Future<void> _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 80);
    if (imageFile != null) {
      setState(() => _pickedImage = imageFile);
    }
  }

  Future<void> _performUpload() async {
    if (_checkData()) {
      await _uploadImage();
    }
  }

  bool _checkData() {

    if (userId.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        name.text.isNotEmpty  &&
        inId.text.isNotEmpty  &&
        inCompany.text.isNotEmpty && _pickedImage != null) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _uploadImage() async {
    showLoaderDialog(context);
    ApiResponse apiResponse = await QuickServiceApiController().openFile(mobile: phone.text,name: name.text,identity_number: userId.text,insurance_number: inId.text,paying_type: inCompany.text,image:  _pickedImage!.path);
    if (apiResponse.success) {
      Navigator.pop(context);
      showAlertDialog(context);
    }else {
      Navigator.pop(context);
    }

    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
