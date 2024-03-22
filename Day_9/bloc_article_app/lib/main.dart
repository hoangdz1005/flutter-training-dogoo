import 'package:bloc_pattern/ui/app_colors.dart';
import 'package:bloc_pattern/ui/article_list_screen.dart';
import 'package:flutter/material.dart';

import 'bloc/article_list_bloc.dart';
import 'bloc/bloc_provider.dart';
void main() {
  runApp(const ArticleFinder());
}

class ArticleFinder extends StatelessWidget {
  const ArticleFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleListBloc>(
        bloc: ArticleListBloc(),
        child: const MaterialApp(
          title: 'Demo App',
          home: ArticleListScreen(),
        ));
  }
}