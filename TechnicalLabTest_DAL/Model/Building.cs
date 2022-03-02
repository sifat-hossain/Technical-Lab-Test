using System;
using System.Collections.Generic;

#nullable disable

namespace TechnicalLabTest_DAL.Model
{
    public partial class Building
    {
        public Building()
        {
            Readings = new HashSet<Reading>();
        }

        public short Id { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }

        public virtual ICollection<Reading> Readings { get; set; }
    }
}
