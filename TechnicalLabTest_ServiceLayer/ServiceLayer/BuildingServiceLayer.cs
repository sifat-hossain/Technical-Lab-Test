using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_API.ViewModel;
using TechnicalLabTest_DAL.Context;
using TechnicalLabTest_DAL.Model;
using TechnicalLabTest_ServiceLayer.Interface;

namespace TechnicalLabTest_ServiceLayer.ServiceLayer
{
    public class BuildingServiceLayer : IBuilding
    {
        public readonly DBContext dbContext;
        public readonly IMapper Mapper;
        public BuildingServiceLayer(DBContext _dbContext, AutoMapper.IMapper _mapper)
        {
            dbContext = _dbContext;
            Mapper = _mapper;
        }
        public async Task<List<BuildingViewModel>> GetBuildingList()
        {
            List<Building> building = await dbContext.Buildings.FromSqlRaw("exec SpGetBuildingList").ToListAsync();
            List<BuildingViewModel> buildingViewModel = Mapper.Map<List<BuildingViewModel>>(building);
            return buildingViewModel;
        }
    }
}
