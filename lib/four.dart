import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:loveshayri/shayaricat.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';

class demo extends StatefulWidget {
  String shayri_list;
  int ind;

  demo(this.shayri_list, this.ind);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List Emoge = [];
  int cur_ind = 0;
  bool status = false;
  bool backstutas = false;
  bool textstatus = false;
  bool emostatus = false;
  Color clr = Colors.red;
  Color textclr = Colors.black;
  int clr_ind = 0;
  int text_ind = 0;
  int emo_ind = 0;
  int back_ind = 0;
  double x = 20;
  double textsize = 20;
  Color selectedcolor = Colors.pink;

  List font = [
    "font1",
    "font2",
    "font3",
    "font4",
    "font5",
    "font6",
    "font7",
    "font8",
    "font9",
    "font10",
  ];
  String ff = "font1";
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  List<Color> myclr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myclr.addAll(categary.mycolor);
    Emoge.addAll(categary.Emoji);
    getdata();
    // myclr.shuffle();
  }

  getdata() async {
    var status = await Permission.camera.status;

    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      print(statuses[Permission.location]);
    }
  }

  Widget build(BuildContext context) {
    double statusbarheight = MediaQuery
        .of(context)
        .viewPadding
        .top;
    double appbarheight = kToolbarHeight;
    double total = statusbarheight + appbarheight;
    double height = MediaQuery
        .of(context)
        .size
        .height - total;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Shayari theme",
        ),
      ),
      body: Column(
        children: [
          WidgetsToImage(controller: controller,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(5, 20, 5, 5),
              padding: EdgeInsets.all(10),
              //  height: 250,
              //  width: double.infinity,
              //color: Colors.red,
              child: SingleChildScrollView(
                child: Text(
                  "${(emostatus == false ? categary.Emoji[widget.ind] : categary
                      .Emoji[emo_ind])}"
                      "${widget.shayri_list}"
                      "${(emostatus == false
                      ? categary.Emoji[widget.ind]
                      : categary.Emoji[emo_ind])}",
                  style: TextStyle(
                    fontFamily: ff,
                    fontSize: x,
                    color: (textstatus == false) ? textclr : myclr[text_ind],
                  ),
                ),
              ),
              // alignment: Alignment.center,
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (backstutas == false) ? clr : categary.mycolor[back_ind],
                gradient: (status == true)
                    ? LinearGradient(colors: [myclr[clr_ind], myclr[clr_ind + 1]])
                    : null,
              ),
            ),
          ),
          Spacer(),
          Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            // padding: EdgeInsets.all(5),
            // height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 25,
                  width: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                        if(clr_ind<=myclr.length){
                          status=true;
                          clr_ind++;
                          if(clr_ind==myclr.length){
                            clr_ind=0;
                          }
                          setState(() {

                          });
                        }
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.all(5),
                          //alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/18.jpg.png")),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                height: height,
                                color: Colors.white,
                                child: GridView.builder(
                                  itemCount: 10,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        status = true;
                                        clr_ind = index;
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                            "${categary.Emoji[widget
                                                .ind]}\n Love Shayari \n ${categary
                                                .Emoji[widget.ind]}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black)),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              myclr[index],
                                              myclr[index + 1],
                                              myclr[index + 2],
                                            ])),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white, width: 0),
                              image: DecorationImage(
                                  image: AssetImage("images/17.jpg.png")),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100,
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GridView.builder(
                                  itemCount: myclr.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        backstutas = true;
                                        back_ind = index;
                                        setState(() {});
                                        selectedcolor = categary.backcolor[index];
                                      },
                                      child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: 30,
                                          width: 30,
                                          color: myclr[index]),
                                    );
                                  },
                                ),
                              ),
                             InkWell(onTap: () {
                               Navigator.pop(context);
                             },
                               child: Container(
                                 height: 20,width: 20,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.red,
                                 ),
                                 child: Center(
                                   child: Text(
                                     "x",style: TextStyle(color: Colors.white),
                                   ),
                                 ),
                               ),
                             ),
                             //  IconButton(onPressed: () {
                             // Navigator.pop(context);
                             //  }, icon: Icon(Icons.close)),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 20,
                    width: 80,
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Background",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100,
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GridView.builder(
                                  itemCount: myclr.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        textstatus = true;
                                        text_ind = index;
                                        // Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: 30,
                                          width: 30,
                                          color: myclr[index]),
                                    );
                                  },
                                ),
                              ),
                              InkWell(onTap: () {
                                Navigator.pop(context);
                              },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "x",style: TextStyle(color: Colors.white,
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 20,
                    width: 80,
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Text color",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),


                ),
                InkWell(
                  onTap: () async {
               //     Share.share("${widget.shayri_list}");
                    bytes != null ? Image.memory(width: 100,bytes!):Text("No Image");
                    bytes = await controller.capture();

                    var path =
                    await ExternalPath.getExternalStoragePublicDirectory(
                        ExternalPath.DIRECTORY_DOWNLOADS);
                    Directory dir = Directory(path);

                    if (!await dir.exists()) {
                      dir.create();
                    }
                    int r = Random().nextInt(1000);
                    String img_name = "img${r}.jpg";

                    File f = File('$path/$img_name');
                    await f.writeAsBytes(bytes!);
                    print(f.path);
                    Share.shareFiles(['${f.path}'], text: 'Great picture');
                    print(bytes);
                    setState(() {});
                  },
                  child: Container(
                    height: 20,
                    width: 80,
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Share",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 60,
                          color: Colors.white,
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: font.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        ff = font[index];
                                        setState(() {});
                                      },
                                      child: Container(
                                        color: Colors.deepOrange,
                                        width: 100,
                                        height: 50,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        child: Text(
                                          "Shayari",
                                          style: TextStyle(fontFamily: font[index]),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              InkWell(onTap: () {
                                Navigator.pop(context);
                              },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "x",style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 20,
                    width: 80,
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Font",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                          onTap: () {
                                            emostatus = true;
                                            emo_ind = index;
                                            // Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: ListTile(
                                            tileColor: Colors.black,
                                            title: Text("${categary.Emoji[index]}"),
                                          ));
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        height: 2,
                                        color: Colors.white,
                                      );
                                    },
                                    itemCount: categary.Emoji.length),
                              ),
                              InkWell(onTap: () {
                                Navigator.pop(context);
                              },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "x",style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 20,
                    width: 80,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Emoji",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState1) {
                            return Container(
                                height: 100,
                                color: Colors.black,
                                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Slider(
                                        value: x,
                                        min: 10,
                                        max: 60,
                                        onChanged: (value) {
                                          x = value;
                                          textsize = value;
                                          setState1(() {
                                            setState(() {});
                                          });
                                        },
                                      ),
                                    ),
                                    InkWell(onTap: () {
                                      Navigator.pop(context);
                                    },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.red,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "x",style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 20,
                    width: 80,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text(
                      "Text size",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}