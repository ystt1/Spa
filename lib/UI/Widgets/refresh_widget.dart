import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/HomeScreenBLoC/home_screen_bloc.dart';
import '../../blocs/HomeScreenBLoC/home_screen_event.dart';

class RefreshWidget extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;

  const RefreshWidget(
      {super.key, required this.child, required this.onRefresh});

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
        CupertinoSliverRefreshControl(
        onRefresh:()
    async {

      context.read<HomeBloc>().add(HomeEventLoad());
      return Future.value();
    },
    builder:
        (BuildContext context,
        RefreshIndicatorMode refreshState,
        double pulledExtent,
        double refreshTriggerPullDistance,
        double refreshIndicatorExtent) {
      Widget child;
      switch (refreshState) {
        case RefreshIndicatorMode.inactive:
          child =
              Icon(CupertinoIcons.down_arrow); // Icon khi không có tương tác
          break;
        case RefreshIndicatorMode.drag:
          child = Icon(CupertinoIcons.down_arrow); // Icon khi đang kéo
          break;
        case RefreshIndicatorMode.armed:
          child = Icon(
              CupertinoIcons.down_arrow); // Icon khi đã chuẩn bị kích hoạt
          break;
        case RefreshIndicatorMode.refresh:
          child = CupertinoActivityIndicator(); // Icon khi đang làm mới
          break;
        case RefreshIndicatorMode.done:
          child = Icon(Icons.check); // Icon khi hoàn thành làm mới
          break;
      }
      return Container(
        height: refreshIndicatorExtent,
        alignment: Alignment.center,
        child: child,
      );
    }
    ,
    ),
    SliverToBoxAdapter(child: widget.child),
    ]
    ,
    );
  }
}
