﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Kindergarten_dbEntities : DbContext
    {
        public Kindergarten_dbEntities()
            : base("name=Kindergarten_dbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<EducationTypes> EducationTypes { get; set; }
        public DbSet<Genders> Genders { get; set; }
        public DbSet<Kid> Kid { get; set; }
        public DbSet<KidGroups> KidGroups { get; set; }
        public DbSet<Parent> Parent { get; set; }
        public DbSet<PrivateLessons> PrivateLessons { get; set; }
        public DbSet<Roles> Roles { get; set; }
        public DbSet<sysdiagrams> sysdiagrams { get; set; }
        public DbSet<Visits> Visits { get; set; }
        public DbSet<Workers> Workers { get; set; }
    }
}
