using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Web_GiupViecNha.Areas.Admin.Models
{
    public  class TaiKhoanModel
    {
        string email, matkhau;
        [Required(ErrorMessage=("*Không được bỏ trống mật khẩu"))]
        public string Matkhau
        {
            get { return matkhau; }
            set { matkhau = value; }
        }
          [Required(ErrorMessage = ("*Không được bỏ trống Email"))]
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
       
   



    }
}