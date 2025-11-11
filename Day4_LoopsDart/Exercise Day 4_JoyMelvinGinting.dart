void main() {
  List<Map<String, dynamic>> dataKaryawan = [
    {
      'nama': 'Alice',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.5,
      'jumlah Proyek': 8,
      'tahunGabung': '2022',
      'statusPelatihan': true,
      'gajiPokok': 7000000
    },
    {
      'nama': 'Bob',
      'departemen': 'Pemasaran',
      'skorKinerja': 3.8,
      'jumlah Proyek': 5,
      'tahunGabung': '2021',
      'statusPelatihan': false,
      'gajiPokok': 6500000
    },
    {
      'nama': 'Charlie',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.9,
      'jumlah Proyek': 10,
      'tahunGabung': '2023',
      'statusPelatihan': true,
      'gajiPokok': 8000000
    },
    {
      'nama': 'Diana',
      'departemen': 'HR',
      'skorKinerja': 4.2,
      'jumlah Proyek': 3,
      'tahunGabung': '2022',
      'statusPelatihan': true,
      'gajiPokok': 6000000
    },
    {
      'nama': 'Eve',
      'departemen': 'Pemasaran',
      'skorKinerja': 3.5,
      'jumlah Proyek': 6,
      'tahunGabung': '2023',
      'statusPelatihan': false,
      'gajiPokok': 6200000
    },
    {
      'nama': 'Frank',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.7,
      'jumlah Proyek': 9,
      'tahunGabung': '2021',
      'statusPelatihan': true,
      'gajiPokok': 7500000
    },
    {
      'nama': 'Grace',
      'departemen': 'HR',
      'skorKinerja': 3.0,
      'jumlah Proyek': 2,
      'tahunGabung': '2024',
      'statusPelatihan': false,
      'gajiPokok': 5800000
    },
    {
      'nama': 'Heidi',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.1,
      'jumlah Proyek': 7,
      'tahunGabung': '2022',
      'statusPelatihan': true,
      'gajiPokok': 7200000
    },
  ];

  print('Analisis Kinerja Karyawan "Dibimbing"');
  print('-----------------------------------------');

  toatalGaji(dataKaryawan);
  kinerjaKaryawan(dataKaryawan);
  brpBlmPelatihan(dataKaryawan);
  skorKinerja(dataKaryawan);
  laporanRingkasan(dataKaryawan);
  skorRata(dataKaryawan);
  skorProyek(dataKaryawan);
  siapaBlmPelatihan(dataKaryawan);
}

// MEnghitung total gaji seluruh karyawan
void toatalGaji(List<Map<String, dynamic>> dataKaryawan) {
  double totalGajiKeseluruhan = 0.0;
  for (int i = 0; i < dataKaryawan.length; i++) {
    totalGajiKeseluruhan += dataKaryawan[i]['gajiPokok'];
  }
  print(
      "a. Total Gaji Keseluruhan Karyawan: Rp${totalGajiKeseluruhan.toStringAsFixed(2)}");
}

// Karyawan Yang Berkinerja Tinggi 
void kinerjaKaryawan(List<Map<String, dynamic>> dataKaryawan) {
  List<String> karyawanKinerjaTinggi = [];
  for (var karyawan in dataKaryawan) {
    if (karyawan['skorKinerja'] > 4.0) {
      karyawanKinerjaTinggi.add(karyawan['nama']);
    }
  }
  print("b. Karyawan Berkinerja Tinggi: ${karyawanKinerjaTinggi.join(', ')}");
}

// Karyawan yang Belum Pelatihan
void brpBlmPelatihan(List<Map<String, dynamic>> dataKaryawan) {
  int jumlahBelumPelatihan = 0;
  int i = 0;
  while (i < dataKaryawan.length) {
    if (dataKaryawan[i]['statusPelatihan'] == false) {
      jumlahBelumPelatihan++;
    }
    i++;
  }
  print("c. Jumlah Karyawan Belum Pelatihan: $jumlahBelumPelatihan orang");
}

// Skor Kinerja Karyawan
void skorKinerja(List<Map<String, dynamic>> dataKaryawan) {
  bool adaKinerjaSempurna = false;
  int j = 0;
  if (dataKaryawan.isNotEmpty) {
    do {
      if (dataKaryawan[j]['skorKinerja'] == 5.0) {
        adaKinerjaSempurna = true;
        break;
      }
      j++;
    } while (j < dataKaryawan.length);
  }
  print(
      "d. Ada Karyawan dengan Skor Kinerja 5.0: ${adaKinerjaSempurna ? 'Ya' : 'Tidak'}");
}

// Laporan Ringkas Karyawan
void laporanRingkasan(List<Map<String, dynamic>> dataKaryawan) {
  print("e. Laporan Ringkas Karyawan:");
  dataKaryawan.forEach((karyawan) {
    print(
        "   - {nama: ${karyawan['nama']}, departemen: ${karyawan['departemen']}, skorKinerja: ${karyawan['skorKinerja']}}");
  });
}

// Skor rata-rata projek dari keseluruhan karyawan
void skorRata(List<Map<String, dynamic>> dataKaryawan) {
  var allProyek = dataKaryawan.map((k) => k['jumlah Proyek']);
  var totalProyek = allProyek.reduce((a, b) => a + b);
  double rataRataKeseluruhan = totalProyek / dataKaryawan.length;
  
  print("f. Skor rata-rata projek dari keseluruhan karyawan: ${rataRataKeseluruhan.toStringAsFixed(2)}");
}

// Karyawan Pengembangan dengan Proyek Di Atas Rata-rata
void skorProyek(List<Map<String, dynamic>> dataKaryawan) {
  var devKaryawan =
      dataKaryawan.where((k) => k['departemen'] == 'Pengembangan').toList();

  if (devKaryawan.isEmpty) {
    print("g. Tidak ada karyawan di departemen Pengembangan.");
    return;
  }
  
  var devProyek = devKaryawan.map((k) => k['jumlah Proyek']);
  var totalDevProyek = devProyek.reduce((a, b) => a + b);
  double rataRataDevProyek = totalDevProyek / devKaryawan.length;

  var diAtasRataRata =
      devKaryawan.where((k) => k['jumlah Proyek'] > rataRataDevProyek);

  print(
      "g. Karyawan Pengembangan dengan Proyek Di Atas Rata-rata (${rataRataDevProyek.toStringAsFixed(2)}):");
  diAtasRataRata.forEach((k) {
    print("   - ${k['nama']} (${k['jumlah Proyek']} proyek)");
  });
}
// Karyawan yang belum melakukan pelatihan
void siapaBlmPelatihan(List<Map<String, dynamic>> dataKaryawan) {
   var belumPelatihan = dataKaryawan.where((k) => k['statusPelatihan'] == false);
   var namaBelumPelatihan = belumPelatihan.map((k) => k['nama']);
   
   print("h. Karyawan yang belum melakukan pelatihan: ${namaBelumPelatihan.join(', ')}");
}