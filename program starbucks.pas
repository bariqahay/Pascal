program starbucks;
uses crt, sysutils;
type 
  custdine = record
    nama: string;
    member: boolean;
  end;

  custtake = record
    nama: string;
    member: boolean;
  end;

  ojol = record
    nama, orderan: string;
    member: boolean;
  end;

var
  namacs, namaPelanggan, pilihan, pilihan2: string;
  jumlahPelanggan, i, pilihanmacam: integer;
  pil3 : char;
  kode : array of string;
  jumlahpilihan: array[1..10] of integer;
  harga: array of real;
  totalharga, pilbayar, kembalian, diskon : real;

procedure opening;
var
  ib: integer;
begin
  for ib := 1 to 4 do
  begin
    writeln('');
  end;
  writeln('Welcome to Rifki"s Starbucks Store.');
  writeln('===================================');
  for ib := 1 to 4 do
  begin
    writeln('');
  end;
  write('Press Any Button');
  readln;
end;

function IsCashierExist(namakasir: string): boolean;
var
  filecashier: text;
  kasir: string;
begin
  IsCashierExist := false;
  assign(filecashier, 'D:\Downloads\cashier.txt');
  reset(filecashier);

  while not eof(filecashier) do
  begin
    readln(filecashier, kasir);
    if kasir = namakasir then
    begin
      IsCashierExist := true;
      break;
    end;
  end;
  close(filecashier);
end;

procedure cashier;
begin
  write('Masukkan nama kasir : ');
  readln(namacs);

  if IsCashierExist(namacs) then
  begin
    writeln('ID Kasir ditemukan, lanjutkan..');
    readln;
    clrscr;
  end
  else
  begin
    writeln('ID Kasir tidak ditemukan, kembali..');
    halt;
  end;
end;

procedure MintaInputPelanggan;
begin
  writeln('Masukkan Nama Pelanggan: ');
  readln(namaPelanggan);
end;

procedure TambahPelanggan;
var
  filePelanggan: text;
begin
  assign(filePelanggan, 'D:\Downloads\Dine in.txt');
  append(filePelanggan);
  writeln(filePelanggan, namaPelanggan);
  writeln(filePelanggan);
  close(filePelanggan);

  assign(filePelanggan, 'D:\Downloads\takeaway.txt');
  append(filePelanggan);
  writeln(filePelanggan, namaPelanggan);
  writeln(filePelanggan);
  close(filePelanggan);

  assign(filePelanggan, 'D:\Downloads\ojol.txt');
  append(filePelanggan);
  writeln(filePelanggan, namaPelanggan);
  writeln(filePelanggan);
  close(filePelanggan);

  assign(filePelanggan, 'D:\Downloads\member.txt');
  append(filePelanggan);
  writeln(filePelanggan, namaPelanggan);
  writeln(filePelanggan);
  close(filePelanggan);
end;

procedure CekKapasitas;
begin
  if jumlahPelanggan > 10 then
    writeln('Penuh')
  else
    writeln('Masih Ada');
end;

procedure Mainprogram;
var
  filePelanggan: text;
begin
  MintaInputPelanggan;

  // Baca file dan hitung jumlah pelanggan
  jumlahPelanggan := 0;
  Assign(filePelanggan, 'D:\Downloads\Dine in.txt');
  Reset(filePelanggan);
  while not eof(filePelanggan) do
  begin
    readln(filePelanggan);
    Inc(jumlahPelanggan);
  end;
  Close(filePelanggan);

  TambahPelanggan;

  // Cek kapasitas setelah penambahan pelanggan
  CekKapasitas;
  clrscr;
  readln;
end;

procedure Mainprogram2;
var
  filePelanggan: text;
begin
  MintaInputPelanggan;

  // Baca file dan hitung jumlah pelanggan
  jumlahPelanggan := 0;
  Assign(filePelanggan, 'D:\Downloads\takeaway.txt');
  Reset(filePelanggan);
  while not eof(filePelanggan) do
  begin
    readln(filePelanggan);
    Inc(jumlahPelanggan);
  end;
  Close(filePelanggan);

  TambahPelanggan;

  // Cek kapasitas setelah penambahan pelanggan
  CekKapasitas;
  clrscr;
  readln;
end;

procedure Mainprogram3;
var
  filePelanggan: text;
begin
  MintaInputPelanggan;

  // Baca file dan hitung jumlah pelanggan
  jumlahPelanggan := 0;
  Assign(filePelanggan, 'D:\Downloads\Ojol.txt');
  Reset(filePelanggan);
  while not eof(filePelanggan) do
  begin
    readln(filePelanggan);
    Inc(jumlahPelanggan);
  end;
  Close(filePelanggan);

  TambahPelanggan;
  clrscr;
  readln;
