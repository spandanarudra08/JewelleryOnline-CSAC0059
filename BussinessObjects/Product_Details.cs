//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BussinessObjects
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product_Details
    {
        public int Product_Id { get; set; }
        public Nullable<int> Brand_Id { get; set; }
        public string Product_Name { get; set; }
        public string Sales_Price { get; set; }
        public string Available_Qty { get; set; }
    
        public virtual Brand_Details Brand_Details { get; set; }
    }
}