// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/colorscheme.dart';

class HomemDetailed extends StatelessWidget {
  HomemDetailed({super.key, required this.item});
  Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.pista,
        title: const Text("Home Detailed"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/google.png",
                    height: 100,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      item["company_name"],
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Text(
                item["title"] ?? "",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.work,
                    color: AppColors.pista,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Job Type :- ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    item["employment_type"],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.pista,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        item["location_names"].length < 1
                            ? "(Remote)"
                            : "(On-Site)",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.pista,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Full Time",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person_2_sharp,
                    color: AppColors.pista,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "HR:-",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    item["employer_name"],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_rounded,
                    color: AppColors.pista,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Duration of Internship: = ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    item["duration"],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.attach_money_rounded,
                    color: AppColors.pista,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "stipend:- ${item["stipend"]["salary"]} " +
                          item["start_date"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Text(
                  //   item["start_date"],
                  //   style: const TextStyle(
                  //       fontSize: 16, fontWeight: FontWeight.w500),
                  // ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Skill: android sdk , storage , application performance , java , technical requirements , threading; Exp: 1-4 years; PRIMARY RESPONSIBILITIES Minimum 1 3 year Experience in flutter Development Strong knowledge of IOS, Android SDK, different versions of Android, and how to deal with different screen sizes Familiarity with RESTful APIs to connect Android applications to back-end services Strong knowledge of ISO, Android UI design principles, patterns, and best practices Experience with offline storage, threading, and performance tuning Ability to design applications around natural user interfaces Responsibilities and Duties Design and build advanced applications for the flutter platform Unit-test code for robustness, including edge cases, usability, and reliability Work on bug fixing and improving application performance Translate designs and wireframes into high-quality code Understand business requirements and translate them into technical requirements Design, build, and maintain high performance, reusable, and reliable Java code Ensure the best possible performance, quality, and responsiveness of the application Continuously discover, evaluate, and implement new technologies to maximize development efficiency",
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
