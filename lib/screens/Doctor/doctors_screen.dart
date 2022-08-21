import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Appointment Booking/doctor_filtter.dart';

class DoctorsScreen extends StatefulWidget {
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
        title: Text(AppLocalizations.of(context)!.appointment,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            )),
        titleSpacing: 2,
        leading: Container(
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
                return  Container(
                  // width: 100,
                  // height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Color(0xff0E4C8F),width: 0.5),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0, 10),
                    //     blurRadius: 70,
                    //     color: Colors.grey.withOpacity(0.23),
                    //   ),
                    // ],
                  ),

                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                                width: 144,
                                height: 114,
                              ),
                            ),
                          ),
                          Text(
                            'د. محمد محمود',
                            style: const TextStyle(
                              color: Color(0xff2D2D2D),
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'طبيب اسنان',
                            style: const TextStyle(
                              color: Color(0xff2D2D2D),
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.normal,
                            ),),
                        ],

                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        // left: 0,
                        child: Container(
                          width: 200,
                          height: 43,
                          decoration: const BoxDecoration(
                            color: Color(0xff0E4C8F),
                            borderRadius:  BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10),),
                          ),
                          child: Text('عرض ملف الطبيب',style:  TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                          ),textAlign: TextAlign.center,),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                );
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
