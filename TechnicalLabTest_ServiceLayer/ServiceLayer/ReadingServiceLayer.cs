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
    public class ReadingServiceLayer : IReading
    {
        public readonly DBContext dbContext;
        public readonly IMapper Mapper;
        public ReadingServiceLayer(DBContext _dbContext, AutoMapper.IMapper _mapper)
        {
            dbContext = _dbContext;
            Mapper = _mapper;
        }
        public async Task<List<ReadingViewModel>> GetReadingById(Int16? BuildingId, Byte? ObjectId, Byte? DatafieldId, DateTime? StartDate, DateTime? EndDate)
        {
            List<Reading> reading = await dbContext.Readings.FromSqlRaw("exec SpGetReaddingData {0},{1},{2},{3},{4}", BuildingId, ObjectId, DatafieldId, StartDate, EndDate).ToListAsync();
            List<ReadingViewModel> readingViewModel = Mapper.Map<List<ReadingViewModel>>(reading);
            return readingViewModel;
        }
    }
}
