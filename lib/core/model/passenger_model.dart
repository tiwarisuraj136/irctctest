class Passenger {
  String name;
  String gender;
  String preference;
  bool selected;

  Passenger({required this.name, required this.gender, required this.preference, this.selected = false});
}