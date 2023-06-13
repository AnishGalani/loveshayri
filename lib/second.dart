import 'package:flutter/material.dart';
import 'package:loveshayri/shayaricat.dart';
import 'package:loveshayri/third.dart';

class shayari extends StatefulWidget {
  int index;
   shayari(this.index);

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {
  List sh =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index == 0)
    {
      sh.addAll(categary.shubh);
    }

    else if(widget.index==1)
    {
      sh.addAll(categary.dosti);
    }
    else if(widget.index==2)
    {
      sh.addAll(categary.majedar);
    }
    else if(widget.index==3)
    {
      sh.addAll(categary.bhagvan);
    }
    else if(widget.index==4)
    {
      sh.addAll(categary.prerna);
    }
    else if(widget.index==5)
    {
      sh.addAll(categary.jivan);
    }
    else if(widget.index==6)
    {
      sh.addAll(categary.mohabat);
    }
    else if(widget.index==7)
    {
      sh.addAll(categary.yade);
    }
    else if(widget.index==8)
    {
      sh.addAll(categary.anny);
    }
    else if(widget.index==9)
    {
      sh.addAll(categary.rajniti);
    }
    else if(widget.index==10)
    {
      sh.addAll(categary.prem);
    }
    else if(widget.index==11)
    {
      sh.addAll(categary.dard);
    }
    else if(widget.index==12)
    {
      sh.addAll(categary.sharab);
    }
    else if(widget.index==13)
    {
      sh.addAll(categary.bevfa);
    }
    else if(widget.index==14)
    {
      sh.addAll(categary.janamdin);
    }
    else if(widget.index==15)
    {
      sh.addAll(categary.holi);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(margin: EdgeInsets.only(right: 12),
            child: Icon(Icons.share_sharp),
          ),
          Container(child: Icon(Icons.more_vert),)
        ],
        title: Text("${categary.shayari[widget.index]}"),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(itemBuilder: (context, index) {
        return InkWell(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return love(sh,index);
          },));
        },
          child: ListTile(tileColor: Colors.pink,
          leading: Image(image: AssetImage("images/${categary.im[widget.index]}"),),
            title: Text("${sh[index]}",maxLines: 2,),
          ),
        );
      }, separatorBuilder: (context, index) {
        return Divider(color: Colors.black,height: 10,);
      }, itemCount: sh.length),
    );
  }
}
