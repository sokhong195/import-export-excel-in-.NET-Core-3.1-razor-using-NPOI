using System;
using Microsoft.EntityFrameworkCore;

namespace ImportExcelFIle.DotNETCore.Models
{
    public partial class dbPhanCongThanhToanContext : DbContext
    {
        public static DateTime? Date { get; set; }
        public dbPhanCongThanhToanContext() 
        {
            Date = null;
        }

        public dbPhanCongThanhToanContext(DbContextOptions<dbPhanCongThanhToanContext> options)
            : base(options)
        {
        }
        public virtual DbSet<QuyDinhSiSoLopHocPhan> QuyDinhSiSoLopHocPhans { get; set; }

        public virtual DbSet<BaoGioCoiHoiThi> BaoGioCoiHoiThis { get; set; }
        public virtual DbSet<BaoGioGiangDay> BaoGioGiangDays { get; set; }
        public virtual DbSet<BaoGioGiangDayChiTiet> BaoGioGiangDayChiTiets { get; set; }
        public virtual DbSet<BaoGioTrungTam> BaoGioTrungTams { get; set; }
        public virtual DbSet<BaoGioTrungTamChiTiet> BaoGioTrungTamChiTiets { get; set; }
        public virtual DbSet<BoMon> BoMons { get; set; }
        public virtual DbSet<ChiTietLoaiDeTai> ChiTietLoaiDeTais { get; set; }
        public virtual DbSet<QuyDinhChiTiet> QuyDinhChiTiets { get; set; }
        public virtual DbSet<ChucVu> ChucVus { get; set; }
        public virtual DbSet<GiaoVienChucVu> GiaoVienChucVus { get; set; }
        public virtual DbSet<HeSoChucVu> HeSoChucVus { get; set; }

        public virtual DbSet<DinhMucTheoLoaiGiangVien> DinhMucTheoLoaiGiangViens { get; set; }
        public virtual DbSet<GiaoVien> GiaoViens { get; set; }
        public virtual DbSet<CacHeSoLuong> CacHeSoLuongs { get; set; }
        public virtual DbSet<GiaoVienChiTiet> GiaoVienChiTiets { get; set; }
        public virtual DbSet<GiaoVienTrinhDo> GiaoVienTrinhDoes { get; set; }

        public virtual DbSet<GioChuanLyThuyet> GioChuanLyThuyets { get; set; }
        public virtual DbSet<GioChuanNghienCuuKhoaHoc> GioChuanNghienCuuKhoaHocs { get; set; }
        public virtual DbSet<HeSoSinhVien> HeSoSinhViens { get; set; }
        public virtual DbSet<HinhThucThi> HinhThucThis { get; set; }
        public virtual DbSet<HoatDongNckh> HoatDongNckhs { get; set; }
        public virtual DbSet<HocKy> HocKies { get; set; }
        public virtual DbSet<HocPhan> HocPhans { get; set; }
        public virtual DbSet<Khoa> Khoas { get; set; }
        public virtual DbSet<KhoaHoc> KhoaHocs { get; set; }
        public virtual DbSet<LoaiCongViec> LoaiCongViecs { get; set; }
        public virtual DbSet<LoaiDeTai> LoaiDeTais { get; set; }
        public virtual DbSet<LoaiHocPhan> LoaiHocPhans { get; set; }
        public virtual DbSet<LoaiQuyDinh> LoaiQuyDinhs { get; set; }
        public virtual DbSet<NamHoc> NamHocs { get; set; }
        public virtual DbSet<NamHocHocKy> NamHocHocKies { get; set; }
        public virtual DbSet<NghienCuuKhoaHoc> NghienCuuKhoaHocs { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<NhiemVuBoSung> NhiemVuBoSungs { get; set; }
        public virtual DbSet<PhanCongCoiHoiThi> NhiemVuCoiHoiThis { get; set; }
        public virtual DbSet<PhanCongDayTrungTam> NhiemVuDayTrungTams { get; set; }
        public virtual DbSet<PhanCongGiangDay> PhanCongGiangDays { get; set; }
        public virtual DbSet<NhiemVuKhoaHoc> NhiemVuKhoaHocs { get; set; }
        public virtual DbSet<PhanQuyen> PhanQuyens { get; set; }
        public virtual DbSet<PhanQuyenChiTiet> PhanQuyenChiTiets { get; set; }
        public virtual DbSet<PhanQuyenNguoiDung> PhanQuyenNguoiDungs { get; set; }
        public virtual DbSet<PhongTrungTam> PhongTrungTams { get; set; }
        public virtual DbSet<QuyDinh> QuyDinhs { get; set; }
        public virtual DbSet<QuyDinhGioChuanChamThiLyThuyet> QuyDinhGioChuanChamThiLyThuyets { get; set; }
        public virtual DbSet<QuyDinhGioChuanCoiThiLyThuyet> QuyDinhGioChuanCoiThiLyThuyets { get; set; }
        public virtual DbSet<QuyDinhGioChuanRaDe> QuyDinhGioChuanRaDes { get; set; }
        public virtual DbSet<QuyDinhGioChuanThucHanh> QuyDinhGioChuanThucHanhs { get; set; }
        public virtual DbSet<QuyDinhGioChuanThucHanhBoSung> QuyDinhGioChuanThucHanhBoSungs { get; set; }
        public virtual DbSet<QuyDinhVeHuongDanDoAn> QuyDinhVeHuongDanDoAns { get; set; }
        public virtual DbSet<ThanhVienDeTai> ThanhVienDeTais { get; set; }
        public virtual DbSet<ThongKeSinhVienThuocKhoa> ThongKeSinhVienThuocKhoas { get; set; }
        public virtual DbSet<MienGiamTheoTrangThaiLamViec> MienGiamTheoTrangThaiGiaoViens { get; set; }
        public virtual DbSet<GiaoVienTrangThaiLamViec> GiaoVienTrangThaiLamViecs { get; set; }

        public virtual DbSet<TrangThaiLamViec> TrangThaiLamViecs { get; set; }


        public virtual DbSet<TinhGioTrungTam> TinhGioTrungTams { get; set; }
        public virtual DbSet<TrinhDo> TrinhDos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.;Database=dbPhanCongThanhToan;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<BaoGioCoiHoiThi>(entity =>
            {
                entity.HasKey(e => e.IdBaoGioCoiHoiThi)
                    .HasName("PK_TBLBAOGIOCOIHOITHI");

                entity.ToTable("BaoGioCoiHoiThi");

                entity.Property(e => e.IdBaoGioCoiHoiThi)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("idBaoGioCoiHoiThi");

                entity.Property(e => e.TenBaoGioCoiHoiThi)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(true);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdNamHocHocKyNavigation)
                    .WithMany(p => p.BaoGioCoiHoiThis)
                    .HasForeignKey(d => d.IdNamHocHocKy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BaoGioCoiHoiThi_NamHocHocKy");
            });

         

            modelBuilder.Entity<BaoGioGiangDay>(entity =>
            {
                entity.HasKey(e => e.IdBaoGioGiangDay)
                    .HasName("PK_TBLBAOGIOGIANGDAY");

                entity.ToTable("BaoGioGiangDay");

                entity.Property(e => e.IdBaoGioGiangDay).HasColumnName("idBaoGioGiangDay");

                entity.Property(e => e.TenPhanCongGiangDay)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.TenTepBaoGio)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("datetime");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("datetime");

                entity.HasOne(d => d.IdNamHocHocKyNavigation)
                    .WithMany(p => p.BaoGioGiangDays)
                    .HasForeignKey(d => d.IdNamHocHocKy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BaoGioGiangDay_NamHocHocKy");
            });

            modelBuilder.Entity<BaoGioGiangDayChiTiet>(entity =>
            {
                entity.HasKey(e => e.IdBaoGioGiangDayChiTiet)
                    .HasName("PK_TBLBAOGIOGIANGDAYCHITIET");

                entity.ToTable("BaoGioGiangDayChiTiet");

                entity.Property(e => e.CaThi).HasMaxLength(50);

                entity.Property(e => e.GhiChu).HasMaxLength(50);

                entity.Property(e => e.IdBaoGioGiangDay).HasColumnName("idBaoGioGiangDay");

                entity.Property(e => e.IdHocPhan).HasColumnName("idHocPhan");

                entity.Property(e => e.NgayThi).HasColumnType("date");

                entity.Property(e => e.PhongThi).HasMaxLength(100);

                entity.Property(e => e.TenLopHocPhan)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.IdBaoGioCoiHoiThiNavigation)
                    .WithMany(p => p.BaoGioGiangDayChiTiets)
                    .HasForeignKey(d => d.IdBaoGioCoiHoiThi)
                    .HasConstraintName("FK_BaoGioGiangDayChiTiet_BaoGioCoiHoiThi");

                entity.HasOne(d => d.IdBaoGioGiangDayNavigation)
                    .WithMany(p => p.BaoGioGiangDayChiTiets)
                    .HasForeignKey(d => d.IdBaoGioGiangDay)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblBaoGioGiangDayChiTiet_fk0");

                entity.HasOne(d => d.IdHocPhanNavigation)
                    .WithMany(p => p.BaoGioGiangDayChiTiets)
                    .HasForeignKey(d => d.IdHocPhan)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BaoGioGiangDayChiTiet_HocPhan");
            });

