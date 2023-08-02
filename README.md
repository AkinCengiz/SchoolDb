# OKUL VERİTABANI TASARIMI 

Bu çalışmada MsSQL üzerinde örnek bir veritabanı tasarladım. Tasarımı yaparken büyük ölçüde normalizasyon kurallarına uyarak zamanla daha iyilerini yapmak üzere güzel bir başlangıç yapmak istedim. 

İlk olarak Persons adında kişi bilgilerini tutabileceğim bir tabloyla başladım. Bu tabloda bütün bireylerde ortk olarak bulunan isim,soyisim, kimlik no, doğum tarihi gibi bilgileri tutmayı amaçladım. Devamında Students ve Teachers tabloları oluşturarak Persons tablosu ile bire bir ilişki kurarak bir nevi bu tabloları Persons tablosundan miras aldım.


![Persons](file:///C:/Users/akinc/Pictures/Screenshots/Persons.png)

![Teachers](file:///C:/Users/akinc/Pictures/Screenshots/Teachers.png)

![Students](file:///C:/Users/akinc/Pictures/Screenshots/Students.png)

>Tablo Yapıları yukarıda gösterilmiştir.

Daha sonra kişilere (Öğretmen ve Öğrenci) özel bilgileri Persons tablosundan miras alan öğretman ve öğrencilerin ortak olarak kullanabilecği bilgiler olan adres, telefon, sınıf, email, ders tabloları, öğretmenlere özel branş ve görev tabloları ile öğrencilere ait notlar tablolarını oluşturdum.

Addresses tablosunda tekrar eden alanlar (Şehir, İlçe, Mahalle) alanlar için ayrı ayrı tablolar oluşturarak Addresses tablosuyla ilişkilendirdim.

Teachers, Students, Lessons, Classrooms ve Notes tablolarını ilişki türlerine göre bire çok ya da çoka çok (ara tablo yapılarını oluşturarak) ilişkilendirerek yapıyı tamamladım.


Tasarımın ardından istediğim şekilde verileri görüntüleyebilmek için view sorguları ve tablolar üzerinde insert, update, delete işlemlerini yapabileceğim procedure sorguları oluşturarak kaydettim. 

```sql
create view GetPersonAddresses as
select p.FirstName + ' ' + p.LastName as [Ad Soyad], p.IdentityNumber as [Kimlik No],p.Birtday as [Doğum Tarihi], p.PlaceOfBirth as [Doğum Yeri], p.MotherName as [Anne Adı], p.FatherName as [Baba Adı], d.Name as Semt,n.Name as Mahalle, a.Street as [Cadde - Sokak], a.BuildingNumber as [Bina No], a.Floor as Kat, a.Apartment as [Daire No], t.Name as İlçe, c.Name as Şehir from Persons as p inner join AddressAndPersons as ap
on p.Id=ap.PersonId inner join Addresses as a
on ap.AddressId=a.Id inner join Cities as c
on a.CityId=c.Id inner join Towns as t
on a.TownId=t.Id inner join Districts as d
on a.DistrictId=d.Id inner join Neighbourhoods as n
on a.NeighbourhoodId=n.Id
```
>Örnek view sorgusu

```sql
create procedure AddStudent @firstName varchar(50),@lastName varchar(50),@identityNumber char(11),@birthDay datetime, @placeOfBirth varchar(50),@motherName varchar(50), @fatherName varchar(50)
as
begin
declare @personId int
declare @isActive bit
insert into Persons values(@firstName,@lastName,@identityNumber,@birthDay,@placeOfBirth,@motherName,@fatherName)
set @personId = (select top 1 Id from Persons order by Id desc)
set @isActive='1'
insert into Students values (@personId,@isActive)
end
```
>Örnek procedure sorgusu

Son olarak kurulan ilişkilerden sonra tablo diagramı![Diagram](file:///C:/Users/akinc/Pictures/Screenshots/sql-odev.png)

>Veritabanına ait diagram


