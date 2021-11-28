import 'package:flutter/material.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
class NuggetTile extends StatefulWidget {
  final String? title;
  final String? image;
  final String? subtitle;
  final String? tag;
  const NuggetTile({Key? key, this.title, this.image, this.subtitle, this.tag}) : super(key: key);

  @override
  _NuggetTileState createState() => _NuggetTileState();
}

class _NuggetTileState extends State<NuggetTile> {
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width, height: 94,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.17), color: AppTheme.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(height: 62, width: 59, decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
            child: Image.asset(widget.image ?? "assets/communication_option.png"),),
          Column(children: [Padding(padding: const EdgeInsets.only(top: 20.0),
            child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),child: Text(widget.title!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "DMSans"),)),
          ), SizedBox(height: 10,), Text(widget.subtitle!, style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.w400),),],),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, right: 20),
            child: Text(widget.tag!, style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans"),),
          ),
        ],
      ),
    );
  }
}
