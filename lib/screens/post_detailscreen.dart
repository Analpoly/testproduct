// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../models/post_model.dart';

// class PostDetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final PostModel post = Get.arguments;

//     return Scaffold(
//       appBar: AppBar(title: Text("Post Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Title:",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//             Text(post.title),
//             SizedBox(height: 20),
//             Text("Description:",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//             Text(post.body),
//             SizedBox(height: 20),
//             Text("User ID: ${post.userId}"),
//             Text("Post ID: ${post.id}"),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/post_model.dart';

class PostDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostModel post = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 6),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title("Title"),
              Text(post.title,
                  style: const TextStyle(fontSize: 18, height: 1.4)),

              const SizedBox(height: 25),

              _title("Description"),
              Text(post.body,
                  style: const TextStyle(fontSize: 16, height: 1.5)),

              const SizedBox(height: 25),

              _title("User Information"),
              Text("User ID: ${post.userId}",
                  style: const TextStyle(fontSize: 16)),
              Text("Post ID: ${post.id}",
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }
}
