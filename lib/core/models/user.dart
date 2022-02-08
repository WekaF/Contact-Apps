class User {
  int? id;
  String? nama;
  String? alamat;
  String? tanggal;
  String? tinggi;
  String? berat;
  String? foto;

  User({
    this.id,
    this.nama,
    this.alamat,
    this.berat,
    this.tanggal,
    this.tinggi,
    this.foto
    }
  );

  User.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    alamat = json['alamat'];
    berat = json['berat'].toString();
    tinggi = json['tinggi'].toString();
    tanggal = json['tanggal'];
    foto = json['foto'].toString();
   
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['tanggal'] = tanggal;
    data['tinggi'] = tinggi;
    data['berat'] = berat;
    data['foto'] = foto;
    return data;
  }
}
