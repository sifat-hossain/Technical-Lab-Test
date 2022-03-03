using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Interface
{
    //this interface is inherited with "DataField" of "TechnicalLabTest_ServiceLayer.ServiceLayer"
    public interface IDatafield
    {
        Task<List<DatafieldViewModel>> GetDatafieldList(); //declare the method of retriving Data field list
    }
}
