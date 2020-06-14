import 'dart:io';

import 'package:adnproject/constants/enums.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:diacritic/diacritic.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:string_similarity/string_similarity.dart';

/// Deadline is coming, so there will be no explain in this comment section
Future<PersonInfo> analyzeImage(File frontImage, File backImage) async {
  TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

  FirebaseVisionImage frontVisionImage =
      FirebaseVisionImage.fromFile(frontImage);
  VisionText frontVisionText =
      await textRecognizer.processImage(frontVisionImage);
  FirebaseVisionImage backVisionImage = FirebaseVisionImage.fromFile(backImage);
  VisionText backVisionText =
      await textRecognizer.processImage(backVisionImage);

  var person = new PersonInfo(
    name: _extractField(frontVisionText, 'ho ten')?.toUpperCase() ?? '',
    cmnd: _extractCmnd(frontVisionText) ?? '',
    birthDay: _extractDate(frontVisionText),
    permanentAddress:
        _extractBlock(frontVisionText, 'noi dkhk thuong tru') ?? '',
    cardDate: _extractCardDate(backVisionText),
    cardPlace: _extractCardPlace(backVisionText),
    cardType: CardType.cmnd,
  );

  textRecognizer.close();
  return person;
}

String _extractCardPlace(VisionText visionText) {
  var ignorePattern = new RegExp('[.:]');
  List<String> lineTexts = visionText.blocks
      .map((block) => block.lines)
      .reduce((value, element) => value + element)
      .map((line) {
    return removeDiacritics(line.text.toLowerCase())
        .replaceAll(ignorePattern, '');
  }).toList();
  var matched =
      StringSimilarity.findBestMatch('giamdocca', lineTexts).bestMatch.target;
  var matchedIndex = lineTexts.indexOf(matched);

  if (matched.length > 10) {
    return matched.substring('giam doc ca'.length);
  }

  var place = lineTexts.sublist(matchedIndex, matchedIndex + 2).join('');
  return place;
}

DateTime _extractCardDate(VisionText visionText) {
  var datePattern = new RegExp('[0-9]{2}');
  var simplified = removeDiacritics(
    visionText.text.toLowerCase().replaceAll('\n', ' '),
  );
  var numbers =
      datePattern.allMatches(simplified).map((e) => e.group(0)).toList();
  return new DateTime(
    int.parse(numbers[2] + numbers[3]),
    int.parse(numbers[1]),
    int.parse(numbers[0]),
  );
}

DateTime _extractDate(VisionText visionText) {
  var datePattern = new RegExp('[0-9]{2}-[0-9]{2}-[0-9]{4}');
  var cmnd = visionText.blocks
      .map((block) =>
          block.lines.map((line) => line.text.toLowerCase()).join(' '))
      .where((text) => text.contains(datePattern))
      .join(' ');
  var date =
      datePattern.allMatches(cmnd).map((e) => e.group(0)).join('').split('-');
  if (date.length >= 3) {
    return new DateTime(
      int.parse(date[2]),
      int.parse(date[1]),
      int.parse(date[0]),
    );
  }
  return DateTime.now();
}

String _extractCmnd(VisionText visionText) {
  var cmndPattern = new RegExp('[0-9]{9,12}');
  var cmnd = visionText.blocks
      .map((block) =>
          block.lines.map((line) => line.text.toLowerCase()).join(' '))
      .where((text) => text.contains(cmndPattern))
      .join(' ');
  return cmndPattern.allMatches(cmnd).map((e) => e.group(0)).join('');
}

String _extractField(VisionText visionText, String fieldTitle) {
  var ignorePattern = new RegExp('[.:]');
  List<TextLine> lines = visionText.blocks
      .map((block) => block.lines)
      .reduce((value, element) => value + element);
  var lineTexts = lines
      .map((line) =>
      removeDiacritics(line.text.toLowerCase())
          .replaceAll(ignorePattern, ''))
      .toList();
  var lineCenters = lines.map((line) {
    return line.cornerPoints.reduce((value, element) => value + element) /
        line.cornerPoints.length.toDouble();
  }).toList();

  // best match filed title
  var match = StringSimilarity.findBestMatch(fieldTitle, lineTexts);
  if (match.bestMatch.rating < 0.1) {
    return '';
  }
  var fieldTitleIndex = match.bestMatchIndex;
  var fieldTitleLine = lineTexts.elementAt(fieldTitleIndex);
  var fieldTitleLineXY = lineCenters.elementAt(fieldTitleIndex);
  var lineTopOffset =
  lines.map((line) => line.boundingBox.top).elementAt(fieldTitleIndex);
  if (fieldTitleLine.length <= fieldTitle.length + 2) {
    lineTexts.removeAt(fieldTitleIndex);
    lineCenters.removeAt(fieldTitleIndex);

    var nearestY = lineCenters
        .where((line) => line.dy > lineTopOffset)
        .map((line) => (line.dy - fieldTitleLineXY.dy).abs())
        .reduce((value, element) => value <= element ? value : element);
    var nearestIndex = lineCenters.indexWhere(
            (element) => (element.dy - fieldTitleLineXY.dy).abs() == nearestY);
    var fieldValue = lineTexts.elementAt(nearestIndex);
    return fieldValue;
  } else {
    var subs = fieldTitleLine.substring(fieldTitle.length);
    if (subs.length > 2) {
      return subs;
    } else {
      return '';
    }
  }
}

String _extractBlock(VisionText visionText, String blockTitle) {
  var ignorePattern = new RegExp('[.:]');
  List<TextBlock> lines = visionText.blocks;
  var blockTexts = lines.map((block) {
    return removeDiacritics(
        block.text.replaceAll(ignorePattern, '').toLowerCase());
  }).toList();
  var blockCenters = lines.map((block) {
    return block.cornerPoints.reduce((value, element) => value + element) /
        block.cornerPoints.length.toDouble();
  }).toList();

  // best match field title
  var match = StringSimilarity.findBestMatch(blockTitle, blockTexts);
  if (match.bestMatch.rating < 0.1) {
    return '';
  }
  var fieldTitleIndex = match.bestMatchIndex;
  var fieldTitleLine = blockTexts.elementAt(fieldTitleIndex);
  var fieldTitleLineXY = blockCenters.elementAt(fieldTitleIndex);
  if (fieldTitleLine.length <= blockTitle.length + 2) {
    blockTexts.removeAt(fieldTitleIndex);
    blockCenters.removeAt(fieldTitleIndex);

    var nearestY = blockCenters
        .map((line) => (line.dy - fieldTitleLineXY.dy).abs())
        .reduce((value, element) => value <= element ? value : element);
    var nearestIndex = blockCenters.indexWhere(
        (element) => (element.dy - fieldTitleLineXY.dy).abs() == nearestY);
    var fieldValue = blockTexts.elementAt(nearestIndex);
    return fieldValue;
  } else {
    var subs = fieldTitleLine.substring(blockTitle.length);
    if (subs.length > 2) {
      return subs;
    } else {
      return '';
    }
  }
}
