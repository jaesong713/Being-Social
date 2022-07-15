import 'package:beingsocial/Pages/conversations.dart';
import 'package:beingsocial/Pages/profile.dart';
import 'package:beingsocial/forms/postform.dart';
import 'package:beingsocial/model/post.dart';
import 'package:beingsocial/services/firestore_service.dart';
import 'package:beingsocial/widgets/Loading.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final FirestoreService _fs = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Social Stream"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ConversationsPage()));
                },
                icon: const Icon(Icons.message)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showPostField,
          child: const Icon(Icons.post_add),
        ),
        body: StreamBuilder<List<Post>>(
          stream: _fs.posts,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshots) {
            if (snapshots.hasError) {
              return Center(child: Text(snapshots.error.toString()));
            } else if (snapshots.hasData) {
              var posts = snapshots.data!;
              var filterpost = [];
              for (var element in posts) {
                if (element.creator == "SomeId") {
                  filterpost.add(element);
                }
              }

              return posts.isEmpty
                  ? const Center(child: Text("Aint no POst Biiihhhhhhh"))
                  : ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                              title: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile(
                                                observedUser: FirestoreService
                                                        .userMap[
                                                    posts[index].creator]!)));
                                  },
                                  child: Text(FirestoreService
                                      .userMap[posts[index].creator]!.name)),
                              subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(posts[index].content),
                                    const SizedBox(height: 10),
                                    Text(posts[index]
                                        .createdAt
                                        .toDate()
                                        .toString())
                                  ])));
            }
            return const Loading();
          },
        ));
  }

  //Displays a ModalPopUp that shows a text field and submit button for Post

  void _showPostField() {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return const PostForm();
        });
  }
}
