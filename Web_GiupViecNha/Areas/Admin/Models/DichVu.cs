﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Web_GiupViecNha.Areas.Admin.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class DichVu
    {
        public DichVu()
        {
            this.DonDatDV = new HashSet<DonDatDV>();
            this.PhieuUuDai = new HashSet<PhieuUuDai>();
        }


        public string MaDichVu { get; set; }
        [Required(ErrorMessage = "*Bạn chưa nhập tên dịch vụ")]
        public string TenDichVu { get; set; }
        [Required(ErrorMessage = "*Bạn chưa nhập mô tả dịch vụ")]
        public string MoTa { get; set; }
        [Required(ErrorMessage = "*Bạn chưa nhập đơn vị tính")]
        public string DonViTinh { get; set; }
        [Required(ErrorMessage = "*Bạn chưa nhập giá dịch vụ")]
        public Nullable<int> GiaThanh { get; set; }
        public string KinhNghiemYeuCau { get; set; }
        public string HinhAnh { get; set; }
        public string LoaiDV { get; set; }
    
        public virtual LoaiDV LoaiDV1 { get; set; }
        public virtual ICollection<DonDatDV> DonDatDV { get; set; }
        public virtual ICollection<PhieuUuDai> PhieuUuDai { get; set; }
    }
}
