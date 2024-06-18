//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Kindergarten_app.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kid
    {
        public Kid()
        {
            this.PrivateLessons = new HashSet<PrivateLessons>();
            this.Visits = new HashSet<Visits>();
        }
    
        public int Id { get; set; }
        public string First_name { get; set; }
        public string Last_name { get; set; }
        public string Patronimyc { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public int ParentId { get; set; }
        public int GroupId { get; set; }
        public string MedicalDescription { get; set; }
        public string Description { get; set; }
        public bool IsValid { get; set; }
        public int Gender { get; set; }
        public byte[] Photo { get; set; }
    
        public virtual Genders Genders { get; set; }
        public virtual KidGroups KidGroups { get; set; }
        public virtual Parent Parent { get; set; }
        public virtual ICollection<PrivateLessons> PrivateLessons { get; set; }
        public virtual ICollection<Visits> Visits { get; set; }
    }
}
