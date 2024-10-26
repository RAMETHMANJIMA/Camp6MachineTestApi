using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Camp6MachineTestAPI.Models;

public partial class Camp6MachineTestContext : DbContext
{
    public Camp6MachineTestContext()
    {
    }

    public Camp6MachineTestContext(DbContextOptions<Camp6MachineTestContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BackgroundVerification> BackgroundVerifications { get; set; }

    public virtual DbSet<Feedback> Feedbacks { get; set; }

    public virtual DbSet<Help> Helps { get; set; }

    public virtual DbSet<Loan> Loans { get; set; }

    public virtual DbSet<LoanVerification> LoanVerifications { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source =.; Initial Catalog = Camp6MachineTest; Integrated Security = True;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BackgroundVerification>(entity =>
        {
            entity.HasKey(e => e.VerificationId).HasName("PK__Backgrou__306D49273C3972C3");

            entity.ToTable("BackgroundVerification");

            entity.Property(e => e.VerificationId).HasColumnName("VerificationID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LoanId).HasColumnName("LoanID");
            entity.Property(e => e.LoanOfficerId).HasColumnName("LoanOfficerID");
            entity.Property(e => e.Notes).HasColumnType("text");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasDefaultValue("Pending");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Loan).WithMany(p => p.BackgroundVerifications)
                .HasForeignKey(d => d.LoanId)
                .HasConstraintName("FK__Backgroun__LoanI__4D94879B");

            entity.HasOne(d => d.LoanOfficer).WithMany(p => p.BackgroundVerifications)
                .HasForeignKey(d => d.LoanOfficerId)
                .HasConstraintName("FK__Backgroun__LoanO__4E88ABD4");
        });

        modelBuilder.Entity<Feedback>(entity =>
        {
            entity.HasKey(e => e.FeedbackId).HasName("PK__Feedback__6A4BEDF6BC863BB4");

            entity.ToTable("Feedback");

            entity.Property(e => e.FeedbackId).HasColumnName("FeedbackID");
            entity.Property(e => e.Comments).HasColumnType("text");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Feedbacks)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Feedback__UserID__5EBF139D");
        });

        modelBuilder.Entity<Help>(entity =>
        {
            entity.HasKey(e => e.HelpId).HasName("PK__Help__90E3232EDD34C679");

            entity.ToTable("Help");

            entity.Property(e => e.HelpId).HasColumnName("HelpID");
            entity.Property(e => e.Answer).HasColumnType("text");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Question).HasColumnType("text");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<Loan>(entity =>
        {
            entity.HasKey(e => e.LoanId).HasName("PK__Loans__4F5AD437EE55348B");

            entity.Property(e => e.LoanId).HasColumnName("LoanID");
            entity.Property(e => e.Amount).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasDefaultValue("Pending");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Loans)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Loans__UserID__46E78A0C");
        });

        modelBuilder.Entity<LoanVerification>(entity =>
        {
            entity.HasKey(e => e.VerificationId).HasName("PK__LoanVeri__306D49274F8420F8");

            entity.ToTable("LoanVerification");

            entity.Property(e => e.VerificationId).HasColumnName("VerificationID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LoanId).HasColumnName("LoanID");
            entity.Property(e => e.LoanOfficerId).HasColumnName("LoanOfficerID");
            entity.Property(e => e.Notes).HasColumnType("text");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasDefaultValue("Pending");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Loan).WithMany(p => p.LoanVerifications)
                .HasForeignKey(d => d.LoanId)
                .HasConstraintName("FK__LoanVerif__LoanI__5535A963");

            entity.HasOne(d => d.LoanOfficer).WithMany(p => p.LoanVerifications)
                .HasForeignKey(d => d.LoanOfficerId)
                .HasConstraintName("FK__LoanVerif__LoanO__5629CD9C");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__Roles__8AFACE3ADD9FC407");

            entity.HasIndex(e => e.RoleName, "UQ__Roles__8A2B61601BB8D044").IsUnique();

            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.RoleName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCAC45AA5635");

            entity.HasIndex(e => e.Username, "UQ__Users__536C85E415F8E057").IsUnique();

            entity.HasIndex(e => e.Email, "UQ__Users__A9D10534A909A082").IsUnique();

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Username)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK__Users__RoleID__403A8C7D");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
