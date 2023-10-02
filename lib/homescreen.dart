import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> mlist = [
    "akash",
    "gill",
    "amit",
    "ankur",
    "ajay",
    "bablu",
    "babli",
    "biju",
    "bajirav",
    "chakur",
    "chatur",
    "china",
    "cate",
    "date",
    "dear",
    "door",
    "dingle",
    "eagle",
    "eat",
    "eagle",
    "error",
    "fox",
    "fear",
    "four",
    "fifty",
    "fix",
    "gate",
    "gill",
    "gulab",
    "gunjan",
    "gujarat",
    "hindu",
    "heat",
    "hear",
    "hill",
    "hillstation",
    "hemat",
    "indo",
    "ideal",
    "india",
    "indexthrow",
    "jecky",
    "jess",
    "jupiter",
    "juice",
    "kamal",
    "kartik",
    "kishor",
    "kullu",
    "mayur",
    "max",
    "meat",
    "milk",
    "minsta",
    "myself",
    "mydear"
  ];

  @override
  void initState() {
    // TODO: implement initState+
    _sortList();
    super.initState();
  }

  _sortList() {
    mlist.sort((a, b) => a.compareTo(b));
    _filterList();
    _sortedData();
  }

  _sortedData() {
    var cli = ['CL1', "CL2", "Cl3", "CL4"];
    List<UserDetails> userDetaillist = [];
    List<int> age = [10, 20, 50, 60,];
    for (int i = 0; i < cli.length; i++) {
      UserDetails userDetails = UserDetails();
      userDetails.name = cli[i];
      userDetails.age = age[i];
      userDetaillist.add(userDetails)
      ;
    }
    filterData.clintlist.addAll(cli);

    filterData.userDetail.addAll(userDetaillist);

    // Make sure to set the filterData object to the class variable
    // This ensures that the data is available in the build method
    setState(() {
      filterData = filterData;
    });
  }

  List<NameData> finalList = [];
  List<String> searchList = [];

  _filterList() {
    String temp = '';
    List<String> nameList = [];

    for (var name in mlist) {
      if (name[0] == temp) {
        nameList.add(name);
      } else {
        if (nameList.isNotEmpty) {
          List<String> nameList1 = [];
          nameList1.addAll(nameList);
          NameData nameData = NameData();
          nameData.name = nameList[0][0];
          nameData.nameList = nameList1;

          finalList.add(nameData);
        }
        nameList.clear();
        temp = name[0];
        nameList.add(name);
      }
    }

    setState(() {});
  }

  final searchController = TextEditingController();
  FilterData filterData = FilterData() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  _searchForFilterData(value);
                },
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "search client cli data",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              // searchController.text.isNotEmpty
              //     ? Expanded(
              //   child: ListView.builder(
              //       itemCount: searchList.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Container(
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 10, vertical: 10),
              //           margin: const EdgeInsets.symmetric(
              //               horizontal: 10, vertical: 6),
              //           decoration: BoxDecoration(
              //             color: Colors.pink.shade50,
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //           child: Text(searchList[index]),
              //         );
              //       }),
              // )
              //     : Expanded(
              //   child: ListView.builder(
              //       itemCount: finalList.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         NameData nameData = finalList[index];
              //         return Column(
              //           children: [
              //             GestureDetector(
              //               onTap: () =>
              //               {
              //                 finalList[index].isExpand =
              //                 !finalList[index].isExpand,
              //                 setState(() {}),
              //               },
              //               child: Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 10, vertical: 10),
              //                 margin: const EdgeInsets.symmetric(
              //                     horizontal: 10, vertical: 0),
              //                 decoration: BoxDecoration(
              //                   color: Colors.pink.shade50,
              //                   borderRadius: BorderRadius.circular(12),
              //                 ),
              //                 child: Text(nameData.name),
              //               ),
              //             ),
              //             ListView.builder(
              //                 itemCount: nameData.nameList.length,
              //                 physics:
              //                 const NeverScrollableScrollPhysics(),
              //                 shrinkWrap: true,
              //                 itemBuilder:
              //                     (BuildContext context, int index) {
              //                   return Container(
              //                     height: nameData.isExpand ? null : 0,
              //                     padding: const EdgeInsets.symmetric(
              //                         horizontal: 10, vertical: 10),
              //                     margin: const EdgeInsets.symmetric(
              //                         horizontal: 10, vertical: 6),
              //                     decoration: BoxDecoration(
              //                       color: Colors.pink.shade50,
              //                       borderRadius:
              //                       BorderRadius.circular(12),
              //                     ),
              //                     child: Text(nameData.nameList[index]),
              //                   );
              //                 }),
              //           ],
              //         );
              //       }),
              // ),

              // Inside your HomeScreen class...
              searchController.text.isNotEmpty
                  ? Expanded(
                child: ListView.builder(
                    itemCount: searchListFilterData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(searchListFilterData[index]),
                      );
                    }),
              ) :
              Expanded(
                child: ListView.builder(
                    itemCount: filterData.clintlist.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(filterData.clintlist[index],style: TextStyle(color: Colors.red),),
                            Text(filterData.userDetail[index].age.toString(),style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      );
                    }
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }



  List<String> searchListFilterData  =[] ;
  _searchForFilterData(String str){
    searchListFilterData.clear() ;
    if(str.isNotEmpty){
      for (int i = 0; i < filterData.clintlist.length; i++) {
        if (filterData.clintlist[i].toLowerCase().contains(str.toLowerCase())) {
          searchListFilterData.add(filterData.clintlist[i]);
        }
      }
      setState(() {

      });
    }
  }
  _searchName(String str) {
    searchList.clear();
    if (str.isNotEmpty) {
      for (int i = 0; i < mlist.length; i++) {
        if (mlist[i].toLowerCase().contains(str.toLowerCase())) {
          searchList.add(mlist[i]);
          print(searchList);
        }
      }
      setState(() {});
    }
  }
}

class NameData {
  String name = '';
  List<String> nameList = [];
  bool isExpand = false;
}

class FilterData {
  List<String> clintlist = [];

  List<UserDetails> userDetail = [];
}


class UserDetails {
  String name = "";

  int age = 10;
}
