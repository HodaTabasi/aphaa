import 'package:aphaa_app/screens/in_level_screen/medical_recipes/print_medical_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedicalRecipesItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xff0E4C8F), width: 0.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16,16, 16,10),
                child: Text.rich(
                  TextSpan(
                    text: 'رقم الفاتورة:  ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  #11235  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16,16, 16,10),
                child: Text.rich(
                  TextSpan(
                    text: 'تاريخ الزيارة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  20.8.2022  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'الطبيب المعالج ',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  د. محمود أحمد  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'العيادة:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' أسنان  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'هل تم الصرف من المشفى ؟ ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Tajawal'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  نعم  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            fontSize: 12,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => PrintMedicalRecipesButtomSheet(),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8,0,16,10),
                  child: SvgPicture.asset(
                    'assets/images/print.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    isScrollControlled: true,

                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => PrintMedicalRecipesButtomSheet(),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16,0,8,10),
                  child: SvgPicture.asset(
                    'assets/images/show.svg',
                    semanticsLabel: 'Acme Logo',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
