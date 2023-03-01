import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_apis/core/constants/my_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseContentScreen extends StatefulWidget {
  const CourseContentScreen({Key? key}) : super(key: key);

  @override
  State<CourseContentScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CourseContentScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: '9FEG15NTcwo',// https://www.youtube.com/watch?v=Tb9k9_Bo-G4
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: false,
        useHybridComposition: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
onWillPop: () async {
  print('onWillPop\n\n\n');
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: YoutubePlayerBuilder(



        player: YoutubePlayer(
           width: MediaQuery.of(context).size.width,
          controller: _controller!,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        onEnterFullScreen: () async {
          print('onEnterFullScreen\n\n\n');
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        },
        onExitFullScreen: () async {
          print('onExitFullScreen\n\n\n');
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,

          ]);
        },
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.mainColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              title: Text(
                'course name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                //text 'intro to the course'
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 5),
                  child: Text(
                    'intro to the course',
                    style: TextStyle(
                      color: Color(0xFF1B1B1B),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                player,
                // text "course content"
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 5),
                  child: Text(
                    'course content',
                    style: TextStyle(
                      color: Color(0xFF1B1B1B),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xC59EB5C9),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    // text "intro to math"
                                    Text(
                                      '01- intro to math',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xC59EB5C9),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    // text "intro to math"
                                    Text(
                                      '01- intro to math',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xC59EB5C9),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    // text "intro to math"
                                    Text(
                                      '01- intro to math',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xC59EB5C9),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    // text "intro to math"
                                    Text(
                                      '01- intro to math',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xC59EB5C9),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    // text "intro to math"
                                    Text(
                                      '01- intro to math',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xC59EB5C9),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    // text "intro to math"
                                    Text(
                                      '01- intro to math',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              border: Border.all(
                                color: Color(0xC59EB5C9),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                    // text "intro to math"
                                    Text(
                                      '01- intro to math',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
