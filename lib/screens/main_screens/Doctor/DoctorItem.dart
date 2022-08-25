import 'package:flutter/material.dart';

import 'doctor_details.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: InkWell(
              onTap: ()=>Navigator.pushNamed(context, DoctorDetails.routeName),
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
          ),
        ],
      ),
    );
  }
}