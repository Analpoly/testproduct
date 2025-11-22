// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/post_controller.dart';

// class HomeScreen extends StatelessWidget {
//   final PostController postController = Get.put(PostController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Posts")),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               onChanged: (value) => postController.filterPosts(value),
//               decoration: InputDecoration(
//                 labelText: "Search",
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),

//           // Posts List
//           Expanded(
//             child: Obx(() {
//               if (postController.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (postController.errorMessage.isNotEmpty) {
//                 return Center(child: Text(postController.errorMessage.value));
//               }

//               return ListView.builder(
//                 itemCount: postController.filteredPosts.length,
//                 itemBuilder: (context, index) {
//                   final post = postController.filteredPosts[index];
//                   return ListTile(
//                     title: Text(
//                       post.title,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     subtitle: Text(post.body),
//                     onTap: () => Get.toNamed('/postDetails', arguments: post),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/post_controller.dart';

// class HomeScreen extends StatelessWidget {
//   final PostController postController = Get.put(PostController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Posts")),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               onChanged: (value) => postController.filteredPosts(),
//               decoration: const InputDecoration(
//                 labelText: "Search",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),

//           // Posts List
//           Expanded(
//             child: Obx(() {
//               // LOADING
//               if (postController.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               // ERROR HANDLING
//               if (postController.errorMessage.isNotEmpty) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         postController.errorMessage.value,
//                         style: const TextStyle(
//                           color: Colors.red,
//                           fontSize: 16,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 15),
//                       ElevatedButton(
//                         onPressed: () => postController.fetchPosts(),
//                         child: const Text("Retry"),
//                       ),
//                     ],
//                   ),
//                 );
//               }

//               // POSTS LIST
//               return ListView.builder(
//                 itemCount: postController.filteredPosts.length,
//                 itemBuilder: (context, index) {
//                   final post = postController.filteredPosts[index];
//                   return ListTile(
//                     title: Text(
//                       post.title,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     subtitle: Text(post.body),
//                     onTap: () => Get.toNamed('/postDetails', arguments: post),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomeScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) => postController.filterPosts(value),
              decoration: InputDecoration(
                hintText: "Search posts...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ),

          // Posts List
          Expanded(
            child: Obx(() {
              // LOADING
              if (postController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              // ERROR HANDLING
              if (postController.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        postController.errorMessage.value,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () => postController.fetchPosts(),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }

              // POSTS LIST UI
              return ListView.builder(
                itemCount: postController.filteredPosts.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final post = postController.filteredPosts[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        post.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          post.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      onTap: () =>
                          Get.toNamed('/postDetails', arguments: post),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
