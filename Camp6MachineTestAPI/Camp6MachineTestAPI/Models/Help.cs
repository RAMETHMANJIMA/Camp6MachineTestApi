using System;
using System.Collections.Generic;

namespace Camp6MachineTestAPI.Models;

public partial class Help
{
    public int HelpId { get; set; }

    public string Question { get; set; } = null!;

    public string? Answer { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }
}
