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
    
    public partial class EducationTypes
    {
        public EducationTypes()
        {
            this.PrivateLessons = new HashSet<PrivateLessons>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<PrivateLessons> PrivateLessons { get; set; }
    }
}