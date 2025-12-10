import 'package:elkhlod/Features/add_location/domain/entities/sites_entity.dart';

typedef AllSitesList = List<SitesEntity>?;

class Sites extends SitesEntity {
  const Sites({
    super.siteId,
    super.radius,
    super.sLat,
    super.sLong,
    super.siteName,
    super.status,
  });

  factory Sites.fromJson(Map<String, dynamic> json) => Sites(
        siteId: json["site_id"],
        radius: json["radius"],
        sLat: json["s_lat"],
        sLong: json["s_long"],
        siteName: json["site_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "site_id": siteId,
        "radius": radius,
        "s_lat": sLat,
        "s_long": sLong,
        "site_name": siteName,
        "status": status,
      };
}
