import 'globals.dart';

bool sot,
    ho,
    khoTho,
    viemPhoi,
    dauHong,
    metMoi,
    nguoiBenh,
    nguoiCoBieuHien,
    nguoiTuNuocCoBenh;
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
String countries;
bool isMoving = false;
String noidi;
String noiden;
String phuongtien;
DateTime ngaydi;
DateTime ngayden;

void updateGlobalWhenNull() {
  countries = "";
  isMoving = false;
  noiden = "";
  noidi = "";
  ngaydi = DateTime(DateTime.now().year, DateTime.now().month);
  ngayden = DateTime(DateTime.now().year, DateTime.now().month);
  phuongtien = "";

  sot = false;
  ho = false;
  khoTho = false;
  viemPhoi = false;
  dauHong = false;
  metMoi = false;
  nguoiBenh = false;
  nguoiCoBieuHien = false;
  nguoiTuNuocCoBenh = false;
  benhGanManTinh = false;
  benhMauManTinh = false;
  benhPhoiManTinh = false;
  benhThanManTinh = false;
  benhTimMach = false;
  huyetApCao = false;
  suyGiamMienDich = false;
  ghepTangHoacXuong = false;
  tieuDuong = false;
  ungThu = false;
  mangThai = false;

  if (declareGlobal.countriesVisited == null) {
    declareGlobal.countriesVisited = countries;
  }
  if (declareGlobal.isDomesticTravel == null) {
    declareGlobal.isDomesticTravel = isMoving;
  }
  if (declareGlobal.toProvince == null) {
    declareGlobal.toProvince = noiden;
  }
  if (declareGlobal.fromProvince == null) {
    declareGlobal.fromProvince = noidi;
  }
  if (declareGlobal.departureDate == null) {
    declareGlobal.departureDate = ngaydi;
  }
  if (declareGlobal.arrivalDate == null) {
    declareGlobal.arrivalDate = ngayden;
  }
  if (declareGlobal.travelBy == null) {
    declareGlobal.travelBy = phuongtien;
  }
//                          -----------------------------------------------
  if (declareGlobal.sot == null) {
    declareGlobal.sot = sot;
  }
  if (declareGlobal.ho == null) {
    declareGlobal.ho = ho;
  }
  if (declareGlobal.khoTho == null) {
    declareGlobal.khoTho = khoTho;
  }
  if (declareGlobal.viemPhoi == null) {
    declareGlobal.viemPhoi = viemPhoi;
  }
  if (declareGlobal.dauHong == null) {
    declareGlobal.dauHong = dauHong;
  }
  if (declareGlobal.metMoi == null) {
    declareGlobal.metMoi = metMoi;
  }
}
