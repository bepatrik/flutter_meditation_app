class SongsModelUI {
  ///Category is to filter Songs Categories Name
  String category;

  ///String name is getting Songs name
  String name;

  SongsModelUI({
    this.category,
    this.name,
  });
}

List<SongsModelUI> audios = [
  SongsModelUI(
    category: 'Fast Songs',
  ),
  SongsModelUI(
    category: 'Calm Songs',
  ),
  SongsModelUI(
    category: 'Sleepy Songs',
  ),
  SongsModelUI(
    category: 'Study Songs',
  ),
];
