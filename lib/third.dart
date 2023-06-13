// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:loveshayri/four.dart';
import 'package:clipboard/clipboard.dart';
import 'package:loveshayri/shayaricat.dart';
import 'package:share_plus/share_plus.dart';

class love extends StatefulWidget {
  List shayari_list = [];
  int cindex;

  love(this.shayari_list, this.cindex);

  @override
  State<love> createState() => _loveState();
}

class _loveState extends State<love> {
  int cur_ind = 0;
  bool status = false;
  Color clr = Colors.pink;
  int clr_ind = 0;

  PageController? controller;
  List myclr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cur_ind = widget.cindex;
    controller = PageController(initialPage: widget.cindex);
    myclr.addAll(categary.mycolor);
    // print(myclr);
    myclr.shuffle();
  }

  Widget build(BuildContext context) {
    double statusbarheight = MediaQuery.of(context).viewPadding.top;
    double appbarheight = kTextTabBarHeight;
    double total = statusbarheight + appbarheight;
    double height = MediaQuery.of(context).size.height - total;
    //print(height);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Icon(Icons.share_sharp),
          ),
          Container(
            child: Icon(Icons.more_vert),
          )
        ],
        title: Text("Love Shayari"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                          itemCount: 8,
                          //      categary.mycolor.length-1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                status = true;
                                cur_ind = index;
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "${categary.Emoji[cur_ind]}\nThe real basis of life is love\n"
                                  "${categary.Emoji[cur_ind + 1]}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    myclr[index],
                                    myclr[index + 1],
                                    myclr[index + 2],
                                  ]),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    image:
                        DecorationImage(image: AssetImage("images/17.jpg.png")),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                child: Text("${cur_ind + 1}/${widget.shayari_list.length}"),
                height: 30,
                width: 70,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
              ),
              InkWell(
                onTap: () {
                  if (clr_ind <= myclr.length) {
                    status = true;
                    clr_ind++;
                    if (clr_ind == myclr.length) {
                      clr_ind = 0;
                    }
                    setState(() {});
                  }
                },
                child: Container(
                  height: 30,
                  width: 70,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0),
                    image:
                        DecorationImage(image: AssetImage("images/18.jpg.png")),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: (status == false) ? clr : null,
              gradient: (status == true)
                  ? LinearGradient(colors: [myclr[clr_ind], myclr[clr_ind + 1]])
                  : null,
            ),
            //  color: Colors.pink,
            margin: EdgeInsets.all(5),
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  cur_ind = value;
                });
              },
              itemCount: widget.shayari_list.length,
              itemBuilder: (context, index) {
                return Container(
                  //margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${categary.Emoji[index]} ${widget.shayari_list[cur_ind]} ${categary.Emoji[index]}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(5),
              color: Colors.green,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      FlutterClipboard.copy("${widget.shayari_list[cur_ind]}")
                          .then((value) => print('copied'));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("images/19.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (cur_ind > 0) {
                        cur_ind--;
                        //   controller?.jumpToPage(cur_ind);
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("images/20.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return demo(
                              widget.shayari_list[cur_ind], widget.cindex);
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("images/21.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (cur_ind <= widget.shayari_list.length - 2) {
                        cur_ind++;
                        // controller?.jumpToPage(cur_ind);
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("images/22.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Share.share("${widget.shayari_list[cur_ind]}");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("images/23.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
