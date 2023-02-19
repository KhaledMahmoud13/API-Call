import 'package:api_example/ApiClient.dart';
import 'package:flutter/material.dart';

import 'model/Post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post>? posts;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await ApiClient().getPosts();
    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Integration'),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                leading: Text('${posts![index].userId}'),
                title: Text(posts![index].title),
                subtitle: Text(posts![index].body),
              ),
            );
          },
        ),
      ),
    );
  }
}
