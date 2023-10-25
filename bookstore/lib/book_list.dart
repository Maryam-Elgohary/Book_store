import 'package:bookstore/sql_bd.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  SqlDb sqlDb = SqlDb();
  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * from books");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readData(),
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${snapshot.data![i]["coverurl"]}")))),
                  title: Text("${snapshot.data![i]["title"]}"),
                  subtitle: Text("${snapshot.data![i]["author"]}"),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete)),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
