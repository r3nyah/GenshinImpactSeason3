import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genshin_characters/Src/Constant/Constant.dart';

class CharaDetail extends StatelessWidget {
  final String name;
  final String vision;
  final String weapon;
  final String nation;
  final String affiliation;
  final String constellation;
  final String birthday;
  final String description;
  final String obtain;
  final String gender;
  final String imagePortrait;
  final String imageCard;
  final String imageWish;
  final int rarity;
  final Color backgroundColor;

  const CharaDetail({
    Key? key,
    required this.weapon,
    required this.vision,
    required this.rarity,
    required this.obtain,
    required this.nation,
    required this.imageWish,
    required this.imagePortrait,
    required this.imageCard,
    required this.gender,
    required this.constellation,
    required this.birthday,
    required this.affiliation,
    required this.description,
    required this.name,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String fourStar = 'https://static.wikia.nocookie.net/gensin-impact/images/7/77/Icon_4_Stars.png/revision/latest?cb=20201226100702';
    const String fiveStar = 'https://static.wikia.nocookie.net/gensin-impact/images/2/2b/Icon_5_Stars.png/revision/latest?cb=20201226100736';
    String imgRarity = '';

    if(rarity == 5){
      imgRarity = fiveStar;
    }else{
      imgRarity = fourStar;
    }
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    color: backgroundColor,
                    child: Center(
                      child: Image.network(
                        imageWish,
                        height: MediaQuery.of(context).size.height*0.5,
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
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.cardGreyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.angleLeft,
                            color: AppColor.mainTextColor,
                          ),
                        ),
                      ),
                    ),
                      Expanded(
                        child: Container(),
                      ),
                      SvgPicture.asset(
                        'img/svg/menu.svg',
                        height: 40,
                        width: 40,
                        color: AppColor.mainTextColor,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.36,
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.006,
                          ),
                          Image.network(
                            imgRarity,
                            width: 90,
                            height: 39,
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
                          SizedBox(height: MediaQuery.of(context).size.height*0.006,),
                          Text(
                            gender,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondTextColor,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.006,),
                          Text(
                            'Birthday : $birthday',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.006,),
                          Text(
                            'Constellation : $constellation',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Container(
                                alignment: AlignmentDirectional.center,
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color   : vision == 'Anemo'   ? Colors.greenAccent
                                          : vision == 'Hydro'   ? Colors.lightBlueAccent
                                          : vision == 'Geo'     ? Colors.amberAccent
                                          : vision == 'Electro' ? Colors.deepPurpleAccent
                                          : vision == 'Pyro'    ? Colors.redAccent
                                          : vision == 'Cryo'    ? Colors.cyanAccent
                                          :AppColor.secondTextColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(
                                      10.0,
                                    ),
                                    topRight: Radius.circular(
                                      10.0,
                                    ),
                                    bottomLeft: Radius.circular(
                                      10.0,
                                    ),
                                    bottomRight: Radius.circular(
                                      10.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  vision,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nation: ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColor.mainTextColor,
                                    ),
                                  ),
                                  Text(
                                    nation,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Characters Description',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.006,),
                          Text(
                            description,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 18,
                              color: AppColor.mainTextColor
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Text(
                            'Obtain Via',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.mainTextColor,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.006,),
                          Text(
                            obtain,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 18,
                              color: AppColor.mainTextColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
