
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../bar/textfield_search.dart';

class search_page extends StatefulWidget{
  const search_page({super.key});

  @override
  State<StatefulWidget> createState() => search_page_view();

}

class search_page_view extends State<search_page> {
  late TextEditingController _controller;
  PageStorageBucket pageStorageBucket = PageStorageBucket();

  List<SearchCardData> data_view = [
    SearchCardData(stockNum: 22.2, name: "BitCoin", lastChange: 0.13),
    SearchCardData(stockNum: 22.2, name: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", lastChange: 0.13)
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void clearText() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFAFAFA),
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () => {
                Navigator.pop(context)
              },
              child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.arrow_back_sharp, size: 30, color: Colors.black,)
              ),
            ),
          ),
          title: const Text(
            "Search Page",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(Icons.search),
                      ),
                      suffixIcon: GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(Icons.clear),
                        ),
                        onTap: () {
                          clearText();
                        },
                      ),
                      hintText: "Search here...."
                  ),
                  controller: _controller,
                  onSubmitted: (String value) async {
                    await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const search_page())
                    );
                  },
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.5
                ),
                itemCount: data_view.length,
                itemBuilder: (context, index) {
                  var sObj = data_view[index];

                  return SearchCard(
                    data: sObj,

                  );
                },

              )
            ],
          ),
        )
    );
  }

}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no actor is found with this name'),
      ],
    );
  }
}

class SearchCard extends StatelessWidget {
  final SearchCardData data ;
  const SearchCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 120,
                width: 15,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 120,
                    child: Text(
                      data.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                  Text(
                    data.stockNum.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14

                    ),
                  ),
                  Text(
                    data.lastChange.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: data.lastChange <= 0.0 ? Colors.red : Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class SearchCardData {
  double stockNum;
  String name;
  double lastChange;

  SearchCardData({
    required this.stockNum,
    required this.name,
    required this.lastChange,
  });
}