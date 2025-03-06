using Microsoft.EntityFrameworkCore;
using StudentRegistration.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

public class ApplicationDbContext : DbContext
{
    public DbSet<User> UserInfo { get; set; }
    public DbSet<Log> LogInfo { get; set; }

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
    {
    }

    public ApplicationDbContext()
    {
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Date>()
            .HasNoKey();
        modelBuilder.Entity<User>().ToTable("UserInfo");
        modelBuilder.Entity<Log>().ToTable("LogInfo");

        modelBuilder.Entity<Log>()
            .HasOne<User>()
            .WithMany()
            .HasForeignKey(l => l.userId)
            .HasConstraintName("FK_LogInfo_UserInfo");
    }
}
