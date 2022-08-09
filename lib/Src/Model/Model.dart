class CharaModel{
  int?id;
  int?rarity;
  String?name;
  String?vision;
  String?weapon;
  String?nation;
  String?affiliation;
  String?constellation;
  String?birthday;
  String?description;
  String?obtain;
  String?gender;
  String?imagePortrait;
  String?imageCard;
  String?imageWish;

  CharaModel({
    this.name,
    this.description,
    this.id,
    this.affiliation,
    this.birthday,
    this.constellation,
    this.gender,
    this.imageCard,
    this.imagePortrait,
    this.imageWish,
    this.nation,
    this.obtain,
    this.rarity,
    this.vision,
    this.weapon
});

  CharaModel.fromJson(Map<String,dynamic> json){
    id = json["id"];
    name = json["name"];
    vision = json["vision"];
    weapon = json["weapon"];
    nation = json["nation"];
    affiliation = json["affiliation"];
    rarity = json["rarity"];
    constellation = json["constellation"];
    birthday = json["birthday"];
    description = json["description"];
    obtain = json["obtain"];
    gender = json["gender"];
    imagePortrait = json["image_portrait"];
    imageCard = json["image_card"];
    imageWish = json["image_wish"];
  }
}