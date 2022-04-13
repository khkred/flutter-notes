import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  int _isPlayingIndex = -1;
  bool _disposed = false;


  VideoPlayerController? _controller;


  @override
  void initState() {
    super.initState();
    _initData();
  }

  // We need to dispose the previous videos from memory
  @override
  void dispose() {
    _disposed = true;
    _controller!.pause();
    _controller!.dispose();
    _controller = null;
    super.dispose();
  }

  void _initData() async {
    //Load the info.json file and put the JSON list into a variable
    await DefaultAssetBundle.of(context)
        .loadString('json/video_info.json')
        .then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                    AppColor.gradientFirst.withOpacity(0.9),
                    AppColor.gradientSecond
                  ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight))
            : BoxDecoration(
                color: AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
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
                              fontSize: 25,
                              color: AppColor.secondPageTitleColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'and Glutes Workout',
                          style: TextStyle(
                              fontSize: 25,
                              color: AppColor.secondPageTitleColor),
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
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor.secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      AppColor
                                          .secondPageContainerGradient1stColor,
                                      AppColor
                                          .secondPageContainerGradient2ndColor
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
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: const EdgeInsets.only(
                              top: 50, left: 30, right: 30),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      debugPrint('Tapped');
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: AppColor.secondPageTopIconColor,
                                  )),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: AppColor.secondPageTopIconColor,
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
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
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
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
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: AppColor.loopColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '3 Sets',
                              style: TextStyle(
                                  fontSize: 15, color: AppColor.setsColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _listView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemCount: videoInfo.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            _initializeVideo(index);
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;


  var _progress=0.0;
  _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    if (_onUpdateControllerTime > now) {
      return;
    } else {
      _onUpdateControllerTime += 500;
    }

    final controller = _controller;

    if (controller == null) {
      debugPrint('controller is null');
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint('Controller cannot be initialized');
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  //This will initialise the video when the card item is clicked in the listview
  _initializeVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);

    //Saving the old controller as they will be disposed
    final old = _controller;
    _controller = controller;

    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    // An Empty set state,
    setState(() {});
    controller
      ..initialize().then((value) {
        old?.dispose();
        _isPlayingIndex = index;
        _controller!.addListener(_onControllerUpdate);
        controller.play();
        //Empty set state forces redraw
        setState(() {});
      });
  }

  //For the Video
  _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(controller));
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            'Preparing',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          )));
    }
  }

  // For the play , pause and fast forward options
  Widget _controlView(BuildContext context) {

    final noMute = (_controller!.value.volume.toInt()??0)>0;

    final duration = _duration?.inSeconds ?? 0; //if isSeconds is null then return 0
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0); // 22 ~/7 = 3
    final secs = convertTwo(remained % 60); //22%7 = 1


    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      color: AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              if(noMute) {
                _controller!.setVolume(0);
              }
              else
                {
                  _controller!.setVolume(1.0);
                }
              setState(() {
                
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset:  Offset(0, 0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0),
                    ),

                  ],
                ),
                child: noMute? const Icon(Icons.volume_up,color: Colors.white,): const Icon(Icons.volume_mute,color: Colors.white,),
              ),
            ),
          ),
          TextButton(
              onPressed: () async {
                final index = _isPlayingIndex - 1;
                if (index >= 0) {
                  _initializeVideo(index);
                }
                else
                  {
                    Get.snackbar('Video', "",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(Icons.face,
                          size: 30,
                          color: Colors.white,),
                        backgroundColor: AppColor.gradientSecond,
                        colorText: Colors.white,
                        messageText: const Text("No More Videos",style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),)
                    );
                  }
              },
              child: const Icon(
                Icons.fast_rewind,
                size: 36,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () async {
                if (_isPlaying) {
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller!.pause();
                } else {
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller!.play();
                }
              },
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 36,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () async {
                final index = _isPlayingIndex + 1;

                if(index<=videoInfo.length-1) {
                  _initializeVideo(index);
                }
                else
                  {
                    Get.snackbar('Video', "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: const Icon(Icons.face,
                    size: 30,
                    color: Colors.white,),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text("You have finished all videos, Congrats!!",style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),)
                    );

                  }

              },
              child: const Icon(
                Icons.fast_forward,
                size: 36,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  _buildCard(int index) {
    return Container(
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
                    image: AssetImage(videoInfo[index]['thumbnail']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i <= 90; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: const Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  convertTwo(int value) {
    return value <10? '0$value' : '$value';
  }
}
