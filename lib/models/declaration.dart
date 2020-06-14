import 'package:adnproject/constants/enums.dart';
import 'package:intl/intl.dart';

DateFormat format = DateFormat("yyyy-MM-dd");

class Declaration {
  DateTime createdAt;
  String countriesVisited;
  bool isDomesticTravel;
  String fromProvince;
  String toProvince;
  DateTime departureDate;
  DateTime arrivalDate;
  String travelBy;
  bool sot;
  bool ho;
  bool khoTho;
  bool viemPhoi;
  bool dauHong;
  bool metMoi;
  bool nguoiBenh;
  bool nguoiTuNuocCoBenh;
  bool nguoiCoBieuHien;
  bool benhGanManTinh;
  bool benhMauManTinh;
  bool benhPhoiManTinh;
  bool benhThanManTinh;
  bool benhTimMach;
  bool huyetApCao;
  bool suyGiamMienDich;
  bool ghepTangHoacXuong;
  bool tieuDuong;
  bool ungThu;
  bool mangThai;
  Declaration({
    this.createdAt,
    this.countriesVisited,
    this.isDomesticTravel,
    this.fromProvince,
    this.toProvince,
    this.departureDate,
    this.arrivalDate,
    this.travelBy,
    this.sot,
    this.ho,
    this.khoTho,
    this.viemPhoi,
    this.dauHong,
    this.metMoi,
    this.nguoiBenh,
    this.nguoiTuNuocCoBenh,
    this.nguoiCoBieuHien,
    this.benhGanManTinh,
    this.benhMauManTinh,
    this.benhPhoiManTinh,
    this.benhThanManTinh,
    this.benhTimMach,
    this.huyetApCao,
    this.suyGiamMienDich,
    this.ghepTangHoacXuong,
    this.tieuDuong,
    this.ungThu,
    this.mangThai,
  });
  factory Declaration.fromJson(Map<String, dynamic> json) {
    return Declaration(
      createdAt: json['createdAt'],
      countriesVisited: json['countriesVisited'],
      isDomesticTravel: json['isDomesticTravel'],
      fromProvince: json['fromProvince'],
      toProvince: json['toProvince'],
      departureDate: format.parse(json['departureDate']),
      arrivalDate: format.parse(json['arrivalDate']),
      travelBy: json['travelBy'],
      sot: json['sot'],
      ho: json['ho'],
      khoTho: json['khoTho'],
      viemPhoi: json['viemPhoi'],
      dauHong: json['dauHong'],
      metMoi: json['metMoi'],
      nguoiBenh: json['nguoiBenh'],
      nguoiTuNuocCoBenh: json['nguoiTuNuocCoBenh'],
      nguoiCoBieuHien: json['nguoiCoBieuHien'],
      benhGanManTinh: json['benhGanManTinh'],
      benhMauManTinh: json['benhMauManTinh'],
      benhPhoiManTinh: json['benhPhoiManTinh'],
      benhThanManTinh: json['benhThanManTinh'],
      benhTimMach: json['benhTimMach'],
      huyetApCao: json['huyetApCao'],
      suyGiamMienDich: json['suyGiamMienDich'],
      ghepTangHoacXuong: json['ghepTangHoacXuong'],
      tieuDuong: json['tieuDuong'],
      ungThu: json['ungThu'],
      mangThai: json['mangThai'],
    );
  }
  Map<String, dynamic> toJson() => {
        // 'createdAt': createdAt.toString(),
        'countriesVisited': countriesVisited,
        'isDomesticTravel': isDomesticTravel,
        'fromProvince': fromProvince,
        'toProvince': toProvince,
        'departureDate': departureDate.toIso8601String(),
        'arrivalDate': arrivalDate.toIso8601String(),
        'travelBy': travelBy,
        'sot': sot,
        'ho': ho,
        'khoTho': khoTho,
        'viemPhoi': viemPhoi,
        'dauHong': dauHong,
        'metMoi': metMoi,
        'nguoiBenh': nguoiBenh,
        'nguoiTuNuocCoBenh': nguoiTuNuocCoBenh,
        'nguoiCoBieuHien': nguoiCoBieuHien,
        'benhGanManTinh': benhGanManTinh,
        'benhMauManTinh': benhMauManTinh,
        'benhPhoiManTinh': benhPhoiManTinh,
        'benhThanManTinh': benhThanManTinh,
        'benhTimMach': benhTimMach,
        'huyetApCao': huyetApCao,
        'suyGiamMienDich': suyGiamMienDich,
        'ghepTangHoacXuong': ghepTangHoacXuong,
        'tieuDuong': tieuDuong,
        'ungThu': ungThu,
        'mangThai': mangThai,
      };
}
