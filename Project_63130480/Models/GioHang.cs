//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project_63130480.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class GioHang
    {
        public string MaSP { get; set; }
        public string MaKH { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string DiaChi { get; set; }
    
        public virtual KhachHang KhachHang { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}