import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helpers/favorite_article_notifier.dart';
import 'package:flutter_news/views/components/news_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNews extends ConsumerWidget {
  const FavoriteNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArticles = ref.watch(favoriteArticleProvider);

    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Text('Flutter'),
          Text('News'.tr(),
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor))
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: favoriteArticles.isEmpty
            ? Center(
                child: Text('No favorite articles'.tr(),
                    style: TextStyle(
                        color: Theme.of(context)
                            .textSelectionTheme
                            .selectionColor)))
            : ListView.builder(
                itemCount: favoriteArticles.length,
                itemBuilder: (context, index) {
                  final article = favoriteArticles[index];
                  return NewsCard(article: article);
                },
              ),
      ),
    );
  }
}
