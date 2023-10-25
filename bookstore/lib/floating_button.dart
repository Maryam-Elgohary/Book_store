import 'package:bookstore/sql_bd.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class FButton extends StatefulWidget {
  const FButton({super.key});

  @override
  State<FButton> createState() => _FButtonState();
}

class _FButtonState extends State<FButton> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _coverURLController = TextEditingController();
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
              ),
              context: context,
              builder: (context) {
                return SizedBox(
                    height: 270,
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                hintText: "Book Title",
                                labelText: "Enter the book title",
                              ),
                            ),
                            TextFormField(
                              controller: _authorController,
                              decoration: const InputDecoration(
                                hintText: "Book Author",
                                labelText: "Enter the book author",
                              ),
                            ),
                            TextFormField(
                              controller: _coverURLController,
                              decoration: const InputDecoration(
                                hintText: "Book Cover URL",
                                labelText: "Enter the book cover url",
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await sqlDb.insertData(
                                        '''INSERT INTO books (title, author, coverurl)
                                      VALUES ("${_titleController.text}", "${_authorController.text}", "${_coverURLController.text}")
                                      
                                      ''');
                                  },
                                  child: const Text("Add"),
                                ))
                          ],
                        )));
              });
        });
  }
}
