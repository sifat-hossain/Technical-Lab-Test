﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Interface
{
    public interface IReading
    {
        Task<List<ReadingViewModel>> GetReadingById(Int16? BuildingId, Byte? ObjectId, Byte? DatafieldId, DateTime? StartDate, DateTime? EndDate);
    }
}