import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Appointment Booking/doctor_filtter.dart';
import 'DoctorItem.dart';

class DoctorsScreen extends StatefulWidget {
  static String routeName = "/doctors";
  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.doctors,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: InkWell(
          onTap: ()=>Navigator.of(context, rootNavigator: true).pop(),
          child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(5.0),
              // alignment: Alignment.bottomLeft,
              // width: 80,
              // height: 500,
              decoration: BoxDecoration(
                  color: const Color(0xff006F2C),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              )),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(140, 171, 205, 0.12),
                              width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(140, 171, 205, 0.12),
                              width: 0.5),
                        ),
                        hintText: 'البحث عن طبيب',
                        hintStyle: TextStyle(
                          color: Color(0xff739ECC),
                          fontSize: 13,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Color.fromRGBO(140, 171, 205, 0.12),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: Color(0xff0E4C8F),
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    isScrollControlled: false,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => DoctorFillter(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Color(0xff0E4C8F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 240/330
              ),
              itemBuilder: (context, index) {
                return  DoctorItem();
              },
            ),
          ),
          Image.asset(
            "assets/images/image1.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}


