import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:upnp_client/src/device.dart';
import 'package:upnp_client/upnp_client.dart';

class CastMediaScreen extends StatefulWidget {
  const CastMediaScreen({super.key});

  @override
  State<CastMediaScreen> createState() => _CastMediaScreenState();
}

class _CastMediaScreenState extends State<CastMediaScreen> {
  Future<List<Device>> searchDevices() async {
    await requestPermissions(); // Ensure you handle permissions before starting the device search
    var deviceDiscover = DeviceDiscoverer();

    await deviceDiscover.start(addressTypes: [InternetAddressType.IPv4]);

    // Wait for devices to be discovered
    var devices = await deviceDiscover.getDevices();

    deviceDiscover.stop();

    print("Devices Found: ${devices.length}");

    // Ensure returning an empty list if no devices were found
    return devices.isNotEmpty ? devices : [];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cast Screen"), centerTitle: true),
      body: FutureBuilder<List<Device>>(
        future: searchDevices(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.isEmpty) {
            return Column(
              children: [Center(child: Text('No Chromecast founded'))],
            );
          }

          return Column(
            children:
                snapshot.data!.map((deviceItem) {
                  return ListTile(
                    title: Text(
                      deviceItem.description?.friendlyName ?? "Unknown device",
                    ),
                    onTap: () {},
                  );
                }).toList(),
          );
        },
      ),
    );
  }

  // Requesting necessary permissions
  Future<void> requestPermissions() async {
    // Check and request permissions
    await [
      /* Permission.accessMediaLocation,
      Permission.locationWhenInUse,
      Permission.accessNotificationPolicy,*/
      Permission.nearbyWifiDevices,
      Permission.location,
    ].request();
  }
}
