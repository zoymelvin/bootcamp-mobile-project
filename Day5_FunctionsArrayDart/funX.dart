
// 1. Pertambahan
double tambah (double a, double b) {
  return a + b;
}

// 2. Pengurangan
double kurang (double a, double b){
  return a - b;
}

// 3. Perkalian
double kali (double a, double b){
  return a * b;
}

// 4. pembagian
double bagi (double a, double b){
  return a / b;
}

// 5. Extension Function Cek Nilai

extension cekNilai on num {
  bool pembandingNilai(num pembanding ) {
    return this >= pembanding ;
  }
}


// Uji Coba Code

void main() {

  double angka1 = 200;
  double angka2 = 100;


  print("--- Uji Coba Fungsi Aritmatika ---");
  print("$angka1 + $angka2 = ${tambah(angka1, angka2)}");
  print("$angka1 - $angka2 = ${kurang(angka1, angka2)}");
  print("$angka1 * $angka2 = ${kali(angka1, angka2)}");
  print("$angka1 / $angka2 = ${bagi(angka1, angka2)}");

  print("--- Uji Coba Fungsi Extension ---");

  int nilaiA = 8000;
  int nilaiB = 7000;

  print("Nilai A $nilaiA lebih besar atau sama dengan dari $nilaiB? ${nilaiA.pembandingNilai(nilaiB)}");

  bool cekB = nilaiB.pembandingNilai(nilaiA);
  print("Nilai B $nilaiB lebih besar atau sama dengan dari $nilaiA? $cekB"); 
}
