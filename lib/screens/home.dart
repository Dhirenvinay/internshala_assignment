import 'package:flutter/material.dart';
import 'package:internshalaassignment/utils/colorscheme.dart';
import 'package:internshalaassignment/screens/homedetailed.dart';
import 'package:internshalaassignment/provider/homeprovider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<HomeProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: AppBar(
        backgroundColor: AppColors.pista,
        title: const Text("Home"),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          final searchResults = homeProvider.searchInternships(
              homeProvider.ids, homeProvider.data, searchController.text);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    homeProvider.refresh();
                  },
                  decoration: InputDecoration(
                    labelText: 'Search by Job Title',
                    labelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.pista),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                        homeProvider.refresh();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final item = searchResults[index];
                    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                        item["postedOnDateTime"] * 1000);
                    String formattedDate =
                        DateFormat('dd MMMM y').format(dateTime);

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomemDetailed(item: item)));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.pista),
                            // border: Border(),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 5,
                                // blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),

                          // shape: ContinuousRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15),
                          //     side: const BorderSide(color: AppColors.pista)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      "assets/images/google.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Text(
                                    item["company_name"],
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      item["title"] ?? "",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(item["location_names"].length < 1
                                        ? ""
                                        : "(On-Site)"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Apply by : " + item["application_deadline"],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: (item["location_names"]
                                        as List<dynamic>)
                                    .map(
                                      (location) => Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.pista,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            location,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Posted On:- " + formattedDate,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      item["posted_by_label"],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
