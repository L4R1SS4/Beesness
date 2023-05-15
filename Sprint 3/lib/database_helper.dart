import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "BeesnessDatabase.db";
  static const _databaseVersion = 1;

  // Seguindo o modelo conceitual ainda falta tratar: como key para o QRCode será gerada;
  static const _tableUsuario = 'usuario';
  static const _columnIdUsuario = 'id_usuario';
  static const columnKeyQRCode = 'key_qrcode';
  static const columnEmailUsuario = 'email';
  static const columnSenhaUsuario = 'senha';
  static const columnNomeUsuario = 'nome_completo';
  static const columnEmpresaUsuario = 'empresa';
  static const columnCargoUsuario = 'cargo';
  static const columnLinkUsuario = 'link';
  static const columnBiografiaUsuario = 'biografia';
  static const columnTelefoneUsuario = 'telefone';
  static const columnLinkedinUsuario = 'linkedin';
  static const columnFacebookUsuario = 'facebook';
  static const columnInstagramUsuario = 'instagram';

  // Tratar chave estrangeira
  static const _tableContato = 'contato';
  static const _columnIdUsuarioPossuidor = 'id_usuario_possuidor';
  static const _columnIdUsuarioContato = 'id_usuario_contato';

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> init() async {
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory, _databaseName);

    //databaseFactory.deleteDatabase(path);

    var db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );

    return db;
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableUsuario (
            $_columnIdUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnKeyQRCode TEXT NOT NULL,
            $columnEmailUsuario TEXT NOT NULL,
            $columnSenhaUsuario TEXT NOT NULL,
            $columnNomeUsuario TEXT NOT NULL,
            $columnEmpresaUsuario TEXT NOT NULL,
            $columnCargoUsuario TEXT NOT NULL,
            $columnLinkUsuario TEXT NOT NULL,
            $columnBiografiaUsuario TEXT NOT NULL,
            $columnTelefoneUsuario TEXT NOT NULL,
            $columnLinkedinUsuario TEXT NOT NULL,
            $columnFacebookUsuario TEXT NOT NULL,
            $columnInstagramUsuario TEXT NOT NULL
          )''');

    await db.execute('''
          CREATE TABLE $_tableContato (
            $_columnIdUsuarioPossuidor INTEGER NOT NULL,
            $_columnIdUsuarioContato INTEGER NOT NULL,
            PRIMARY KEY ($_columnIdUsuarioPossuidor, $_columnIdUsuarioContato)
          )''');

    String sql1 = '''
          INSERT INTO $_tableUsuario 
          VALUES (1, "key_qrcode", "leobbrandaao@gmail.com", "12345", "ni", "ni", "ni", "ni", "ni", "ni", "ni", 
          "ni", "ni")''';
    await db.rawQuery(sql1);

    String sql2 = '''
          INSERT INTO $_tableUsuario 
          VALUES (2, "key_qrcode", "larissa@gmail.com", "12345", "Larissa Valadares", "PUC-Minas", "Estudante", 
          "https://larissa.com.br", "Olá, prazer, sou a Larissa", "(31)99999-9999", "LariValadares", "Larissa Valadares", 
          "larivaladares_")''';
    await db.rawQuery(sql2);

    /*String sql3 = '''
          INSERT INTO $_tableUsuario 
          VALUES (3, "key_qrcode", "Ilo@pucminas.com", "12345", "Ilo", "PUC-Minas", "Professor", 
          "https://Ilo.com.br", "Olá, prazer, sou o professor Ilo e trabalho na Pontifícia Universidade 
          Católica de Minas Gerais", "(31)99999-9999", "Ilo", "Ilo", 
          "iloo_")''';
    await db.rawQuery(sql3);*/

    String sql4 = '''
          INSERT INTO $_tableContato ($_columnIdUsuarioPossuidor, $_columnIdUsuarioContato)
          VALUES (4, 1)''';
    await db.rawQuery(sql4);

    String sql5 = '''
          INSERT INTO $_tableContato ($_columnIdUsuarioPossuidor, $_columnIdUsuarioContato)
          VALUES (4, 2)''';
    await db.rawQuery(sql5);

    /*String sql6 = '''
          INSERT INTO $_tableContato ($_columnIdUsuarioPossuidor, $_columnIdUsuarioContato)
          VALUES (4, 3)''';
    await db.rawQuery(sql6);*/
  }

  /**
   * /////////////////////////////////////////////////////
   * Métodos para utilizar na tabela de Usuários
   * /////////////////////////////////////////////////////
   * */

  Future<int> insertUsuario(Map<String, dynamic> row) async {
    Database db = await init();
    return await db.insert(_tableUsuario, row);
  }

  Future<int> deleteUsuario(int id) async {
    Database db = await init();

    return await db.delete(
      _tableUsuario,
      where: '$_columnIdUsuario = ?',
      whereArgs: [id]
    );
  }

  Future<List<Map<String, dynamic>>> getUsuario(int id) async {
    Database db = await init();

    String sql = '''
      SELECT * FROM $_tableUsuario
      WHERE $_columnIdUsuario = $id
    ''';

    return await db.rawQuery(sql);
  }

  Future<List<Map<String, dynamic>>> getAllUsuario() async {
    Database db = await init();

    return await db.query(_tableUsuario);
  }

  Future<int> updateUsuario(Map<String, dynamic> row, int id) async {
    Database db = await init();

    return await db.update(
      _tableUsuario,
      row,
      where: '$_columnIdUsuario = ?',
      whereArgs: [id],
    );
  }

  /**
   * /////////////////////////////////////////////////////
   * Métodos para utilizar na tabela de Contatos
   * /////////////////////////////////////////////////////
   * */

  Future<List<Map<String, dynamic>>> getAllContatoFromUsuario(int idUsuario) async {
    Database db = await init();

    String sql = '''
      SELECT $_tableUsuario.$columnEmailUsuario, $_tableUsuario.$columnNomeUsuario, $_tableUsuario.$columnEmpresaUsuario, 
      $_tableUsuario.$columnCargoUsuario, $_tableUsuario.$columnLinkUsuario, $_tableUsuario.$columnBiografiaUsuario,
      $_tableUsuario.$columnTelefoneUsuario 
      FROM $_tableContato
      INNER JOIN $_tableUsuario
      ON $_tableContato.$_columnIdUsuarioPossuidor = $idUsuario
      AND $_tableContato.$_columnIdUsuarioContato = $_tableUsuario.$_columnIdUsuario
    ''';

    return await db.rawQuery(sql);
  }


   queryAllUsers() async {
    Database db = await init();

    List usuarios = await db.query(_tableUsuario);

    for(var usu in usuarios){
      print(" id: "+usu[_columnIdUsuario].toString() +
            " email: "+usu[columnEmailUsuario]+
            " senha: "+usu[columnSenhaUsuario]);
    }
  }
}