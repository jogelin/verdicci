class News {

  String _id;
  String _name;
  String _image;
  String _description;


  News(this._id, this._name, this._image, this._description);

  String get id => _id;
  set id(String value) => _id = value;

  String get image => _image;
  set image(String value) => _image = value;

  String get description => _description;
  set description(String value) => _description = value;

  String get name => _name;
  set name(String value) => _name = value;
}

class Styles {

  String _id;
  String _name;
  String _label;
  String _description;
  List<String> _images;
  String _brandIcon;
  String _category;


  Styles(this._id, this._name, this._label, this._description, this._images, this._brandIcon, this._category);

  String get id => _id;
  set id(String value) => _id = value;

  String get brandIcon => _brandIcon;
  set brandIcon(String value) => _brandIcon = value;

  List<String> get images => _images;
  set images(List<String> value) => _images = value;

  String get description => _description;
  set description(String value) => _description = value;

  String get label => _label;
  set label(String value) => _label = value;

  String get name => _name;
  set name(String value) => _name = value;

  String get category => _category;
  set category(String value) => _category = value;


}