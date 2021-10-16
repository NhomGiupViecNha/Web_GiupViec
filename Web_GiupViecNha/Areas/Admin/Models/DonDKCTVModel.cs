using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web_GiupViecNha.Areas.Admin.Models
{
    public class DonDKCTVModel
    {
        public DonDKCTVModel()
        { }
        public DonDKCTVModel(DonDangKyCTV ddk)
        {
            this.Madon = ddk.MaDon;
            this.Hoten = ddk.HoTen;
            this.Ketquakt = ddk.DiemKiemTra.ToString();
            this.Kinhnghiem = ddk.KinhNghiem;
            this.Ngaysinh = (DateTime)ddk.NgaySInh;
            this.Sdt = ddk.SDT;
            this.Diachi = ddk.DiaChi;
            this.Email = ddk.Email;
            this.Trangthaiduyet = ddk.TrangThaiDuyet;
            this.Trinhdohv = ddk.TrinhDoHocVan;


        }

        string madon, hoten, diachi, sdt, email, trinhdohv, kinhnghiem, trangthaiduyet;

        public string Trangthaiduyet
        {
            get { return trangthaiduyet; }
            set { trangthaiduyet = value; }
        }

        public string Kinhnghiem
        {
            get { return kinhnghiem; }
            set { kinhnghiem = value; }
        }

        public string Trinhdohv
        {
            get { return trinhdohv; }
            set { trinhdohv = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Sdt
        {
            get { return sdt; }
            set { sdt = value; }
        }

        public string Diachi
        {
            get { return diachi; }
            set { diachi = value; }
        }

        public string Hoten
        {
            get { return hoten; }
            set { hoten = value; }
        }

        public string Madon
        {
            get { return madon; }
            set { madon = value; }
        }
        DateTime ngaysinh;

        public DateTime Ngaysinh
        {
            get { return ngaysinh; }
            set { ngaysinh = value; }
        }
        string ketquakt;


        [Required(ErrorMessage="Vui lòng nhập kết quả ctv ")]
        public string Ketquakt
        {
            get { return ketquakt; }
            set { ketquakt = value; }
        }

    }
}