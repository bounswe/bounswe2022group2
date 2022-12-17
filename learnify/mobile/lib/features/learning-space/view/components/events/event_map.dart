part of '../../learning_space_detail_screen.dart';

class _EventMap extends StatefulWidget {
  const _EventMap({required this.location, Key? key}) : super(key: key);
  final GeoLocation location;

  @override
  State<_EventMap> createState() => __EventMapState();
}

class __EventMapState extends State<_EventMap> {
  @override
  Widget build(BuildContext context) => FlutterMap(
        options: MapOptions(
            center: LatLng(35.269259, 33.825730), maxZoom: 19, zoom: 16),
        children: <Widget>[
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.bounswe.learnify',
          ),
        ],
      );
}
