import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:genshin_characters/Src/Model/Model.dart';
import 'package:genshin_characters/Src/Chara/Card.dart';
import 'package:genshin_characters/Src/Chara/Detail.dart';
import 'package:genshin_characters/Src/Constant/Constant.dart';

class CharaList extends StatefulWidget {
  const CharaList({Key? key}) : super(key: key);

  @override
  State<CharaList> createState() => _CharaListState();
}

class _CharaListState extends State<CharaList> {
  Widget appBarTitle = const Text('Genshin Characters',style: TextStyle(color: Colors.blue,fontSize: 22),);
  Icon actionIcon = const Icon(Icons.search,color: Colors.blue,);

  TextEditingController controller = TextEditingController();
  List<CharaModel> charaData = [];
  List<CharaModel> _filteredList = [];
  String filter = '';

  @override
  void dispose(){
    controller.addListener(() {
      if(controller.text.isEmpty){
        setState((){
          filter = '';
          _filteredList = charaData;
        });
      }else{
        setState((){
          filter = controller.text;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTopAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: appBarTitle,
      actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: (){
            setState((){
              if(actionIcon.icon == Icons.search){
                actionIcon == const Icon(
                  Icons.close,
                  color: Colors.redAccent,
                );
                appBarTitle = TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.blue,),
                    hintText: 'Search Here',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                  ),
                  style: const TextStyle(color: Colors.blue,fontSize: 20),
                  autofocus: true,
                  cursorColor: Colors.black,
                );
              }else{
                actionIcon = const Icon(
                  Icons.search,
                  color: Colors.blue,
                );
                appBarTitle = const Text ('Genshin Charactes',style: TextStyle(color: Colors.blue,fontSize: 22),);
                _filteredList = charaData;
                controller.clear();
              }
            });
          },
        )
      ],
    );

    if((filter.isNotEmpty)){
      List<CharaModel> tmpListChara = <CharaModel>[];
      for (int i = 0; i<_filteredList.length; i++){
        if(_filteredList[i].name!.toLowerCase().contains(filter.toLowerCase())){
          tmpListChara.add(_filteredList[i]);
        }
      }
      _filteredList = tmpListChara;
    }

    if(filter.isNotEmpty && _filteredList.isNotEmpty){
      return Scaffold(
        appBar: appTopAppBar,
        body: Center(
          child: Text(
            'Character ${filter.toString()} is not found :(',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 22
            ),
          ),
        ),
      );
    }else{
      return Scaffold(
        appBar: appTopAppBar,
        body: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints){
            if(constraints.maxWidth<600){
              return _generateContainer(2);
            }else if(constraints.maxWidth<900){
              return _generateContainer(4);
            }else{
              return _generateContainer(6);
            }
          },
        ),
      );
    }
  }

  Widget _generateContainer(int value){
    Future<List<CharaModel>> readJsonData() async {
      final jsondata = await root_bundle.rootBundle.loadString('Material/Data.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e){
        return CharaModel.fromJson(e);
      }).toList();
    }

    return Center(
      child: FutureBuilder(
        future: readJsonData(),
        builder: (context,snapshot) {
          if (snapshot.data != null) {
            charaData = snapshot.data as List<CharaModel>;
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }

          if((filter.isEmpty)){
            _filteredList = charaData;
          }

          return MasonryGridView.count(
            mainAxisSpacing: 4,
            crossAxisCount: value,
            crossAxisSpacing: 4,
            itemCount: _filteredList.length,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            itemBuilder: (context,index){
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CharaDetail(
                                  name:             _filteredList[index].name.toString(),
                                  vision:           _filteredList[index].vision.toString(),
                                  weapon:           _filteredList[index].weapon.toString(),
                                  nation:           _filteredList[index].nation.toString(),
                                  affiliation:      _filteredList[index].affiliation.toString(),
                                  rarity:           _filteredList[index].rarity!,
                                  constellation:    _filteredList[index].constellation.toString(),
                                  birthday:         _filteredList[index].birthday.toString(),
                                  description:      _filteredList[index].description.toString(),
                                  obtain:           _filteredList[index].obtain.toString(),
                                  gender:           _filteredList[index].gender.toString(),
                                  imagePortrait:    _filteredList[index].imagePortrait.toString(),
                                  imageCard:        _filteredList[index].imageCard.toString(),
                                  imageWish:        _filteredList[index].imageWish.toString(),
                                  backgroundColor:  _filteredList[index].rarity == 5 ? AppColor.rarity5 : AppColor.rarity4,
                                );
                              },
                            )
                        );
                      },
                      child: CustomCard(
                        height: _filteredList[index].name.toString().length > 14 ? 270 : 250,
                        customColor: _filteredList[index].rarity == 5 ? AppColor.rarity5 : AppColor.rarity4,
                        customImage: _filteredList[index].imagePortrait.toString(),
                        customButtonColor: AppColor.peachButtonColor,
                        charName: _filteredList[index].name.toString(),
                        charVision: _filteredList[index].vision.toString(),
                        charNation: _filteredList[index].nation.toString(),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

