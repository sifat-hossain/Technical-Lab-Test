using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TechnicalLabTest_ServiceLayer.Interface;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TechnicalLabTest_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReadingAPIController : ControllerBase
    {
        private readonly IReading reading;
        public ReadingAPIController(IReading _reading)
        {
            reading = _reading;
        }
        // GET: api/<ReadingAPIController>
        [HttpGet]
        public async Task<IActionResult> Get(Int16? BuildingId, Byte? ObjectId, Byte? DatafieldId, DateTime? StartDate, DateTime? EndDate)
        {
            return Ok(await reading.GetReadingById(BuildingId, ObjectId, DatafieldId, StartDate, EndDate));
        }

        
    }
}
