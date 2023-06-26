import 'package:flutter/material.dart';

class DialogueFrame extends StatefulWidget {
  const DialogueFrame({super.key});

  @override
  State<DialogueFrame> createState() => _DialogueFrameState();
}

class _DialogueFrameState extends State<DialogueFrame> {
  late TextEditingController controller;
  String comment = '';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          TextField(
            controller: TextEditingController(text: 'This is first comment'),
            onChanged: (value) {},
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(133, 224, 231, 234),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              hintText: 'This is the first comment',
              suffixIcon: IconButton(
                onPressed: () async {
                  final comment = await openDialog();
                  if (comment == null || comment.isEmpty) return;
                  setState(() => this.comment = comment);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(155, 172, 138, 247),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "New comment was added",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                },
                icon: const Icon(Icons.add),
              ),
              prefixIcon: const Icon(Icons.account_circle_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(197, 223, 225, 229),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          autofocus: false,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 27, 30, 32),
                              fontSize: 22),
                          initialValue: comment,
                          decoration: InputDecoration(
                            hintText: comment,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Type below'),
          content: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(133, 224, 231, 234),
              hintText: 'Comment',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
            controller: controller,
            onSubmitted: (value) => add(),
          ),
          actions: [
            ElevatedButton(
              onPressed: add,
              child: const Text('Add'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            )
          ],
        ),
      );
  void add() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }
}
