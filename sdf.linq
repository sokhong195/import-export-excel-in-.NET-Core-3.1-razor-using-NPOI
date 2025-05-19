<Query Kind="Expression">
  <Connection>
    <ID>72018a0d-e057-4c1d-825e-3a6f69c117ab</ID>
    <NamingServiceVersion>2</NamingServiceVersion>
    <Persist>true</Persist>
    <Server>.</Server>
    <DeferDatabasePopulation>true</DeferDatabasePopulation>
    <Database>dbPhanCongThanhToan</Database>
  </Connection>
</Query>

GiaoViens.Join(PhanCongGiangDays,gv=>gv.IdGiaoVien,pcgd=>pcgd.IdGiaoVien,(gv,pcgd)=> new{
gv =gv
}).Where(gv => gv.gv.IdGiaoVien==810)

