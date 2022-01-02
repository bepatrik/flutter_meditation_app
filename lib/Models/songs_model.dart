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

////This List is only for to make UI
List<SongsModelUI> songsUI = [
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

///Class For Filtering
///Using CategoryName as Category
///Like Fast,sad e.t.c song
///-------------------------------
///Using songName as song's name
///Like music_(1).mpeg
class Categories {
  String categoryName;
  String songName;

  Categories({this.categoryName, this.songName});
}

List<Categories> songs = [
  Categories(
    categoryName: 'Fast Songs',
    songName: 'music_(1).mpeg',
  ),
  Categories(
    categoryName: 'Fast Songs',
    songName: 'music_(2).mpeg',
  ),
  Categories(
    categoryName: 'Calm Songs',
    songName: 'music_(3).mpeg',
  ),
  Categories(
    categoryName: 'Sleepy Songs',
    songName: 'music_(4).mpeg',
  ),
  Categories(
    categoryName: 'Study Songs',
    songName: 'music_(5).mpeg',
  ),
];
