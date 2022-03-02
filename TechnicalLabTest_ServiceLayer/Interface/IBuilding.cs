using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_API.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Interface
{
   public interface IBuilding
    {
        Task<List<BuildingViewModel>> GetBuildingList();
    }
}