end;

procedure Mainprogram4;
var
  filePelanggan: text;
begin
  MintaInputPelanggan;

  // Baca file dan hitung jumlah pelanggan
  jumlahPelanggan := 0;
  Assign(filePelanggan, 'D:\Downloads\member.txt');
  Reset(filePelanggan);
  while not eof(filePelanggan) do
  begin
    readln(filePelanggan);
    Inc(jumlahPelanggan);
  end;
  Close(filePelanggan);

  TambahPelanggan;
  clrscr;
  readln;
end;

procedure HapusPelanggan(namaPelanggan: string);
var
  filePelanggan: text;
  nama: string;
  ditemukan: boolean;
begin
  assign(filePelanggan, 'D:\Downloads\Dine in.txt');
  reset(filePelanggan);

  ditemukan := false;

  while not eof(filePelanggan) do
  begin
    readln(filePelanggan, nama);
    if nama = namaPelanggan then
    begin
      ditemukan := true;
    end;
  end;

  close(filePelanggan);

  if ditemukan then
  begin
    assign(filePelanggan, 'D:\Downloads\Dine in.txt');
    rewrite(filePelanggan);

    reset(filePelanggan);

    while not eof(filePelanggan) do
    begin
      readln(filePelanggan, nama);
      if nama <> namaPelanggan then
        writeln(filePelanggan, nama);
    end;

    close(filePelanggan);
  end
  else
  begin
    writeln('Pelanggan tidak ditemukan.');
  end;
end;

procedure HapusPelanggan2(namaPelanggan: string);
var
  filePelanggan: text;
  nama: string;
  ditemukan: boolean;
begin
  assign(filePelanggan, 'D:\Downloads\takeaway.txt');
  reset(filePelanggan);

  ditemukan := false;

  while not eof(filePelanggan) do
  begin
    readln(filePelanggan, nama);
    if nama = namaPelanggan then
    begin
      ditemukan := true;
    end;
  end;

  close(filePelanggan);

  if ditemukan then
  begin
    assign(filePelanggan, 'D:\Downloads\takeaway.txt');
    rewrite(filePelanggan);

    reset(filePelanggan);

    while not eof(filePelanggan) do
    begin
      readln(filePelanggan, nama);
      if nama <> namaPelanggan then
        writeln(filePelanggan, nama);
    end;

    close(filePelanggan);
  end
  else
  begin
    writeln('Pelanggan tidak ditemukan.');
  end;
end;

procedure HapusPelanggan3(namaPelanggan: string);
var
  filePelanggan: text;
  nama: string;
  ditemukan: boolean;
begin
  assign(filePelanggan, 'D:\Downloads\ojol.txt');
  reset(filePelanggan);

  ditemukan := false;

  while not eof(filePelanggan) do
  begin
    readln(filePelanggan, nama);
    if nama = namaPelanggan then
    begin
      ditemukan := true;
    end;
  end;

  close(filePelanggan);

  if ditemukan then
  begin
    assign(filePelanggan, 'D:\Downloads\ojol.txt');
    rewrite(filePelanggan);

    reset(filePelanggan);

    while not eof(filePelanggan) do
    begin
      readln(filePelanggan, nama);
      if nama <> namaPelanggan then
        writeln(filePelanggan, nama);
    end;

    close(filePelanggan);
  end
  else
  begin
    writeln('Pelanggan tidak ditemukan.');
  end;
end;

procedure Daftarmenu;
var
  teks : text;
  pesan : string;
begin
  assign(teks, 'D:\Downloads\Daftarmenu.txt');
  reset(teks);

  while not eof(teks) do
  begin
    readln(teks, pesan);
    writeln(pesan);
  end;
end;

procedure Pemilihan_Menu;
begin
  writeln('Masukkan Menu Berdasarkan Kode: ');
  write('Berapa macam menu yang ingin dipesan: '); readln(pilihanmacam);
  for i := 1 to pilihanmacam do
    begin
      write(i,'. ');
      readln(kode[i]);
      clrscr;
      write('Berapa: ');
      readln(jumlahpilihan[i]);
      clrscr;
    end; 
end;

