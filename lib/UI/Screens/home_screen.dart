import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tbdd/until/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget FeaturedServices(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: MediaQuery.of(context).size.width / 4,
        child: Column(children: [
          const Image(
              image: NetworkImage(
                  "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
          const Text(
            "Dịch vụ abcccc",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ]),
      ),
      Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: const Image(
                image: NetworkImage(
                    "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
          ),
          const Text(
            "Dịch vụ abc",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: const Image(
                image: NetworkImage(
                    "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
          ),
          const Text(
            "Dịch vụ abc",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.green, fontSize: 15),
          ),
        ],
      )
    ],
  );
}

Widget ContacsUs(BuildContext context){
  return Container(
    height: 130,
    child: Column(
      children: [
        Text("Về chúng tôi",style: TextStyle(color: color.colorWord),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              color: color.colorPrimary,
              width: MediaQuery.of(context).size.width/8,
              height: 30,
              child: Icon(Icons.web,size: 18,color: Colors.white,),
            ),
            Container(
              color: color.colorPrimary,
              width: MediaQuery.of(context).size.width/8,
              height: 30,
              child: Icon(Icons.tiktok,size: 18,color: Colors.white,),
            ), Container(
              color: color.colorPrimary,
              width: MediaQuery.of(context).size.width/8,
              height: 30,
              child: Icon(Icons.youtube_searched_for,size: 18,color: Colors.white,),
            ), Container(
              color: color.colorPrimary,
              width: MediaQuery.of(context).size.width/8,
              height: 30,
              child: Icon(Icons.facebook,size: 18,color: Colors.white,),
            ), Container(color: color.colorPrimary,
              width: MediaQuery.of(context).size.width/8,
              height: 30,
              child: Icon(Icons.message,size: 18,color: Colors.white,),
            ), Container(color: color.colorPrimary,
              width: MediaQuery.of(context).size.width/8,
              height: 30,
              child: Icon(Icons.phone,size: 18,color: Colors.white,),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Container(
          width: double.infinity,
          height: 25,
          decoration: BoxDecoration(
            color: color.colorPrimary
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_in_talk_sharp,size: 16,color: Colors.white,),
              Text(" Hotline 0123456",style: TextStyle(color: Colors.white),)
            ],
          ),
        )
      ],
    ),
  );
}

Widget BranchsCard(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 4 / 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Màu và độ mờ của shadow
            spreadRadius: 2, // Độ lan rộng của shadow
            blurRadius: 7, // Độ mờ của shadow
            offset: Offset(-2, 2), // Vị trí của shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                  image: NetworkImage(
                      "https://cf.bstatic.com/xdata/images/hotel/max1024x768/479422010.jpg?k=694eea3ca9cc59ca7456f8bd3eb7289be69049ae69a4c08ea5a2cf237c8e381b&o=&hp=1"))),
          Text("Mai anh tuấn - HN",style: TextStyle(color: color.colorWord,fontWeight: FontWeight.w400,fontSize: 17),),
          Row(
            children: [
              Icon(Icons.add_location_outlined,size: 16,color: Colors.black45),
              Expanded(child: Text("địa chỉaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",maxLines: 1, overflow: TextOverflow.ellipsis,style:TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black45)))
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone_outlined,size: 16,color: Colors.black45,),
              Expanded(child: Text("0123456",maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black45)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("giờ mở cửa: ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w200,fontStyle: FontStyle.italic)),
              Text("đang đóng cửa ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w200,fontStyle: FontStyle.italic))
            ],
          ),
        ],
      ));
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.white),
                children: const <TextSpan>[
                  TextSpan(text: "Xin Chào "),
                  TextSpan(
                      text: "Phan Quốc Tuấn",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
          ),
          const Icon(Icons.card_giftcard)
        ]),
      ),

        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.4,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Image(
                            image: NetworkImage(
                                "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Image(
                            image: NetworkImage(
                                "https://storage-vnportal.vnpt.vn/sla-ubnd/4775/NTM/4_May_2024_021321_GMTthong-bao_553f5.png")),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dịch vụ nổi bật",
                      style: TextStyle(fontWeight: FontWeight.bold,color: color.colorWord),
                    ),
                    Text("Xem tất cả >",style: TextStyle(color: color.colorWord),)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                FeaturedServices(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Các chi nhánh",
                      style: TextStyle(fontWeight: FontWeight.bold,color: color.colorWord),
                    ),
                    Text("(6 chi nhánh)",style: TextStyle(color: color.colorWord),)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 290,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [BranchsCard(context), BranchsCard(context)],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ContacsUs(context)
              ],
            ),
          ),
        ),
      );
  }
}
