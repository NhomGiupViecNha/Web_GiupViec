//------------------------------------------------------------------------------
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
    
    public partial class ChiTietThongKe
    {
        public string MaThongKe { get; set; }
        public string MaDonDat { get; set; }
        public Nullable<int> ThanhTien { get; set; }
    
        public virtual DonDatDV DonDatDV { get; set; }
        public virtual ThongKe ThongKe { get; set; }
    }
}
