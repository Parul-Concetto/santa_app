class ChildrenModel {
  final int id;
  final String name;
  final String country;
  final bool? isNaughty;

  ChildrenModel(
      {required this.id,
      required this.name,
      required this.country,
      this.isNaughty});
}
