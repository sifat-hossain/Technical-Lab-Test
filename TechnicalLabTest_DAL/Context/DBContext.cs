using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using TechnicalLabTest_DAL.Model;

#nullable disable

namespace TechnicalLabTest_DAL.Context
{
    public partial class DBContext : DbContext
    {
        public DBContext()
        {
        }

        public DBContext(DbContextOptions<DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Building> Buildings { get; set; }
        public virtual DbSet<DataField> DataFields { get; set; }
        public virtual DbSet<Model.Object> Objects { get; set; }
        public virtual DbSet<Reading> Readings { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseSqlServer("Data Source=DESKTOP-PPNI8E1\\SQL;Initial Catalog=TechnicalLabTestDB;user id=sa;password=sifat123;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Building>(entity =>
            {
                entity.ToTable("Building");

                entity.Property(e => e.Location)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<DataField>(entity =>
            {
                entity.ToTable("DataField");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Model.Object>(entity =>
            {
                entity.ToTable("Object");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Reading>(entity =>
            {
                entity.ToTable("Reading");

                entity.Property(e => e.Timestamp).HasColumnType("datetime");

                entity.Property(e => e.Value).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Building)
                    .WithMany(p => p.Readings)
                    .HasForeignKey(d => d.BuildingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reading_Building");

                entity.HasOne(d => d.DataField)
                    .WithMany(p => p.Readings)
                    .HasForeignKey(d => d.DataFieldId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reading_DataField");

                entity.HasOne(d => d.Object)
                    .WithMany(p => p.Readings)
                    .HasForeignKey(d => d.ObjectId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Reading_Object");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
