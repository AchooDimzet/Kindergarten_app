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
    
    public partial class PrivateLessons
    {
        public int Id { get; set; }
        public System.DateTime Date { get; set; }
        public int EducationTypeId { get; set; }
        public int KidId { get; set; }
        public int WorkerId { get; set; }
        public string Price { get; set; }
        public string Description { get; set; }
        public bool IsValid { get; set; }
    
        public virtual EducationTypes EducationTypes { get; set; }
        public virtual Kid Kid { get; set; }
        public virtual Workers Workers { get; set; }
    }
}
