
import 'package:equatable/equatable.dart';

class SitesEntity extends Equatable {
  final String? siteId;
  final String? siteName;
  final String? sLat;
  final String? sLong;
  final String? radius;
  final String? status;

  const SitesEntity({this.siteId, this.siteName, this.sLat, this.sLong, this.radius, this.status});

  @override
  List<Object?> get props => [siteId, siteName, sLat, sLong, radius, status];
}

