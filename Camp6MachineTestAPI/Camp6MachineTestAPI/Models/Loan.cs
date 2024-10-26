using System;
using System.Collections.Generic;

namespace Camp6MachineTestAPI.Models;

public partial class Loan
{
    public int LoanId { get; set; }

    public int? UserId { get; set; }

    public decimal Amount { get; set; }

    public string? Status { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<BackgroundVerification> BackgroundVerifications { get; set; } = new List<BackgroundVerification>();

    public virtual ICollection<LoanVerification> LoanVerifications { get; set; } = new List<LoanVerification>();

    public virtual User? User { get; set; }
}
