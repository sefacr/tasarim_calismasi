import 'package:flutter/material.dart';
import 'package:dart_dersleri/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
    Widget customTextButton(String text, VoidCallback onPressed, {double? size, double? radius}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius ?? 35)))
        ),
        child: Text(
          text,
          style: TextStyle(color: writeColor1, fontSize: size),
        ),
      ),
    );
  }

  Widget customText(String text, Color color, double size, {FontWeight? fontWeight, TextAlign? textAlign}) {
    return Text(text, 
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      ),
    textAlign: textAlign,

    );
  }

  @override
  Widget build(BuildContext context) {
    var screenDetail = MediaQuery.of(context); 
    final double screenHeight = screenDetail.size.height;
    final double screenWidth = screenDetail.size.width;

    print(screenHeight);
    print(screenWidth);

    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza",style: TextStyle(color: writeColor1, fontWeight: FontWeight.bold, fontFamily: "Pacifico", fontSize: 22)),
        backgroundColor: mainColor, 
        centerTitle: true,        
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight / 43), // bu şekilde dinamik size verebiliyoruz
            child: Text(d!.headerPizza, style: TextStyle(fontSize: 36, color: mainColor, fontWeight: FontWeight.bold),),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset('photos/pizza_photo.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*
                TextButton(onPressed: (){},
                style: TextButton.styleFrom(backgroundColor: mainColor), 
                child: Text("Cheesse", style: TextStyle(color: writeColor1),),
                ),
                TextButton(onPressed: (){},
                style: TextButton.styleFrom(backgroundColor: mainColor), 
                child: Text("Sausage", style: TextStyle(color: writeColor1),),
                ),
                TextButton(onPressed: (){},
                style: TextButton.styleFrom(backgroundColor: mainColor), 
                child: Text("Olive", style: TextStyle(color: writeColor1),),
                ),
                TextButton(onPressed: (){},
                style: TextButton.styleFrom(backgroundColor: mainColor), 
                child: Text("Pepper", style: TextStyle(color: writeColor1),),
                ),
                */
                //customTextButton("Cheese", () {}),
                ChipButton(text: d.productCheese),
                customTextButton(d.productSausage, () {}),
                customTextButton(d.productOlive, () {}),
                customTextButton(d.productPepper, () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                customText(d.deliveryDuration, writeColor2, 22, fontWeight: FontWeight.bold),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: customText(d.deliveryTitle, mainColor, 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(child: customText(d.explainPizza, writeColor2, 22, textAlign: TextAlign.center)),
              ],
            ), 
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                customText(d.amount, mainColor, 44, fontWeight: FontWeight.bold),
                const Spacer(),
                SizedBox(width: 200, height: 50,
                  child: customTextButton(d.buttonTitle, () { }, size: 18, radius: 5)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// ignore: must_be_immutable
class ChipButton extends StatelessWidget {
  String text;
  ChipButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
      style: TextButton.styleFrom(backgroundColor: mainColor), 
      child: Text(text, style: TextStyle(color: writeColor1),),
    );
  }
}
