using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Interface
{
  public interface IObject
    {
        Task<List<ObjectViewModel>> GetObjectList();
    }
}
