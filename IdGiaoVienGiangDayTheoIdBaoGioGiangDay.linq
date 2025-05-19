<Query Kind="Expression">
  <Connection>
    <ID>72018a0d-e057-4c1d-825e-3a6f69c117ab</ID>
    <NamingServiceVersion>2</NamingServiceVersion>
    <Persist>true</Persist>
    <Server>.</Server>
    <DeferDatabasePopulation>true</DeferDatabasePopulation>
    <Database>dbPhanCongThanhToan</Database>
  </Connection>
  <Output>DataGrids</Output>
</Query>

from gv in GiaoViens
join gvct in GiaoVienChiTiets on gv.IdGiaoVien equals gvct.IdGiaoVien
join pcgd in PhanCongGiangDays on gv.IdGiaoVien equals pcgd.IdGiaoVien
join bggdct in BaoGioGiangDayChiTiets on pcgd.IdBaoGioGiangDayChiTiet equals bggdct.IdBaoGioGiangDayChiTiet
where gvct.IdBoMon == 141  && bggdct.IdBaoGioGiangDay == 6 && gv.IdGiaoVien == 810
select gv