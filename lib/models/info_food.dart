class InfoFood {
  String name;
  String preparation;
  String ingredients;
  int index;
  String type;
  bool favorite;
  InfoFood(
      {this.index,
      this.type,
      this.name,
      this.preparation,
      this.ingredients,
      this.favorite = false});
  void changeFavorite() {
    favorite = !favorite;
  }
}
