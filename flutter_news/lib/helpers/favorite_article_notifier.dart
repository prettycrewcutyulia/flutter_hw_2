import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/article_model.dart';

final favoriteArticleProvider = StateNotifierProvider<FavoriteArticleNotifier, List<ArticleModel>>((ref) => FavoriteArticleNotifier());

class FavoriteArticleNotifier extends StateNotifier<List<ArticleModel>> {
  FavoriteArticleNotifier() : super([]) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final articles = prefs.getStringList('favorite_articles');
    state = articles != null
        ? articles.map((article) => ArticleModel.fromJson(json.decode(article))).toList()
        : [];
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorite_articles', state.map((article) => json.encode(article.toJson())).toList());
  }

  void add(ArticleModel article) {
    state = [...state, article];
    // Save to storage whenever favorites updates
    saveFavorites();
  }

  void remove(ArticleModel article) {
    state = state.where((element) => element != article).toList();
    // Save to storage whenever favorites updates
    saveFavorites();
  }
}
