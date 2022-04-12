import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoInfo = [];
  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async{
    //Load the info.json file and put the JSON list into a variable
    await DefaultAssetBundle.of(context).loadString('json/video_info.json').then((value) => {
      videoInfo = jsonDecode(value)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.gradientFirst.withOpacity(0.9),
          AppColor.gradientSecond
        ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColor.secondPageTopIconColor,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColor.secondPageTopIconColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Legs Toning',
                    style: TextStyle(
                        fontSize: 25, color: AppColor.secondPageTitleColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'and Glutes Workout',
                    style: TextStyle(
                        fontSize: 25, color: AppColor.secondPageTitleColor),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                AppColor.secondPageContainerGradient1stColor,
                                AppColor.secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: AppColor.secondPageIconColor,
                            ),
                            Text(
                              '68 min',
                              style: TextStyle(
                                  color: AppColor.secondPageTitleColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 250,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                AppColor.secondPageContainerGradient1stColor,
                                AppColor.secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              color: AppColor.secondPageIconColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Resistance Band, Kettle Bell',
                              style: TextStyle(
                                  color: AppColor.secondPageTitleColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.circuitsColor),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(Icons.loop,size: 30,color: AppColor.loopColor,),
                            const SizedBox(width: 10,),
                            Text('3 Sets', style: TextStyle(
                              fontSize: 15,
                              color: AppColor.setsColor
                            ),)
                          ],
                        ),
                        const SizedBox(width: 20,),
                      ],
                    ),
                    Expanded(child: ListView.builder(
                        itemCount: videoInfo.length,
                        itemBuilder: (_,index){
                      return GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          height: 135,
                          width: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(videoInfo[index]['thumbnail'])
                                      )
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(videoInfo[index]["title"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      const SizedBox(height: 10,),
                                      Padding(padding: const EdgeInsets.only(top: 3),
                                      child: Text(videoInfo[index]["time"],
                                      style: TextStyle(
                                        color: Colors.grey[500]
                                      ),),),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                      );
                    })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
