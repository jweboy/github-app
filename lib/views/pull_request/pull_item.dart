import 'package:flutter/material.dart';

class PullItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final Function onTap;

  const PullItem({
    Key key,
    this.data,
    this.onTap,
  }) : super(key: key);

  // 组件信息小组件
  Widget buildStatisticsBlock() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(data['user']['avatar_url']),
                radius: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: Text(
                  data['user']['login'],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Text(
              data['updated_at'],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
    // return Container(
    //   child: <Widget>[
    //     Flexible(
    //       child: Row(
    //         children: <Widget>[
    //           // new Container(
    //           //   decoration: new BoxDecoration(
    //           //     color: Colors.red[400],
    //           //     borderRadius: new BorderRadius.all(
    //           //       const Radius.circular(4.0)
    //           //     )
    //           //   ),
    //           // ),
    //           new Text(data['user']['avatar_url'])
    //         ],
    //       ),
    //       // margin: new EdgeInsets.only(right: 10.0),
    //     ),
    // new Container(
    //   child: new Row(
    //     children: <Widget>[
    //       new Icon(Icons.star, color: Colors.yellow, size: 16.0),
    //       new Text("${item["stars"]}")
    //     ],
    //   ),
    //   margin: new EdgeInsets.only(right: 10.0),
    // ),
    // new Container(
    //   child: new Row(
    //     children: <Widget>[
    //       new Icon(Icons.call_split, size: 16.0),
    //       new Text("${item["forks"]}")
    //     ],
    //   ),
    //   margin: new EdgeInsets.only(right: 10.0),
    // ),
    // ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    // print('data >>> $data');

    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: ListTile(
            title: Text(
              data['title'],
              style: TextStyle(
                color: Colors.blue[500],
              ),
            ),
            leading: Text('#${data['number']}'),
            subtitle: buildStatisticsBlock(),
            onTap: onTap,
          ),
        ),
        // Container(
        //   padding: new EdgeInsets.fromLTRB(70.0, 5.0, 0, 5.0),
        //   child: new Column(
        //     children: <Widget>[
        //       // createTimeWidget(),
        //       buildStatisticsBlock(),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
