using System;
using System.Collections.Generic;

#nullable disable

namespace TechnicalLabTest_DAL.DataModel
{
    public partial class Reading
    {
        public long ReadingId { get; set; }
        public short BuildingId { get; set; }
        public byte ObjectId { get; set; }
        public byte DataFieldId { get; set; }
        public decimal Value { get; set; }
        public DateTime Timestamp { get; set; }

        public virtual Building Building { get; set; }
        public virtual DataField DataField { get; set; }
        public virtual Object Object { get; set; }
    }
}
