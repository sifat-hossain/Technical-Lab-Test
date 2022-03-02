using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_DAL.Context;
using TechnicalLabTest_ServiceLayer.Interface;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.ServiceLayer
{
    public class ObjectServiceLayer : IObject
    {
        public readonly DBContext dbContext;
        public readonly IMapper Mapper;
        public ObjectServiceLayer(DBContext _dbContext, AutoMapper.IMapper _mapper)
        {
            dbContext = _dbContext;
            Mapper = _mapper;
        }
        public async Task<List<ObjectViewModel>> GetObjectList()
        {
            List<TechnicalLabTest_DAL.Model.Object> objects = await dbContext.Objects.FromSqlRaw("exec SpGetObjectList").ToListAsync();
            List<ObjectViewModel> objectViewModel = Mapper.Map<List<ObjectViewModel>>(objects);
            return objectViewModel;
        }
    }
}
