import 'package:flutter/material.dart';
import 'package:flutter_news/helpers/favorite_article_notifier.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/views/article_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsCard extends ConsumerWidget {
  final ArticleModel article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteArticleProvider);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                  article: article,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(article.urlToImage)),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(favorites.contains(article) ? Icons.favorite : Icons.favorite_border,  color: Colors.red,),
                  onPressed: () {
                    if (favorites.contains(article)) {
                      ref.read(favoriteArticleProvider.notifier).remove(article);
                    } else {
                      ref.read(favoriteArticleProvider.notifier).add(article);
                    }
                  },
                ),
              )
            ]),
            Text(
              article.title,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              article.description,
              style: const TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}