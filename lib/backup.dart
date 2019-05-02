  // FIXME: Dialog
  // Future<void> _showDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Rewind and remember'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('You will never be satisfied.'),
  //               Text('You\’re like me. I’m never satisfied.'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('confirm'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

   // FIXME: Drawer
  // Drawer _showNavDrawer(BuildContext context) {
  //   var headerChild = new DrawerHeader(
  //     child: new Text('Header'),
  //   );

  //   ListTile genNavItem(String text, var icon , String routeName) {
  //     return new ListTile(
  //       title: new Text(text),
  //       leading: new Icon(icon),
  //       onTap: () {
  //         setState(() {
  //           // Navigator.pop(context);
  //                     Navigator.of(context).pop();
  //                     Navigator.of(context).pushNamed(routeName);
  //                   });
  //       },
  //     );
  //   }

  //   var navChildren = [
  //     headerChild,
  //     genNavItem('设置', Icons.settings ,'/settings'),
  //   ];

  //   ListView listview = new ListView(
  //     children: navChildren,
  //   );

  //   return new Drawer(
  //     child: listview,
  //   );
  // }

  // FIXME: AppBar
  // appBar: new AppBar(
    // title: const Text('github'),
    // actions: <Widget>[
    //   new PopupMenuButton<Choice>(
    //     itemBuilder: (BuildContext context) {
    //       return choices.map((Choice choice) {
    //         return new PopupMenuItem<Choice>(
    //           value: choice,
    //           child: new Text(choice.title),
    //         );
    //       }).toList();
    //     },
    //   )
    // ],
  // ),
  // drawer: _showNavDrawer(context),
  // body: new TodoList(),
  // bottomNavigationBar: BottomAppBar(
  //   child: Container(
  //     height: 50.0,
  //     color: const Color(0xFF00FF00),
  //     child: new TextField(),
  //   ),
  // ),