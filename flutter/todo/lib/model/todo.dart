class Todo {
  int _id;
  String _title;
  String _description;
  String _year;
  String _month;
  String _day;
  int _priority;

  Todo(this._title, this._priority, this._year, this._month, this._day, [this._description]);
  Todo.withId(this._id, this._title, this._priority, this._year, this._month, this._day, [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get year => _year;
  String get month => _month;
  String get day => _day;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set year(String newYear) {
    _year = newYear;
  }

  set month(String newMonth) {
    _month = newMonth;
  }

  set day(String newDay) {
    _day = newDay;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["year"] = _year;
    map["month"] = _month;
    map["day"] = _day;
    if(_id != null){
      map["id"] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o){
    this._id = o["id"];
    this._title = o["title"];
    this._description = o["description"];
    this._priority = o["priority"];
    this._year = o["year"];
    this._month = o["month"];
    this._day = o["day"];
  }

}