            modelBuilder.Entity<BaoGioTrungTam>(entity =>
            {
                entity.HasKey(e => e.IdBaoGioTrungTam)
                    .HasName("PK_TBLBAOGIOTRUNGTAM");

                entity.ToTable("BaoGioTrungTam");

                entity.Property(e => e.IdBaoGioTrungTam)
                    .ValueGeneratedNever()
                    .HasColumnName("idBaoGioTrungTam");

                entity.Property(e => e.IdKhoa).HasColumnName("idKhoa");

                entity.Property(e => e.TenBaoGio)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.TenTepBaoGio).HasMaxLength(100);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.Property(e => e.ThongTinVeThoiGianKhoaHoc)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<BaoGioTrungTamChiTiet>(entity =>
            {
                entity.HasKey(e => e.IdBaoGioTrungTamChiTiet)
                    .HasName("PK_TBLBAOGIOTRUNGTAMCHITIET");

                entity.ToTable("BaoGioTrungTamChiTiet");

                entity.Property(e => e.IdBaoGioTrungTamChiTiet)
                    .ValueGeneratedNever()
                    .HasColumnName("idBaoGioTrungTamChiTiet");

                entity.Property(e => e.GhiChu)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.IdBaoGioTrungTam).HasColumnName("idBaoGioTrungTam");

                entity.Property(e => e.TenLop)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdBaoGioTrungTamNavigation)
                    .WithMany(p => p.BaoGioTrungTamChiTiets)
                    .HasForeignKey(d => d.IdBaoGioTrungTam)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblBaoGioTrungTamChiTiet_fk0");
            });

            modelBuilder.Entity<BoMon>(entity =>
            {
                entity.HasKey(e => e.IdBoMon)
                    .HasName("PK_TBLBOMON");

                entity.ToTable("BoMon");

                entity.Property(e => e.IdBoMon).HasColumnName("idBoMon");

                entity.Property(e => e.IdKhoa)
                    .IsRequired()
                    .HasMaxLength(2)
                    .HasColumnName("idKhoa");

                entity.Property(e => e.TenBoMon)
                    .IsRequired()
                    .HasMaxLength(55);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdKhoaNavigation)
                    .WithMany(p => p.BoMons)
                    .HasForeignKey(d => d.IdKhoa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblBoMon_tblKhoa");
            });

