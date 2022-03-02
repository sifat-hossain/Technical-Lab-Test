using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_API.ViewModel;
using TechnicalLabTest_DAL.Model;

namespace TechnicalLabTest_ServiceLayer.Automapper
{
    public class Automapper:Profile
    {
        public Automapper()
        {
            CreateMap<BuildingViewModel, Building>().ReverseMap();
        }
    }
}
