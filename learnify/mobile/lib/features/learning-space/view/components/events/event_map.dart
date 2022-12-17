part of '../../learning_space_detail_screen.dart';

class _EventMap extends StatefulWidget {
  const _EventMap({required this.location, Key? key}) : super(key: key);
  final GeoLocation location;

  @override
  State<_EventMap> createState() => __EventMapState();
}

class __EventMapState extends State<_EventMap> {
  @override
  Widget build(BuildContext context) {
    final LatLng centerPoint =
        LatLng(widget.location.latitude, widget.location.longitude);
    final LatLng markerPoint =
        LatLng(widget.location.latitude, widget.location.longitude);
    return FlutterMap(
      options: MapOptions(center: centerPoint, maxZoom: 19),
      children: <Widget>[
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.bounswe.learnify',
        ),
        MarkerLayer(
          markers: <Marker>[
            Marker(
              width: context.width * 12,
              height: context.width * 12,
              point: markerPoint,
              builder: (_) => Image.asset(IconKeys.logo),
            ),
          ],
        ),
      ],
    );
  }
}
