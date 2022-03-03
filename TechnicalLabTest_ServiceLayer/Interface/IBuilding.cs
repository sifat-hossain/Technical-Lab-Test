using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_API.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Interface
{
    //this interface is inherited with "BuildingServiceLayer" of "TechnicalLabTest_ServiceLayer.ServiceLayer"
    public interface IBuilding
    {
        Task<List<BuildingViewModel>> GetBuildingList(); //declare the method of retriving building list.
                                                         
    }
}
