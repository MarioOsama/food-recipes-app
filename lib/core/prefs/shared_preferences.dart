import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> get isNewUser async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  if (isFirstTime == true) {
    // Change user status
    prefs.setBool('isFirstTime',
        false); // set to true for testing, do not forget to change it to false when done
  }
  return isFirstTime;
}

// Favorites
Future<void> setFavorite(String recipeId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> favorites = prefs.getStringList('favorites') ?? [];
  favorites.add(recipeId);
  prefs.setStringList('favorites', favorites);
}

Future<void> removeFavorite(String recipeId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> favorites = prefs.getStringList('favorites') ?? [];
  favorites.remove(recipeId);
  prefs.setStringList('favorites', favorites);
}

Future<List<String>> getFavorites() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> favorites = prefs.getStringList('favorites') ?? [];
  return favorites;
}

Future<void> setFavoritesIds(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('favorites', <String>[
    id,
  ]);
}

Future<List<String>> getFavoritesIds() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? ids = prefs.getStringList('favorites');
  return ids ?? [];
}

  setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }
