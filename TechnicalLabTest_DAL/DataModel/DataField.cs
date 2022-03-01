﻿using System;
using System.Collections.Generic;

#nullable disable

namespace TechnicalLabTest_DAL.DataModel
{
    public partial class DataField
    {
        public DataField()
        {
            Readings = new HashSet<Reading>();
        }

        public byte Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Reading> Readings { get; set; }
    }
}
