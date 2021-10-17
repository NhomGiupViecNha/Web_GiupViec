using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_GiupViecNha.Areas.Admin.Models
{
    public class CongTacVienModel
    {
        public CongTacVienModel()
        {

        }

        public CongTacVienModel(DonDangKyCTV ddk)
        {
            this.Tenctv = ddk.HoTen;
            this.Ngaysinh = (DateTime)ddk.NgaySInh;
            this.Sdt = ddk.SDT;
            this.Trinhdo = ddk.TrinhDoHocVan;
            this.Kinhnghiem = ddk.KinhNghiem;
            this.Email = ddk.Email;
            this.Diachi = ddk.DiaChi;
            

        }

        string mactv, tenctv, diachi, sdt, email, matkhau, trinhdo, kinhnghiem;

        public string Kinhnghiem
        {
            get { return kinhnghiem; }
            set { kinhnghiem = value; }
        }

        public string Trinhdo
        {
            get { return trinhdo; }
            set { trinhdo = value; }
        }

        public string Matkhau
        {
            get { return matkhau; }
            set { matkhau = value; }
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

        public string Tenctv
        {
            get { return tenctv; }
            set { tenctv = value; }
        }

        public string Mactv
        {
            get { return mactv; }
            set { mactv = value; }
        }
        float diemdanhgia;

        public float Diemdanhgia
        {
            get { return diemdanhgia; }
            set { diemdanhgia = value; }
        }
        DateTime ngaysinh;

        public DateTime Ngaysinh
        {
            get { return ngaysinh; }
            set { ngaysinh = value; }
        }
         

    }
}