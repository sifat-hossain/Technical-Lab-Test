using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnicalLabTest_DAL.Context;
using TechnicalLabTest_DAL.Model;
using TechnicalLabTest_ServiceLayer.Interface;
using TechnicalLabTest_ServiceLayer.ViewModel;

namespace TechnicalLabTest_ServiceLayer.ServiceLayer
{
    public class DataFieldServiceLayer : IDatafield
    {
        public readonly DBContext dbContext;
        public readonly IMapper Mapper;
        public DataFieldServiceLayer(DBContext _dbContext, AutoMapper.IMapper _mapper)
        {
            dbContext = _dbContext;
            Mapper = _mapper;
        }
        public async Task<List<DatafieldViewModel>> GetDatafieldList()
        {
            List<DataField> dataField = await dbContext.DataFields.FromSqlRaw("exec SpGetDataFieldList").ToListAsync();
            List<DatafieldViewModel> datafieldViewModel = Mapper.Map<List<DatafieldViewModel>>(dataField);
            return datafieldViewModel;
        }
    }
}
