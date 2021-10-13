using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web_GiupViecNha.Areas.Admin.Models
{
    public class DichVuModels
    {
        public DichVuModels()
        {


        }

        public DichVuModels(DichVu dv)
        {
            this.madv = dv.MaDichVu;
            this.tendv = dv.TenDichVu;
            this.mota = dv.MoTa;
            this.giathanh = (int)dv.GiaThanh;
            this.hinhanh = dv.HinhAnh;
            this.donvitinh = dv.DonViTinh;
            this.kinhnghiemyeucau = dv.KinhNghiemYeuCau;
            this.loaidv = dv.LoaiDV;

        }

        string madv, tendv, mota, donvitinh, hinhanh, kinhnghiemyeucau, loaidv;

        public string Loaidv
        {
            get { return loaidv; }
            set { loaidv = value; }
        }

        public string Kinhnghiemyeucau
        {
            get { return kinhnghiemyeucau; }
            set { kinhnghiemyeucau = value; }
        }

        public string Hinhanh
        {
            get { return hinhanh; }
            set { hinhanh = value; }
        }
        [Required]
        public string Donvitinh
        {
            get { return donvitinh; }
            set { donvitinh = value; }
        }

        public string Mota
        {
            get { return mota; }
            set { mota = value; }
        }
      
        [Required(ErrorMessage="Bạn chưa nhập tên dịch vụ")]
        public string Tendv
        {
            get { return tendv; }
            set { tendv = value; }
        }
        [Required]
        public string Madv
        {
            get { return madv; }
            set { madv = value; }
        }
        int giathanh;
        [Required]
        public int Giathanh
        {
            get { return giathanh; }
            set { giathanh = value; }
        }
    }
}