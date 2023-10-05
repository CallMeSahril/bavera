import 'package:bavera/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli/extensions/string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  final _membersStream =
      Supabase.instance.client.from('members').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _buildShowDialog(context);
          },
          child: Icon(Icons.add),
        ),
        body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: _membersStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final notes = snapshot.data!;

              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text("${notes[index]['id']} " + notes[index]['name']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        controller.deleteMember(notes[index]['id']);
                      },
                    ),
                  );
                },
              );
            }
          },
        ));
  }

  Future<dynamic> _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Name"),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: controller.nameController,
              style: const TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  fontFamily: 'DM Sans',
                  fontSize: 12,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(243, 244, 246, 1), width: 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  controller.addMebers(controller.nameController.text);
                  Get.back();
                },
                child: Text("Tambah Member"))
          ],
        );
      },
    );
  }
}
