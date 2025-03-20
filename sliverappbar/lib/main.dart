import 'package:flutter/material.dart';

/// Flutter code sample for [SliverAppBar].

void main() {
  runApp(const StretchableSliverAppBar());
}

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  final GlobalKey _headerKey = GlobalKey();
  double _headerHeight = 200.0; // 默认高度

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateHeaderHeight();
    });
  }

  void _updateHeaderHeight() {
    final RenderBox box =
        _headerKey.currentContext!.findRenderObject() as RenderBox;
    debugPrint('box.size.height: ${box.size.height}');
    setState(() {
      _headerHeight = box.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
              titleSpacing: 2,
              title: Text(
                'SliverAppBar',
              ),
              pinned: true,
              expandedHeight: _headerHeight,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  padding: EdgeInsets.only(top: 50),
                  key: _headerKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterLogo(
                        size: 100,
                      ),
                      Text(
                        '$_headerHeight',
                        style: TextStyle(
                          fontSize: 160,
                        ),
                      ),
                      Text('$_headerHeight'),
                      Text('$_headerHeight'),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              // key: _headerKey,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                      child: Text('$index',
                          textScaler: const TextScaler.linear(5.0))),
                );
              }, childCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}
