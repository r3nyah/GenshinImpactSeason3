import 'package:flutter/material.dart';
import 'package:genshin_characters/Src/Constant/Constant.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final Color customColor;
  final String customImage;
  final Color customButtonColor;
  final String charName;
  final String charVision;
  final String charNation;

  const CustomCard({
    Key? key,
    required this.height,
    required this.charName,
    required this.charNation,
    required this.charVision,
    required this.customButtonColor,
    required this.customColor,
    required this.customImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      width: 200,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: customColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20,),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(right: 13),
                  child: Text(
                    charName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,)
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20
            ),
            child: Text(
              charNation,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.mainTextColor,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: Image.network(
              customImage,
              width: 140,
              loadingBuilder: (context,child,loadingProgress){
                if(loadingProgress == null){
                  return child;
                }else{
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}