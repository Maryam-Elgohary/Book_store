import 'package:bookstore/book_list.dart';
import 'package:flutter/material.dart';

import 'floating_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

//  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AVAILABLE BOOKS"),
          centerTitle: true,
        ),
        body: const BookList(),
        floatingActionButton: const FButton());
  }
}
