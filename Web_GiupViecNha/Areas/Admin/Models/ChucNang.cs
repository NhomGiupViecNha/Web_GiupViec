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
    
    public partial class ChucNang
    {
        public ChucNang()
        {
            this.PhanQuyenND = new HashSet<PhanQuyenND>();
        }
    
        public string MaChucNang { get; set; }
        public string TenChucNang { get; set; }
    
        public virtual ICollection<PhanQuyenND> PhanQuyenND { get; set; }
    }
}