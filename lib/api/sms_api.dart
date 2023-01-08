import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/SmsResponse.dart';

class SMSAPI {
  // final AppId ="aITmKadPP1gfR4dZilznAYFOvh7HFw55d4";
  final AppId = "APaa07617b9c61411b96bd25465de57cc1";
  final token ='eyJhbGciOiJIUzI1NiJ9.eyJzZXJ2aWNlX2lkIjoiQVBhYTA3NjE3YjljNjE0MTFiOTZiZDI1NDY1ZGU1N2NjMSJ9.CrIU59v-pm4DcXvSD4r1Fzc27grYSIcJomXX-XknNfQ';
  /*
  bQDpgbpKqAVtpV0UpfuiObGP8M2Sqi	 defult
  655JiUmYbdxs79msjINv0OOACn5Ajf   normal

  token
  eyJhbGciOiJIUzI1NiJ9.eyJzZXJ2aWNlX2lkIjoiQVBhYTA3NjE3YjljNjE0MTFiOTZiZDI1NDY1ZGU1N2NjMSJ9.CrIU59v-pm4DcXvSD4r1Fzc27grYSIcJomXX-XknNfQ

APaa07617b9c61411b96bd25465de57cc1  app id
  * */
  final BaseUrl = "el.cloud.unifonic.com";
  final sendUrl = "/rest/SMS/messages";
  final getCodeUrl = "/rest/Verify/GetCode";
  final verifyUrl = "/rest/Verify/VerifyNumber";

  Future<SmsResponse?> sendSMS({Recipient, Body}) async {
    var myParms = {
      'locale': 'en',
      'length': '4',
      'channel': 'sms',
      'to': '$Recipient',
    };
    // final uri = Uri.http('authenticate.cloud.api.unifonic.com', '/services/api/v2/verifications/start', myParms);
    final uri1 = Uri.parse(
        "https://authenticate.cloud.api.unifonic.com/services/api/v2/verifications/start");

    print(uri1);
    var response = await http.post(uri1, body: myParms, headers: {
      'Authorization':'$token',
      'accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'x-authenticate-app-id': '$AppId',
    });
    print("drger${response.body}");
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return SmsResponse.fromJson(jsonResponse);
    }
    return null;
  }

  Future<void> getCode({phoneNumber, Recipient, Body}) async {
    var myParms = {
      'AppSid': '$AppId',
      'Recipient': '$Recipient',
      'Body': '$Body' //code
    };
    final uri = Uri.http(BaseUrl, '$getCodeUrl', myParms);
    var response = await http.post(uri);

    print(response);
  }

  Future<SmsResponse?> VerifyCode({phoneNumber, PassCode}) async {
    var myParms = {
      'channel': 'sms',
      'to': '$phoneNumber',
      'code': '$PassCode'
    };
    // final uri = Uri.http(BaseUrl, '$verifyUrl', myParms);
    final uri1 = Uri.parse(
        "https://authenticate.cloud.api.unifonic.com/services/api/v2/verifications/check");

    var response = await http.post(uri1,body: myParms, headers: {
      'Authorization':'$token',
      'accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'x-authenticate-app-id': '$AppId',
    });
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return SmsResponse.fromJson(jsonResponse);
    }
    return null;
  }
}
