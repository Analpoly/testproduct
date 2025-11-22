// import 'dart:async';
// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/post_model.dart';

// class PostController extends GetxController {
//   RxBool isLoading = true.obs;
//   RxString errorMessage = ''.obs;

//   RxList<PostModel> allPosts = <PostModel>[].obs;
//   RxList<PostModel> filteredPosts = <PostModel>[].obs;

//   @override
//   void onInit() {
//     fetchPosts();
//     super.onInit();
//   }

//   // Future<void> fetchPosts() async {
//   //   try {
//   //     isLoading(true);
//   //     errorMessage('');

//   //     final response = await http
//   //         .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//   //     if (response.statusCode == 200) {
//   //       final List data = json.decode(response.body);
//   //       allPosts.value = data.map((e) => PostModel.fromJson(e)).toList();
//   //       filteredPosts.value = allPosts;
//   //     } else {
//   //       errorMessage('Failed to load posts');
//   //     }
//   //   } catch (e) {
//   //     errorMessage(e.toString());
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }

//   // void filterPosts(String query) {
//   //   if (query.isEmpty) {
//   //     filteredPosts.value = allPosts;
//   //   } else {
//   //     filteredPosts.value = allPosts
//   //         .where((post) =>
//   //             post.title.toLowerCase().contains(query.toLowerCase()))
//   //         .toList();
//   //   }
//   // }

// Future<void> fetchPosts() async {
//   try {
//     isLoading(true);
//     errorMessage('');

//     final response = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
//         .timeout(const Duration(seconds: 8));

//     if (response.statusCode == 200) {
//       final List data = json.decode(response.body);
//       allPosts.value = data.map((e) => PostModel.fromJson(e)).toList();
//       filteredPosts.value = allPosts;
//     } else {
//       errorMessage("Server Error: ${response.statusCode}");
//     }
//   } on SocketException {
//     errorMessage("No Internet Connection");
//   } on TimeoutException {
//     errorMessage("Request Timed Out, Please Try Again");
//   } catch (e) {
//     errorMessage("Something went wrong");
//   } finally {
//     isLoading(false);
//   }
// }

// }




import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post_model.dart';

class PostController extends GetxController {
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  RxList<PostModel> allPosts = <PostModel>[].obs;
  RxList<PostModel> filteredPosts = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
          .timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        allPosts.value = data.map((e) => PostModel.fromJson(e)).toList();
        filteredPosts.value = allPosts;
      } else {
        errorMessage("Server Error: ${response.statusCode}");
      }
    } on SocketException {
      errorMessage("No Internet Connection");
    } on TimeoutException {
      errorMessage("Request Timed Out, Please Try Again");
    } catch (e) {
      errorMessage("Something went wrong");
    } finally {
      isLoading(false);
    }
  }

  // void filterPosts(String query) {
  //   if (query.isEmpty) {
  //     filteredPosts.value = allPosts;
  //   } else {
  //     filteredPosts.value = allPosts
  //         .where((post) =>
  //             post.title.toLowerCase().contains(query.toLowerCase()) ||
  //             post.body.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   }
  // }
  void filterPosts(String query) {
  if (query.isEmpty) {
    filteredPosts.value = allPosts;
  } else {
    filteredPosts.value = allPosts
        .where((post) =>
            post.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

}
