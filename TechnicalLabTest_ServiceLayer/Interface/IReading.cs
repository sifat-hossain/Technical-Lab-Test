using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Interface
{
    //this interface is inherited with "ReadingServiceLayer" of "TechnicalLabTest_ServiceLayer.ServiceLayer"
    public interface IReading
    {
        Task<List<ReadingViewModel>> GetReadingById(Int16? BuildingId, Byte? ObjectId, Byte? DatafieldId, DateTime? StartDate, DateTime? EndDate); //declare the method of retriving "value" and "timestamp" from Reading table based in parameter
    }
}
