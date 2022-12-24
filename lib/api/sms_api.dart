import 'package:http/http.dart' as http;

class SMSAPI {
  // final AppId ="aITmKadPP1gfR4dZilznAYFOvh7HFw55d4";
  final AppId ="ABHA_international_Private_Hospitals-TRX-KvF9";
  final BaseUrl = "el.cloud.unifonic.com";
  final sendUrl = "/rest/SMS/messages";
  final getCodeUrl = "/rest/Verify/GetCode";
  final verifyUrl = "/rest/Verify/VerifyNumber";

  Future<void> sendSMS({Recipient,Body}) async {
    var myParms = {
      'AppSid':'$AppId',
      'Recipient':'$Recipient',
      'Body':'$Body'
    };
    final uri = Uri.http(BaseUrl, '$sendUrl', myParms);
    final uri1 = Uri.parse("https://api.unifonic.com/rest/Verify/GetCode?AppSid=$AppId&Recipient=$Recipient&Body=$Body");

    print(uri1);
    var response = await http.post(uri1,headers: {'Content-Type':'application/josn'});

    print("drger${response.body}");
  }

  Future<void> getCode({phoneNumber,Recipient,Body}) async {
    var myParms = {
      'AppSid':'$AppId',
      'Recipient':'$Recipient',
      'Body':'$Body' //code
    };
    final uri = Uri.http(BaseUrl, '$getCodeUrl', myParms);
    var response = await http.post(uri);

    print(response);
  }

  Future<void> VerifyCode({phoneNumber,Recipient,PassCode}) async {
    var myParms = {
      'AppSid':'$AppId',
      'Recipient':'$Recipient',
      'PassCode':'$PassCode'
    };
    final uri = Uri.http(BaseUrl, '$verifyUrl', myParms);
    var response = await http.post(uri);

    print(response);
  }
}