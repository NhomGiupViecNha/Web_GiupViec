using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Web_GiupViecNha.Areas.Admin.Models;

namespace Web_GiupViecNha.Models
{
    public class XuLy
    {
        GiupViecNhaDBEntities data = new GiupViecNhaDBEntities();
        string email, matkhau;
       
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

        public bool CheckEmail(string email)
        {
            return data.KhachHang.Count(x => x.Email == email) > 0;
        }
     
        public KhachHang dangnhap(string _sdt, string _pass)
        {
            return data.KhachHang.FirstOrDefault(n => n.SDT == _sdt && n.MatKhau == _pass);
        }
     
        public string sinhMaKHTuDong()
        {
            string makh = "";
            int flag = data.KhachHang.Count() + 1;

            for (int i = 1; i <= data.KhachHang.Count(); i++)
            {
                if (flag > 9)
                {
                    makh = "KH";

                }
                else makh = "KH0";
                string flag2 = makh + flag;
                if (data.KhachHang.Where(m => m.MaKH.Trim() == flag2).Count() == 0)
                {

                    makh += flag;

                }
                else
                {
                    flag++;
                    makh += flag;
                }

            }
            return makh;

        }
    }
}