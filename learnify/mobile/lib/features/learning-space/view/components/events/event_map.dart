part of '../../learning_space_detail_screen.dart';

class EventMap extends StatelessWidget {
  const EventMap({required this.location, Key? key}) : super(key: key);
  final GeoLocation location;

  @override
  Widget build(BuildContext context) {
    final double markerSize = context.width * 12;
    final LatLng markerPoint = LatLng(location.latitude, location.longitude);
    return FlutterMap(
      options: MapOptions(center: markerPoint, maxZoom: 19),
      children: <Widget>[
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.bounswe.learnify',
        ),
        MarkerLayer(
          markers: <Marker>[
            Marker(
              width: markerSize,
              height: markerSize,
              point: markerPoint,
              builder: (_) => Image.asset(IconKeys.locationMarker),
            ),
          ],
        ),
      ],
    );
  }
}