procedure Daftarharga;
begin
  for i := 1 to pilihanmacam do
  begin
    case kode[i] of
      'CP' : harga[i] := 2.50;
      'BF' : harga[i] := 3.30;
      'CAC' : harga[i] := 2.55;
      'CTT' : harga[i] := 3.50;
      'RVR' : harga[i] := 2.30;
      'CA' : harga[i] := 2.70;
      'ADL' : harga[i] := 2.50;
      'MC' : harga[i] := 2.50;
      'GTL' : harga[i] := 2.00;
      'BS' : harga[i] := 2.10;
    end;
  end;
end;

procedure HitungTotalHarga;
begin
  totalHarga := 0;
  for i := 1 to pilihanmacam do
  begin
    totalHarga := totalHarga + (harga[i] * jumlahpilihan[i]);
  end;
end;

procedure Pembayaran;
begin
  clrscr;
  write('Menu Yang Dipesan: ');
  for i := 1 to pilihanmacam do
    begin 
      write(i, '. ');
      write(kode[i], ' ');
      write('x ',jumlahpilihan[i]);
    end;
  writeln('Totalnya adalah ', totalHarga, '$');
  write('Apakah ada member(Y/T): '); readln(pil3);
  if pil3 = 'Y' then 
  begin
    diskon := totalharga * 0.90;
    write('Masukkan Uang: '); readln(pilbayar);
    if pilbayar >= diskon then
    begin
      kembalian := pilbayar - diskon;
      writeln('Berikut kembalian nya ', kembalian, '$');
    end
    else 
    begin
      writeln('Uang mu kurang jancok');
    end;
  end
  else 
  begin
    write('Masukkan Uang: '); readln(pilbayar);
    if pilbayar >= totalharga then
    begin
      writeln('Berikut kembalian nya ', totalharga, '$');
    end
    else 
    begin
      writeln('Uang mu kurang jancok');
    end;
  end;
end;

procedure menu;
begin
  repeat 
  writeln('Menu Utama Starbucks Ripki');
  writeln('==========================');
  writeln('1. Check In ');
  writeln('2. Check Out ');
  writeln('3. Daftar Member ');
  write('Masukkan Pilihan (CI/CO/DM): ');
  readln(pilihan);
  clrscr;

  if pilihan = 'CI' then
  begin
      writeln('1. Dine-in ');
      writeln('2. Takeaway ');
      writeln('3. Ojol ');
      write('Masukkan Pilihan (DI/TA/OJ/EXIT): ');
      readln(pilihan2);
      if pilihan2 = 'DI' then
      begin
        Mainprogram;
        Daftarmenu;
        writeln('Silahkan duduk dan panggil waiter untuk memesan. ');
        clrscr;
      end
      else if pilihan2 = 'TA' then
      begin
        Mainprogram2;
        Daftarmenu;
        writeln('Silahkan duduk terlebih dahulu. ');
        clrscr;
      end
      else if pilihan2 = 'OJ' then
      begin
        Mainprogram3;
        Daftarmenu;
        writeln('Tunggu Sebentar..');
        clrscr;
        writeln('Konfirmasi Ulang Menu: ');
        Pemilihan_Menu;
        Daftarharga;
        HitungTotalHarga;
        Pembayaran;
        HapusPelanggan3(namaPelanggan);
        clrscr;
        writeln('Terima Kasih.')
      end
      else 
      begin
        clrscr;
        write('Menu Tidak Ditemukan');
      end;
  end
  
  else if pilihan = 'CO' then 
  begin
      writeln('1. Dine-in ');
      writeln('2. Takeaway ');
      write('Masukkan Pilihan (DI/TA): ');
      readln(pilihan2);
      if pilihan2 = 'DI' then
      begin
        clrscr;
        writeln('Konfirmasi Ulang Menu: ');
        Pemilihan_Menu;
        Daftarharga;
        HitungTotalHarga;
        Pembayaran;
        MintaInputPelanggan;
        HapusPelanggan(namaPelanggan);
        clrscr;
        writeln('Terima Kasih.')
      end
      else if pilihan2 = 'TA' then
      begin
        clrscr;
        writeln('Konfirmasi Ulang Menu: ');
        Pemilihan_Menu;
        Daftarharga;
        HitungTotalHarga;
        Pembayaran;
        MintaInputPelanggan;
        HapusPelanggan2(namaPelanggan);
        clrscr;
        writeln('Terima Kasih.')
      end;
  end
  
  else if pilihan = 'DM' then
  begin
    Mainprogram4;
  end;

  until pilihan = 'CO';
end;

begin
  clrscr;
  SetLength(kode, 10);
  SetLength(harga, 10);
  opening;
  clrscr;
  cashier;
  menu;
end.