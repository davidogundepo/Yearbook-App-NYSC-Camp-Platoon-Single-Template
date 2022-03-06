
class CampCorpersCoordinators {
  String image;
  String name;
  String positionEnforced;
  String id;

  CampCorpersCoordinators.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    name = data['name'];
    positionEnforced = data['position_enforced'];
    id = data['id'];
  }
}