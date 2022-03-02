using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_API.ViewModel;
using TechnicalLabTest_DAL.Model;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.Automapper
{
    public class Automapper:Profile
    {
        public Automapper()
        {
            CreateMap<BuildingViewModel, Building>().ReverseMap();
            CreateMap<ObjectViewModel, TechnicalLabTest_DAL.Model.Object>().ReverseMap();
            CreateMap<DatafieldViewModel, DataField>().ReverseMap();
            CreateMap<ReadingViewModel,Reading>().ReverseMap();
        }
    }
}
