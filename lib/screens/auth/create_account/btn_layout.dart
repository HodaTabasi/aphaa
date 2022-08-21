import 'package:flutter/material.dart';

class BtnLayout extends StatelessWidget {
  String title;
  int value;
  int groupValue;
  ValueChanged onChanged;

  BtnLayout({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged});


  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(9.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: isSelected
                    ? MaterialStateProperty.all(Color(0xff0E4C8F))
                    : MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14, color: Colors.white,fontFamily: 'Tajawal')),elevation: MaterialStateProperty.all(0),),
            onPressed: () {

              // NavigationService.navigationService.navigateTo(GMap.routeName);
                onChanged(value);
              // showDialog(context: context,
              //     builder: (BuildContext context){
              //       return CustomDialogBox(
              //         title: "Custom Dialog Demo",
              //         // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
              //         // text: "Yes",
              //       );
              //     }
              // );
            },
            child: Text(
              "$title",
              style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white : Color(0xff0E4C8F),
                  fontWeight: FontWeight.w700 ),
            ),
          ),
        ),
      ),
    );
  }
}
