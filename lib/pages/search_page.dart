import 'package:flutter/material.dart';

import 'package:flickro/pages/zoom_page.dart';
import 'package:flickro/widgets/network_img.dart';
import 'package:flickro/services/flickr_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String tag = "";
  List images = [];
  bool isLoading = false;

  void search() async {
    setState(() {
      isLoading = true;
    });

    try {
      List fetchedImages = await FlickrApi.getImageByString(tag);

      setState(() {
        images = fetchedImages;
      });
    } catch (e) {
      //
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20.0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: search),
                hintText: 'Enter tags here...'),
            onChanged: (value) {
              tag = value;
            },
          ),
          isLoading
              ? const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ZoomPage(image: images[index]),
                              ),
                            );
                          },
                          child: AspectRatio(
                              aspectRatio: 1.0,
                              child: NetworkImg(image: images[index])));
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
