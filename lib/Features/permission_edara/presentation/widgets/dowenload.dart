import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadWidget extends StatefulWidget {
  final String url;
  final String fileName;
  const DownloadWidget({super.key, required this.url, required this.fileName});

  @override
  _DownloadWidgetState createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  double _progress = 0.0;
  bool _isDownloading = false;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          await _handleNotificationClick(response.payload);
        }
      },
    );
  }

  Future<void> _handleNotificationClick(String? payload) async {
    if (payload != null) {
      OpenFile.open(payload);
    }
  }

  Future<void> _showDownloadCompleteNotification(String filePath) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'id',
      'name',
      channelDescription: 'PDF Document',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Download Complete',
      'Your PDF has been downloaded.',
      platformChannelSpecifics,
      payload: filePath,
    );
  }

/*
  void downloadFile(String url, String fileName) async {
    File? file;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();
    if (statuses[Permission.manageExternalStorage]!.isGranted) {
      var dir = await getExternalStorageDirectory();

      try {
        file = await FileDownloader.downloadFile(
            url: url,
            name: fileName,
            subPath: dir!.path,
            onDownloadCompleted: (String name) async {
              // OpenFile.open(name);
              await _showDownloadCompleteNotification(name);
            });
      } finally {
        await Future.delayed(const Duration(seconds: 1));

        await OpenFile.open(file?.path);
      }
    } else {
      debugPrint("No permission to read and write.");
    }
  }
*/

  /* Future<void> _downloadPDF() async {
    setState(() {
      _isDownloading = true;
      _progress = 0.0;
    });
    try {
      for (int i = 0; i <= 100; i++) {
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          _progress = i / 100;
        });
      }
      // final pdf = pw.Document();
      // pdf.addPage(
      //   pw.Page(
      //     build: (pw.Context context) {
      //       return pw.Center(
      //         child: pw.Text('Hello, PDF!'),
      //       );
      //     },
      //   ),
      // );

      // FileDownloader.downloadFile(
      //     url:
      //         "https://hrschool.almgdalgaded2030.com/uploads/talabat_orders/talab.pdf",
      //     onProgress: (name, progress) {
      //       setState(() {
      //         _progress = progress;
      //       });
      //     },
      //     onDownloadCompleted: (value) {
      //       print('path  $value ');
      //       setState(() {
      //         _progress = 0.0;
      //       });
      //     });

      //         downloadFile(
      //           "${NewApi.imageBaseUrl}${lwae7.layhaPath!}",
      //           fileName,
      //         );
      // final output = await getExternalStorageDirectory();
      // final filePath = '${output!.path}/example.pdf';
      // final file = File(filePath);
      // await file.writeAsBytes(await pdf.save());

      downloadFile(widget.url, widget.fileName);

      setState(() {
        _isDownloading = false;
        _progress = 1.0;
      });
      // await _showDownloadCompleteNotification(filePath);
    } catch (e) {
      setState(() {
        _isDownloading = false;
      });
    }
  }*/
  Future<void> _downloadPDF() async {
    setState(() {
      _isDownloading = true;
      _progress = 0.0;
    });

    try {
      final status = await Permission.storage.request();
      if (status.isGranted || Platform.isIOS) {
        final dir = await getApplicationDocumentsDirectory();
        final filePath = '${dir.path}/${widget.fileName}';

        final dio = Dio();
        await dio.download(
          widget.url,
          filePath,
          onReceiveProgress: (received, total) {
            setState(() {
              _progress = (received / total);
            });
          },
        );

        setState(() {
          _isDownloading = false;
          _progress = 1.0;
        });

        await _showDownloadCompleteNotification(filePath);
        await OpenFile.open(filePath);
      } else {
        debugPrint('Permission to access storage denied.');
        setState(() {
          _isDownloading = false;
        });
      }
    } catch (e) {
      debugPrint('Error downloading file: $e');
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 35.0,
      lineWidth: 5.0,
      percent: _progress,
      center: _isDownloading
          ? Text("${(_progress * 100).toStringAsFixed(0)}%")
          : IconButton(
              icon: const Icon(
                Icons.file_download_outlined,
                color: Colors.blue,
              ),
              iconSize: 35.0,
              onPressed: _downloadPDF,
            ),
      progressColor: Colors.blue,
      backgroundColor: Colors.grey[200]!,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
