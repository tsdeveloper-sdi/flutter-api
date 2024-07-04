import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseController extends GetxController {
  Future<dynamic> queryDB(String query, List<Object?>? val) async {
    final conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '10.200.0.24',
        port: 3306,
        user: 'admininspection',
        db: 'inspection_db',
        password: 'GMTP@ssw0rd',
      ),
    );
    var result;
    if (val != null) {
      result = await conn.query(query, [val]);
    } else {
      result = await conn.query(query, null);
    }
    await conn.close();
    return result;
  }
}
