import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/src/utils/app_consts.dart';

class UserInfoDatabaseHelper {
  Database? _database;

  static final UserInfoDatabaseHelper instance = UserInfoDatabaseHelper._init();
  UserInfoDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('userInfo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        ''' create table ${AppConsts.tableNameForUser}(${AppConsts.username} text,${AppConsts.imageUrl} text,${AppConsts.passwordUser} text,${AppConsts.isPasswordActive} boolean,) ''');
  }
}