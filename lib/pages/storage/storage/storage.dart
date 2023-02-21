import 'package:get_storage/get_storage.dart';

// storage
class Storage {
  final _name = ''.val('nameKey');
  final _nameDois = ''.val(
    'nameKey',
    getBox: () => GetStorage('StorageDois'),
  );

  String get name => _name.val;
  set name(String value) {
    _name.val = value;
  }

  String get nameDois => _nameDois.val;
  set nameDois(String value) {
    _nameDois.val = value;
  }
}
