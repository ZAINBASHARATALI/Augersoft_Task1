import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [MySimpleDialog(), MyAlertDialog(), MyBottomSheet()],
    );
  }
}

class MySimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(backgroundColor: Colors.green, children: [
                Text(
                  'Simple Dialog Here\n Tap Anywhere to close me',
                  textAlign: TextAlign.center,
                )
              ]);
            });
      },
      child: Text('Simple Dialog'),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Close');
                      },
                      child: Text('Close'))
                ],
                title: Text(
                  'Alert Dialog Here',
                  textAlign: TextAlign.center,
                ),
              );
            });
      },
      child: Text('Alert Dialog'),
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  bool check = false;

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(onClosing: () {
                setState(() {});
              }, builder: (context) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: ElevatedButton(onPressed: (){Navigator.pop(context);}, child: null,)
                );
              });
            });
      },
      child: Text('Bottom Sheet'),
    );
  }
}
