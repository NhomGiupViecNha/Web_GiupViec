using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web_GiupViecNha.Models
{
    public class DangKi
    {

        [Display(Name = "Họ Tên")]
        [Required(ErrorMessage = "*Vui lòng nhập họ tên")]
    
        public string TenKH { get; set; }
        [Display(Name = "Email")]
        [Required(ErrorMessage = "*Vui lòng nhập Email đăng nhập")]
   
        public string Email { get; set; }
        [Display(Name = "Số điện thoại")]
        [Phone(ErrorMessage="Vui lòng nhập đúng số điện thoại")]
        [Required(ErrorMessage = "*Vui lòng nhập số điện thoại")]
        [DataType(DataType.PhoneNumber)]
    
        public string SDT { get; set; }
        [Display(Name = "Địa chỉ")]
       
        [Required(ErrorMessage = "*Vui lòng nhập địa chỉ")]
        public string DiaChi { get; set; }

        [Display(Name = "Mật Khẩu")]
        [StringLength(16,ErrorMessage="Mật khẩu tối đa 16 kí tự")]
        [Required(ErrorMessage = "*Vui lòng nhập mật khẩu")]
        public string MatKhau { get; set; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("MatKhau", ErrorMessage = "Phải trùng với mật khẩu!")]
        [Required(ErrorMessage = "*Vui lòng nhập mật khẩu xác nhận")]
        public string XacNhanMK { get; set; }
    }
}