import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Widget AllTab() {
    return GestureDetector(

      child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                  image: NetworkImage(
                      "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Thông báo abc",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.green, fontSize: 19),
              ),
              Container(
                child: const Row(
                  children: [
                    Icon(Icons.access_time, size: 15),
                    Text(
                      " mấy giờ trước",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 0.5,
                  decoration: const BoxDecoration(color: Colors.black54),
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const TabBar(tabs: [
              Tab(
                text: "Tất cả",
              ),
              Tab(
                text: "Nổi bật",
              ),
              Tab(
                text: "Yêu thich",
              ),
            ]),
            Expanded(
              child: TabBarView(children: [
                ListView(
                  children: [
                    AllTab(),
                    AllTab(),
                    AllTab(),
                    AllTab(),
                    AllTab(),
                  ],
                ),
                Container(
                  child: const Text("Nổi bật tab"),
                ),
                Container(
                  child: const Text("Yêu thích tab"),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