            modelBuilder.Entity<ChiTietLoaiDeTai>(entity =>
            {
                entity.HasKey(e => e.IdChiTietLoaiDeTai)
                    .HasName("PK_tblChiTietLoaiDeTai");

                entity.ToTable("ChiTietLoaiDeTai");

                entity.Property(e => e.IdChiTietLoaiDeTai).HasColumnName("idChiTietLoaiDeTai");

                entity.Property(e => e.IdLoaiDeTai).HasColumnName("idLoaiDeTai");

                entity.Property(e => e.TenChiTietLoaiDeTai)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdLoaiDeTaiNavigation)
                    .WithMany(p => p.ChiTietLoaiDeTais)
                    .HasForeignKey(d => d.IdLoaiDeTai)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblChiTietLoaiDeTai_tblLoaiDeTai");
            });

            modelBuilder.Entity<QuyDinhChiTiet>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhChiTiet)
                    .HasName("PK_tblChiTietQuyDinh");

                entity.ToTable("QuyDinhChiTiet");

                entity.Property(e => e.IdQuyDinhChiTiet)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("IdQuyDinhChiTiet");

                entity.Property(e => e.IdQuyDinh).HasColumnName("idQuyDinh");
                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.Property(e => e.GiaTri).HasColumnType("float");


                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");


                entity.HasOne(d => d.IdQuyDinhNavigation)
                     .WithMany(p => p.QuyDinhChiTiets)
                     .HasForeignKey(d => d.IdQuyDinh)
                     .OnDelete(DeleteBehavior.ClientSetNull)
                     .HasConstraintName("FK_ChiTietQuyDinh_QuyDinh");
            });

            modelBuilder.Entity<ChucVu>(entity =>
            {
                entity.HasKey(e => e.IdChucVu)
                    .HasName("PK_TBLCHUCVU");

                entity.ToTable("ChucVu");

                entity.Property(e => e.IdChucVu).HasColumnName("idChucVu");

                entity.Property(e => e.TenChucVu)
                    .IsRequired()
                    .HasMaxLength(100);
            });



            modelBuilder.Entity<DinhMucTheoLoaiGiangVien>(entity =>
            {
                entity.HasKey(e => e.IdDinhMucTheoLoaiGiangVien)
                    .HasName("PK_tblDinhMucTheoLoaiGiangVien");

                entity.ToTable("DinhMucTheoLoaiGiangVien");


                entity.Property(e => e.IdLoaiGiangVien).HasColumnName("idLoaiGiangVien");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

               
            });

            modelBuilder.Entity<GiaoVien>(entity =>
            {
                entity.HasKey(e => e.IdGiaoVien)
                    .HasName("PK_TBLGIAOVIEN");

                entity.ToTable("GiaoVien");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.Property(e => e.DienThoai).HasMaxLength(20);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.HoTenGiaoVien)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.IdNguoiDung).HasColumnName("idNguoiDung");

                entity.Property(e => e.NgaySinh).HasColumnType("date");

                entity.HasOne(d => d.IdNguoiDungNavigation)
                    .WithMany(p => p.GiaoViens)
                    .HasForeignKey(d => d.IdNguoiDung)
                    .HasConstraintName("tblGiaoVien_fk1");
            });
            modelBuilder.Entity<TrangThaiLamViec>(entity =>
            {
                entity.HasKey(e => e.IdTrangThaiLamViec);

                entity.ToTable("TrangThaiLamViec");

                entity.Property(e => e.IdTrangThaiLamViec).HasColumnName("idTrangThaiLamViec").ValueGeneratedOnAdd();

                entity.Property(e => e.TenTrangThaiLamViec).HasMaxLength(200).HasColumnName("TenTrangThaiLamViec");

            });
            modelBuilder.Entity<CacHeSoLuong>(entity =>
            {
                entity.HasKey(e => e.IdHeSoLuong);

                entity.ToTable("CacHeSoLuong");

                entity.Property(e => e.IdHeSoLuong).HasColumnName("idHeSoLuong");

                entity.Property(e => e.HeSoLuong).HasColumnName("HeSoLuong");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
                entity.Property(e => e.QuyetDinh)

                    .HasMaxLength(200);

                entity.Property(e => e.TinhTrang)
                    
                    .HasMaxLength(50);

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.CacHeSoLuongs)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_HeSoLuong_GiaoVien");
            });

            modelBuilder.Entity<GiaoVienChucVu>(entity =>
            {
                entity.HasKey(e => e.IdGiaoVienChucVu);

                entity.ToTable("GiaoVienChucVu");

                entity.Property(e => e.QuyetDinh).HasMaxLength(200);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");



                entity.Property(e => e.TinhTrang).HasColumnName("TinhTrang").HasMaxLength(50); ;
                   
                  

                entity.HasOne(d => d.IdChucVuNavigation)
                    .WithMany(p => p.GiaoVienChucVus)
                    .HasForeignKey(d => d.IdChucVu)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienChucVu_ChucVu");

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.GiaoVienChucVus)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienChucVu_GiaoVien");
            });


            modelBuilder.Entity<HeSoChucVu>(entity =>
            {
                entity.HasKey(e => e.IdHeSoChucVu);

                entity.ToTable("HeSoChucVu");
                entity.Property(e => e.GiaTri).HasColumnType("float");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdChucVuNavigation)
                    .WithMany(p => p.HeSoChucVus)
                    .HasForeignKey(d => d.IdChucVu)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_HeSoChucVu_ChucVu");
            });
            modelBuilder.Entity<GiaoVienTrinhDo>(entity =>
            {
                entity.HasKey(e => e.IdGiaoVienTrinhDo);

                entity.ToTable("GiaoVienTrinhDo");

                entity.Property(e => e.IdGiaoVienTrinhDo)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("idGiaoVienTrinhDo");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.Property(e => e.IdTrinhDo).HasColumnName("idTrinhDo");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.Property(e => e.TinhTrang)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.QuyetDinh).HasMaxLength(200);

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.GiaoVienTrinhDos)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienTrinhDo_GiaoVien");

                entity.HasOne(d => d.IdTrinhDoNavigation)
                    .WithMany(p => p.GiaoVienTrinhDos)
                    .HasForeignKey(d => d.IdTrinhDo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienTrinhDo_TrinhDo");
            });

            modelBuilder.Entity<GiaoVienChiTiet>(entity =>
            {
                entity.HasKey(e => e.IdGiaoVienChiTiet)
                    .HasName("PK_tblGiaoVienLoaiCongViec");

                entity.ToTable("GiaoVienChiTiet");

                entity.Property(e => e.QuyetDinh).HasMaxLength(200);


                entity.Property(e => e.IdGiaoVienChiTiet).HasColumnName("idGiaoVienChiTiet");

                entity.Property(e => e.IdBoMon).HasColumnName("idBoMon");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.Property(e => e.IdLoaiCongViec).HasColumnName("idLoaiCongViec");

                entity.Property(e => e.IdPhongTrungTam).HasColumnName("idPhongTrungTam");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
                entity.Property(e => e.TinhTrang).HasColumnName("TinhTrang").HasMaxLength(50); 

                entity.HasOne(d => d.IdBoMonNavigation)
                    .WithMany(p => p.GiaoVienChiTiets)
                    .HasForeignKey(d => d.IdBoMon)
                    .HasConstraintName("FK_GiaoVienChiTiet_BoMon");

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.GiaoVienChiTiets)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienChiTiet_GiaoVien");

                entity.HasOne(d => d.IdLoaiCongViecNavigation)
                    .WithMany(p => p.GiaoVienChiTiets)
                    .HasForeignKey(d => d.IdLoaiCongViec)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienChiTiet_LoaiCongViec");

                entity.HasOne(d => d.IdPhongTrungTamNavigation)
                    .WithMany(p => p.GiaoVienChiTiets)
                    .HasForeignKey(d => d.IdPhongTrungTam)
                    .HasConstraintName("FK_GiaoVienChiTiet_PhongTrungTam");
            });

            modelBuilder.Entity<GiaoVienTrangThaiLamViec>(entity =>
            {
                entity.HasKey(e => e.IdGiaoVienTrangThaiLamViec)
                    .HasName("PK_GiaoVienCongViecChiTiet");

                entity.ToTable("GiaoVienTrangThaiLamViec");

                entity.Property(e => e.IdGiaoVienTrangThaiLamViec).HasColumnName("idGiaoVienTrangThaiLamViec");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.Property(e => e.IdTrangThaiLamViec).HasColumnName("idTrangThaiLamViec");

                entity.Property(e => e.QuyetDinh).HasMaxLength(200);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.Property(e => e.TinhTrang).HasMaxLength(50);

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.GiaoVienTrangThaiLamViecs)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienCongViecChiTiet_GiaoVien");

                entity.HasOne(d => d.IdTrangThaiLamViecNavigation)
                    .WithMany(p => p.GiaoVienTrangThaiLamViecs)
                    .HasForeignKey(d => d.IdTrangThaiLamViec)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GiaoVienTrangThaiLamViec_TrangThaiLamViec");
            });
            modelBuilder.Entity<GioChuanLyThuyet>(entity =>
            {
                entity.HasKey(e => e.IdGioChuanLyThuyet)
                    .HasName("PK_tblGioChuanLyThuyet");

                entity.ToTable("GioChuanLyThuyet");

                entity.Property(e => e.IdGioChuanLyThuyet)
                    .ValueGeneratedNever()
                    .HasColumnName("idGioChuanLyThuyet");
            });

            modelBuilder.Entity<GioChuanNghienCuuKhoaHoc>(entity =>
            {
                entity.HasKey(e => e.IdGioChuanNghienCuuKhoaHoc)
                    .HasName("PK_tblGioChuanNghienCuuKhoaHoc");

                entity.ToTable("GioChuanNghienCuuKhoaHoc");

                entity.Property(e => e.IdGioChuanNghienCuuKhoaHoc).HasColumnName("idGioChuanNghienCuuKhoaHoc");

                entity.Property(e => e.IdChiTietLoaiDeTai).HasColumnName("idChiTietLoaiDeTai");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdChiTietLoaiDeTaiNavigation)
                    .WithMany(p => p.GioChuanNghienCuuKhoaHocs)
                    .HasForeignKey(d => d.IdChiTietLoaiDeTai)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblGioChuanNghienCuuKhoaHoc_tblChiTietLoaiDeTai");
            });

            modelBuilder.Entity<HeSoSinhVien>(entity =>
            {
                entity.HasKey(e => e.IdHeSoSinhVien)
                    .HasName("PK_tblHeSoSinhVien");

                entity.ToTable("HeSoSinhVien");

                entity.Property(e => e.IdHeSoSinhVien).HasColumnName("idHeSoSinhVien");
            });

            modelBuilder.Entity<HinhThucThi>(entity =>
            {
                entity.HasKey(e => e.IdHinhThucThi)
                    .HasName("PK_tblHinhThucThi");

                entity.ToTable("HinhThucThi");

                entity.Property(e => e.IdHinhThucThi).HasColumnName("idHinhThucThi");

                entity.Property(e => e.TenHinhThucThi)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
            });

            modelBuilder.Entity<HoatDongNckh>(entity =>
            {
                entity.HasKey(e => e.IdHoatDongNckh)
                    .HasName("PK_tblHoatDongNCKH");

                entity.ToTable("HoatDongNCKH");

                entity.Property(e => e.IdHoatDongNckh).HasColumnName("idHoatDongNCKH");

                entity.Property(e => e.TenHoatDongNckh)
                    .HasMaxLength(80)
                    .HasColumnName("TenHoatDongNCKH")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<HocKy>(entity =>
            {
                entity.HasKey(e => e.IdHocKy)
                    .HasName("PK_TBLHOCKY");

                entity.ToTable("HocKy");

                entity.Property(e => e.TenHocKy)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<HocPhan>(entity =>
            {
                entity.HasKey(e => e.IdHocPhan)
                    .HasName("PK_TBLHOCPHAN");

                entity.ToTable("HocPhan");

                entity.Property(e => e.IdHocPhan).HasColumnName("idHocPhan").ValueGeneratedOnAdd();

                entity.Property(e => e.IdBoMon).HasColumnName("idBoMon");

                entity.Property(e => e.IdKhoa).HasColumnName("idKhoa");

                entity.Property(e => e.IdLoaiHocPhan).HasColumnName("idLoaiHocPhan");

                entity.Property(e => e.IdTrinhDo).HasColumnName("idTrinhDo");

                entity.Property(e => e.MaHocPhan)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.TenHocPhan)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.DangLyThuyet)
                 .HasMaxLength(100); 
                entity.Property(e => e.DangThucHanh)
                  .IsRequired()
                  .HasMaxLength(100);
                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdBoMonNavigation)
                    .WithMany(p => p.HocPhans)
                    .HasForeignKey(d => d.IdBoMon)
                    .HasConstraintName("tblHocPhan_fk0");

                entity.HasOne(d => d.IdKhoaNavigation)
                   .WithMany(p => p.HocPhans)
                   .HasForeignKey(d => d.IdKhoa)
                   .HasConstraintName("tblKhoa_fk0");

                entity.HasOne(d => d.IdHinhThucThiNavigation)
                    .WithMany(p => p.HocPhans)
                    .HasForeignKey(d => d.IdHinhThucThi)
                    .HasConstraintName("FK_tblHocPhan_tblHinhThucThi");

                entity.HasOne(d => d.IdLoaiHocPhanNavigation)
                    .WithMany(p => p.HocPhans)
                    .HasForeignKey(d => d.IdLoaiHocPhan)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblHocPhan_tblLoaiHocPhan");

                entity.HasOne(d => d.IdTrinhDoNavigation)
                    .WithMany(p => p.HocPhans)
                    .HasForeignKey(d => d.IdTrinhDo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblHocPhan_tblTrinhDo");
            });

            modelBuilder.Entity<Khoa>(entity =>
            {
                entity.HasKey(e => e.IdKhoa)
                    .HasName("PK_TBLKHOA");

                entity.ToTable("Khoa");

                entity.Property(e => e.IdKhoa)
                    .HasMaxLength(2)
                    .HasColumnName("idKhoa");

                entity.Property(e => e.TenKhoa)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
            });

            modelBuilder.Entity<KhoaHoc>(entity =>
            {
                entity.HasKey(e => e.IdKhoaHoc)
                    .HasName("PK_TBLKHOAHOC");

                entity.ToTable("KhoaHoc");

                entity.Property(e => e.IdKhoaHoc)
                    .ValueGeneratedNever()
                    .HasColumnName("idKhoaHoc");

                entity.Property(e => e.TenKhoaHoc)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");
            });

            modelBuilder.Entity<LoaiCongViec>(entity =>
            {
                entity.HasKey(e => e.IdLoaiCongViec)
                    .HasName("PK_tblLoaiCongViec");

                entity.ToTable("LoaiCongViec");

                entity.Property(e => e.IdLoaiCongViec).HasColumnName("IdLoaiCongViec");

                entity.Property(e => e.TenLoaiCongViec)
                    .HasMaxLength(50)
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<LoaiDeTai>(entity =>
            {
                entity.HasKey(e => e.IdLoaiDeTai)
                    .HasName("PK_tblLoaiDeTai");

                entity.ToTable("LoaiDeTai");

                entity.Property(e => e.IdLoaiDeTai).HasColumnName("idLoaiDeTai");

                entity.Property(e => e.IdHoatDongNckh).HasColumnName("idHoatDongNCKH");

                entity.Property(e => e.TenLoaiDeTai)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdHoatDongNckhNavigation)
                    .WithMany(p => p.LoaiDeTais)
                    .HasForeignKey(d => d.IdHoatDongNckh)
                    .HasConstraintName("FK_tblLoaiDeTai_tblHoatDongNCKH");
            });

            modelBuilder.Entity<LoaiHocPhan>(entity =>
            {
                entity.HasKey(e => e.IdLoaiHocPhan)
                    .HasName("PK_tblLoaiHocPhan");

                entity.ToTable("LoaiHocPhan");

                entity.Property(e => e.IdLoaiHocPhan).HasColumnName("idLoaiHocPhan");

                entity.Property(e => e.TenLoaiHocPhan)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
            });

            modelBuilder.Entity<LoaiQuyDinh>(entity =>
            {
                entity.HasKey(e => e.IdLoaiQuyDinh)
                    .HasName("PK_TBLLOAIQUYDINH");

                entity.ToTable("LoaiQuyDinh");

                entity.Property(e => e.IdLoaiQuyDinh).HasColumnName("idLoaiQuyDinh");

                entity.Property(e => e.TenLoaiQuyDinh)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(true);
            });

                     
            modelBuilder.Entity<NamHoc>(entity =>
            {
                entity.HasKey(e => e.IdNamHoc)
                    .HasName("PK_TBLNAMHOC");

                entity.ToTable("NamHoc");

                entity.Property(e => e.IdNamHoc).HasColumnName("idNamHoc");

                entity.Property(e => e.TenNamHoc)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<NamHocHocKy>(entity =>
            {
                entity.HasKey(e => e.IdNamHocHocKy)
                    .HasName("PK_TBLNAMHOCHOCKY");

                entity.ToTable("NamHocHocKy");

                entity.Property(e => e.IdNamHocHocKy).HasColumnName("idNamHocHocKy");

                entity.Property(e => e.IdHocKy).HasColumnName("idHocKy");

                entity.Property(e => e.IdNamHoc).HasColumnName("idNamHoc");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdHocKyNavigation)
                    .WithMany(p => p.NamHocHocKies)
                    .HasForeignKey(d => d.IdHocKy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNamHocHocKy_fk1");

                entity.HasOne(d => d.IdNamHocNavigation)
                    .WithMany(p => p.NamHocHocKies)
                    .HasForeignKey(d => d.IdNamHoc)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNamHocHocKy_fk0");
            });

            modelBuilder.Entity<NghienCuuKhoaHoc>(entity =>
            {
                entity.HasKey(e => e.IdDeTaiNghienCuuKhoaHoc)
                    .HasName("PK_TBLDETAINGHIENCUUKHOAHOC");

                entity.ToTable("NghienCuuKhoaHoc");

                entity.Property(e => e.IdDeTaiNghienCuuKhoaHoc)
                    .ValueGeneratedNever()
                    .HasColumnName("idDeTaiNghienCuuKhoaHoc");

                entity.Property(e => e.LoaiDeTai)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.SoGioChuan)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.TenDeTai)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianNghiemThu).HasColumnType("date");
            });

            modelBuilder.Entity<NguoiDung>(entity =>
            {
                entity.HasKey(e => e.IdNguoiDung)
                    .HasName("PK_TBLNGUOIDUNG");

                entity.ToTable("NguoiDung");

                entity.Property(e => e.IdNguoiDung)
                    .ValueGeneratedNever()
                    .HasColumnName("idNguoiDung");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.MatKhau)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Sdt)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("SDT");

                entity.Property(e => e.TenNguoiDung)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<NhiemVuBoSung>(entity =>
            {
                entity.HasKey(e => e.IdNhiemVuBoSung)
                    .HasName("PK_TBLPHANCONGNHIEMVUGIAOVIEN");

                entity.ToTable("NhiemVuBoSung");

                entity.Property(e => e.IdNhiemVuBoSung)
                    .ValueGeneratedNever()
                    .HasColumnName("idNhiemVuBoSung");

                entity.Property(e => e.GhiChu)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.IdGiaoVien)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("idGiaoVien");

                entity.Property(e => e.IdNamHocHocKy).HasColumnName("idNamHocHocKy");

                entity.Property(e => e.TenNhiemVu)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdNamHocHocKyNavigation)
                    .WithMany(p => p.NhiemVuBoSungs)
                    .HasForeignKey(d => d.IdNamHocHocKy)
                    .HasConstraintName("FK_tblNhiemVuBoSung_tblNamHocHocKy");
            });

            modelBuilder.Entity<PhanCongCoiHoiThi>(entity =>
            {
                entity.HasKey(e => e.IdPhanCongCoiHoiThi)
                    .HasName("PK_TBLNHIEMVUCOIHOITHI");

                entity.ToTable("PhanCongCoiHoiThi");

                entity.Property(e => e.IdPhanCongCoiHoiThi)
                    .ValueGeneratedNever()
                    .HasColumnName("idPhanCongCoiHoiThi");

                entity.Property(e => e.GhiChu).HasMaxLength(50);

                entity.Property(e => e.IdBaoGioGiangDayChiTiet).HasColumnName("idBaoGioGiangDayChiTiet");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.Property(e => e.IdNamHocHocKy).HasColumnName("idNamHocHocKy");

               

                entity.HasOne(d => d.IdBaoGioGiangDayChiTiet1)
                    .WithMany(p => p.PhanCongCoiHoiThis)
                    .HasForeignKey(d => d.IdBaoGioGiangDayChiTiet)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PhanCongCoiHoiThi_BaoGioGiangDayChiTiet1");

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.PhanCongCoiHoiThis)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PhanCongCoiHoiThi_GiaoVien");
            });
            modelBuilder.Entity<PhanCongDayTrungTam>(entity =>
            {
                entity.HasKey(e => e.IdPhanCongDayTrungTam)
                    .HasName("PK_TBLNHIEMVUDAYTRUNGTAM");

                entity.ToTable("PhanCongDayTrungTam");

                entity.Property(e => e.IdPhanCongDayTrungTam)
                    .ValueGeneratedNever()
                    .HasColumnName("idPhanCongDayTrungTam");

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.IdBaoGioTrungTamChiTiet).HasColumnName("idBaoGioTrungTamChiTiet");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.HasOne(d => d.IdBaoGioTrungTamChiTietNavigation)
                    .WithMany(p => p.PhanCongDayTrungTams)
                    .HasForeignKey(d => d.IdBaoGioTrungTamChiTiet)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNhiemVuDayTrungTam_fk1");

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.PhanCongDayTrungTams)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNhiemVuDayTrungTam_fk0");
            });

            modelBuilder.Entity<PhanCongGiangDay>(entity =>
            {
                entity.HasKey(e => e.IdPhanCongGiangDay)
                    .HasName("PK_TBLNHIEMVUGIANGDAY");

                entity.ToTable("PhanCongGiangDay");

                entity.Property(e => e.IdPhanCongGiangDay).ValueGeneratedOnAdd();

                entity.Property(e => e.GhiChu).HasMaxLength(100);

                entity.Property(e => e.IdBaoGioGiangDayChiTiet).HasColumnName("idBaoGioGiangDayChiTiet");

                entity.Property(e => e.IdGiaoVien).HasColumnName("idGiaoVien");

                entity.Property(e => e.IdNamHocHocKy).HasColumnName("idNamHocHocKy");
                entity.Property(e => e.SoGioHoacTuanHoacSoNguoi).HasColumnName("SoGioHoacTuanHoacSoNguoi").HasColumnType("float");


                entity.HasOne(d => d.IdBaoGioGiangDayChiTietNavigation)
                    .WithMany(p => p.PhanCongGiangDays)
                    .HasForeignKey(d => d.IdBaoGioGiangDayChiTiet)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNhiemVuGiangDay_fk0");

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.PhanCongGiangDays)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNhiemVuGiangDay_fk1");
            });

            modelBuilder.Entity<NhiemVuKhoaHoc>(entity =>
            {
                entity.HasKey(e => e.IdNhiemVuKhoaHoc)
                    .HasName("PK_tblNhiemVuKhoaHoc_1");

                entity.ToTable("NhiemVuKhoaHoc");

                entity.Property(e => e.IdNhiemVuKhoaHoc).HasColumnName("idNhiemVuKhoaHoc");

                entity.Property(e => e.IdNamHocHocKy).HasColumnName("idNamHocHocKy");

                entity.Property(e => e.IdThanhVienDeTai).HasColumnName("idThanhVienDeTai");

                entity.HasOne(d => d.IdThanhVienDeTaiNavigation)
                    .WithMany(p => p.NhiemVuKhoaHocs)
                    .HasForeignKey(d => d.IdThanhVienDeTai)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblNhiemVuKhoaHoc_tblNghienCuuKhoaHocChiTiet");
            });

            modelBuilder.Entity<PhanQuyen>(entity =>
            {
                entity.HasKey(e => e.IdPhanQuyen)
                    .HasName("PK_TBLPHANQUYEN");

                entity.ToTable("PhanQuyen");

                entity.Property(e => e.IdPhanQuyen)
                    .ValueGeneratedNever()
                    .HasColumnName("idPhanQuyen");

                entity.Property(e => e.TenPhanQuyen)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PhanQuyenChiTiet>(entity =>
            {
                entity.HasKey(e => e.IdPhanQuyenChiTiet)
                    .HasName("PK_TBLPHANQUYENCHITIET");

                entity.ToTable("PhanQuyenChiTiet");

                entity.Property(e => e.IdPhanQuyenChiTiet)
                    .ValueGeneratedNever()
                    .HasColumnName("idPhanQuyenChiTiet");

                entity.Property(e => e.IdPhanQuyen).HasColumnName("idPhanQuyen");

                entity.Property(e => e.Quyen)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdPhanQuyenNavigation)
                    .WithMany(p => p.PhanQuyenChiTiets)
                    .HasForeignKey(d => d.IdPhanQuyen)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblPhanQuyenChiTiet_fk0");
            });

            modelBuilder.Entity<PhanQuyenNguoiDung>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("PhanQuyenNguoiDung");

                entity.Property(e => e.IdNguoiDung).HasColumnName("idNguoiDung");

                entity.Property(e => e.IdPhanQuyen).HasColumnName("idPhanQuyen");

                entity.HasOne(d => d.IdNguoiDungNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdNguoiDung)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblPhanQuyenNguoiDung_tblNguoiDung");

                entity.HasOne(d => d.IdPhanQuyenNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdPhanQuyen)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblPhanQuyenNguoiDung_fk1");
            });

            modelBuilder.Entity<PhongTrungTam>(entity =>
            {
                entity.HasKey(e => e.IdPhongTrungTam)
                    .HasName("PK_tblPhongTrungTam");

                entity.ToTable("PhongTrungTam");

                entity.Property(e => e.IdPhongTrungTam).HasColumnName("idPhongTrungTam");

                entity.Property(e => e.TenPhongTrungTam)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
            });

            modelBuilder.Entity<QuyDinh>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinh)
                    .HasName("PK_TBLQUYDINH");

                entity.ToTable("QuyDinh");

                entity.Property(e => e.IdQuyDinh).HasColumnName("idQuyDinh");

                entity.Property(e => e.IdLoaiQuyDinh).HasColumnName("idLoaiQuyDinh");
                entity.Property(e=>e.TenQuyDinh).HasColumnName("TenQuyDinh");

                entity.HasOne(d => d.IdLoaiQuyDinhNavigation)
                    .WithMany(p => p.QuyDinhs)
                    .HasForeignKey(d => d.IdLoaiQuyDinh)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblQuyDinh_fk0");
            });

            modelBuilder.Entity<QuyDinhGioChuanChamThiLyThuyet>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhGioChuanChamThiLyThuyet)
                    .HasName("PK_tblQuyDinhGioChuanChamThiLyThuyet");

                entity.ToTable("QuyDinhGioChuanChamThiLyThuyet");

                entity.Property(e => e.IdQuyDinhGioChuanChamThiLyThuyet).HasColumnName("idQuyDinhGioChuanChamThiLyThuyet");

                entity.Property(e => e.IdHinhThucThi).HasColumnName("idHinhThucThi");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
            });

            modelBuilder.Entity<QuyDinhGioChuanCoiThiLyThuyet>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhGioChuanCoiThiLyThuyet)
                    .HasName("PK_tblQuyDinhGioChuanCoiThiLyThuyet");

                entity.ToTable("QuyDinhGioChuanCoiThiLyThuyet");

                entity.Property(e => e.IdQuyDinhGioChuanCoiThiLyThuyet).HasColumnName("idQuyDinhGioChuanCoiThiLyThuyet");

                entity.Property(e => e.IdHinhThucThi).HasColumnName("idHinhThucThi");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdHinhThucThiNavigation)
                    .WithMany(p => p.QuyDinhGioChuanCoiThiLyThuyets)
                    .HasForeignKey(d => d.IdHinhThucThi)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblQuyDinhGioChuanCoiThiLyThuyet_tblHinhThucThi");
            });

            modelBuilder.Entity<QuyDinhGioChuanRaDe>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhGioChuanRaDe)
                    .HasName("PK_tblQuyDinhGioChuanRaDe");

                entity.ToTable("QuyDinhGioChuanRaDe");

                entity.Property(e => e.IdQuyDinhGioChuanRaDe).HasColumnName("idQuyDinhGioChuanRaDe");

                entity.Property(e => e.IdHinhThuThi).HasColumnName("idHinhThuThi");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdHinhThuThiNavigation)
                    .WithMany(p => p.QuyDinhGioChuanRaDes)
                    .HasForeignKey(d => d.IdHinhThuThi)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblQuyDinhGioChuanRaDe_tblHinhThucThi");
            });

            modelBuilder.Entity<QuyDinhGioChuanThucHanh>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhGioChuanThucHanh)
                    .HasName("PK_tblGioChuanThucHanh");

                entity.ToTable("QuyDinhGioChuanThucHanh");

                entity.Property(e => e.IdQuyDinhGioChuanThucHanh).HasColumnName("idQuyDinhGioChuanThucHanh");

                entity.Property(e => e.IdKhoa)
                    .IsRequired()
                    .HasMaxLength(2)
                    .HasColumnName("idKhoa");

                entity.Property(e => e.TenNoiDungGiangDay)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.SoGioChuan).HasColumnType("float");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdKhoaNavigation)
                    .WithMany(p => p.QuyDinhGioChuanThucHanhs)
                    .HasForeignKey(d => d.IdKhoa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_QuyDinhGioChuanThucHanh_Khoa");

              
            });

            modelBuilder.Entity<QuyDinhGioChuanThucHanhBoSung>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhGioChuanThucHanhBoSung)
                    .HasName("PK_tblQuyDinhGioChuanThucHanhBoSung");

                entity.ToTable("QuyDinhGioChuanThucHanhBoSung");

                entity.Property(e => e.IdQuyDinhGioChuanThucHanhBoSung).HasColumnName("idQuyDinhGioChuanThucHanhBoSung");

                entity.Property(e => e.IdKhoa)
                    .IsRequired()
                    .HasMaxLength(2)
                    .HasColumnName("idKhoa");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdKhoaNavigation)
                    .WithMany(p => p.QuyDinhGioChuanThucHanhBoSungs)
                    .HasForeignKey(d => d.IdKhoa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_QuyDinhGioChuanThucHanhBoSung_Khoa");
                              
            });

            modelBuilder.Entity<QuyDinhVeHuongDanDoAn>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhVeHuongDanDoAn)
                    .HasName("PK_tblQuyDinhVeHuongDanDoAn");

                entity.ToTable("QuyDinhVeHuongDanDoAn");

                entity.Property(e => e.IdQuyDinhVeHuongDanDoAn).HasColumnName("idQuyDinhVeHuongDanDoAn");


                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

            });

            modelBuilder.Entity<ThanhVienDeTai>(entity =>
            {
                entity.HasKey(e => e.IdThanhVienDeTai)
                    .HasName("PK_TBLNHIEMVUKHOAHOC");

                entity.ToTable("ThanhVienDeTai");

                entity.Property(e => e.IdThanhVienDeTai).HasColumnName("idThanhVienDeTai");

                entity.Property(e => e.HoTen).HasMaxLength(50);

                entity.Property(e => e.IdDeTaiNghienCuuKhoaHoc).HasColumnName("idDeTaiNghienCuuKhoaHoc");

                entity.Property(e => e.IdGiaoVien)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("idGiaoVien");

                entity.HasOne(d => d.IdDeTaiNghienCuuKhoaHocNavigation)
                    .WithMany(p => p.ThanhVienDeTais)
                    .HasForeignKey(d => d.IdDeTaiNghienCuuKhoaHoc)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNhiemVuKhoaHoc_fk2");

                entity.HasOne(d => d.IdGiaoVienNavigation)
                    .WithMany(p => p.ThanhVienDeTais)
                    .HasForeignKey(d => d.IdGiaoVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblNhiemVuKhoaHoc_fk0");
            });

            modelBuilder.Entity<ThongKeSinhVienThuocKhoa>(entity =>
            {
                entity.HasKey(e => e.IdThongKeSinhVienThuocKhoa)
                    .HasName("PK_TBLTHONGKESINHVIENTHUOCKHOA");

                entity.ToTable("ThongKeSinhVienThuocKhoa");

                entity.Property(e => e.IdThongKeSinhVienThuocKhoa)
                    .ValueGeneratedNever()
                    .HasColumnName("idThongKeSinhVienThuocKhoa");

                entity.Property(e => e.IdKhoa).HasColumnName("idKhoa");

                entity.Property(e => e.IdNamHocHocKy).HasColumnName("idNamHocHocKy");

                entity.HasOne(d => d.IdNamHocHocKyNavigation)
                    .WithMany(p => p.ThongKeSinhVienThuocKhoas)
                    .HasForeignKey(d => d.IdNamHocHocKy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("tblThongKeSinhVienThuocKhoa_fk1");
            });
            modelBuilder.Entity<MienGiamTheoTrangThaiLamViec>(entity =>
            {
                entity.HasKey(e => e.IdMienGiamTheoTrangThaiLamViec);

                entity.ToTable("MienGiamTheoTrangThaiLamViec");

                entity.Property(e => e.IdMienGiamTheoTrangThaiLamViec).HasColumnName("idMienGiamTheoTrangThaiLamViec").ValueGeneratedOnAdd();
                entity.Property(e => e.GiaTri).HasColumnType("float");

                entity.Property(e => e.IdTrangThaiLamViec).HasColumnName("idTrangThaiLamViec");

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");

                entity.HasOne(d => d.IdTrangThaiLamViecNavigation)
                    .WithMany(p => p.MienGiamTheoTrangThaiLamViecs)
                    .HasForeignKey(d => d.IdTrangThaiLamViec)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MienGiamTheoTrangThaiGiaoVien_TrangThaiLamViecGiaoVien");
            });

            modelBuilder.Entity<TinhGioTrungTam>(entity =>
            {
                entity.HasKey(e => e.IdTinhGioTrungTam)
                    .HasName("PK_tblTinhGioTrungTam");

                entity.ToTable("TinhGioTrungTam");

                entity.Property(e => e.IdTinhGioTrungTam).HasColumnName("idTinhGioTrungTam");

                entity.Property(e => e.IdNamHocHocKy).HasColumnName("idNamHocHocKy");

                entity.Property(e => e.IdNhiemVuDayTrungTam).HasColumnName("idNhiemVuDayTrungTam");

                entity.HasOne(d => d.IdNamHocHocKyNavigation)
                    .WithMany(p => p.TinhGioTrungTams)
                    .HasForeignKey(d => d.IdNamHocHocKy)
                    .HasConstraintName("FK_tblTinhGioTrungTam_tblNamHocHocKy");

                entity.HasOne(d => d.IdNhiemVuDayTrungTamNavigation)
                    .WithMany(p => p.TinhGioTrungTams)
                    .HasForeignKey(d => d.IdNhiemVuDayTrungTam)
                    .HasConstraintName("FK_tblTinhGioTrungTam_tblNhiemVuDayTrungTam");
            });
            modelBuilder.Entity<QuyDinhSiSoLopHocPhan>(entity =>
            {
                entity.HasKey(e => e.IdQuyDinhSiSoLopHocPhan)
                    .HasName("PK_QuyDinhSiSoLopHocPhanLyThuyet");

                entity.ToTable("QuyDinhSiSoLopHocPhan");

                entity.Property(e => e.IdQuyDinhSiSoLopHocPhan).HasColumnName("IdQuyDinhSiSoLopHocPhanLyThuyet");

                entity.Property(e => e.DangHocPhan)
                    .IsRequired()
                    .HasMaxLength(100);
                entity.Property(e => e.HeSoSiSo).HasColumnName("HeSoSiSo").HasColumnType("float");
                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
            });
            modelBuilder.Entity<TrinhDo>(entity =>
            {
                entity.HasKey(e => e.IdTrinhDo)
                    .HasName("PK_tblTrinhDo");

                entity.ToTable("TrinhDo");

                entity.Property(e => e.IdTrinhDo).HasColumnName("idTrinhDo");

                entity.Property(e => e.TenTrinhDo)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ThoiGianBatDau).HasColumnType("date");

                entity.Property(e => e.ThoiGianKetThuc).HasColumnType("date");
            });
            
            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

       
    }
}
