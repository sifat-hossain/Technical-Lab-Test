using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Interface
{
    //this interface is inherited with "ObjectServiceLayer" of "TechnicalLabTest_ServiceLayer.ServiceLayer"
    public interface IObject
    {
        Task<List<ObjectViewModel>> GetObjectList(); //declare the method of retriving Object list
    }
}
