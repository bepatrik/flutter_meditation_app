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
    category: 'Fast Sounds',
  ),
  SongsModelUI(
    category: 'Romantic Sounds',
  ),
  SongsModelUI(
    category: 'Nature Sounds',
  ),
  SongsModelUI(
    category: 'Calm Sounds',
  ),
  SongsModelUI(
    category: 'Sleepy Sounds',
  ),
  SongsModelUI(
    category: 'Study Sounds',
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

  Categories({
    this.categoryName,
    this.songName,
  });
}

List<Categories> songsCategories = [
  /*---------------------
  Fast Songs
  -----------------------*/
  Categories(
    categoryName: 'Fast Sounds',
    songName: 'music_(1).mpeg',
  ),
  Categories(
    categoryName: 'Fast Sounds',
    songName: 'music_(2).mpeg',
  ),
  Categories(
    categoryName: 'Fast Sounds',
    songName: 'music_(3).mpeg',
  ),
  Categories(
    categoryName: 'Fast Sounds',
    songName: 'music_(4).mpeg',
  ),
  Categories(
    categoryName: 'Fast Sounds',
    songName: 'music_(5).mpeg',
  ),

  /*---------------------
  Romantic
  -----------------------*/
  Categories(
    categoryName: 'Romantic Sounds',
    songName: 'Romantic1.mpeg',
  ),

  /*---------------------
  Nature Songs
  -----------------------*/
  Categories(
    categoryName: 'Nature Sounds',
    songName: 'nature1.mpeg',
  ),
  Categories(
    categoryName: 'Nature Sounds',
    songName: 'nature2.mpeg',
  ),
  Categories(
    categoryName: 'Nature Sounds',
    songName: 'nature3.mpeg',
  ),
  Categories(
    categoryName: 'Nature Sounds',
    songName: 'nature4.mpeg',
  ),
  Categories(
    categoryName: 'Nature Sounds',
    songName: 'nature5.mpeg',
  ),

  /*---------------------
  Calm Songs
  -----------------------*/
  Categories(
    categoryName: 'Calm Sounds',
    songName: 'calm1.mpeg',
  ),
  Categories(
    categoryName: 'Calm Sounds',
    songName: 'calm2.mpeg',
  ),
  Categories(
    categoryName: 'Calm Sounds',
    songName: 'calm3.mpeg',
  ),
  Categories(
    categoryName: 'Calm Sounds',
    songName: 'calm4.mpeg',
  ),
  Categories(
    categoryName: 'Calm Sounds',
    songName: 'calm5.mpeg',
  ),

  /*---------------------
  Sleepy Songs
  -----------------------*/
  Categories(
    categoryName: 'Sleepy Sounds',
    songName: 'sleepy1.mpeg',
  ),

  /*---------------------
  Study Songs
  -----------------------*/
  Categories(
    categoryName: 'Study Sounds',
    songName: 'No Songs yet in it',
  ),
];
