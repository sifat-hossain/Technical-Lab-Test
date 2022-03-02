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
    public class DataFieldAPIController : ControllerBase
    {
        private readonly IDatafield datafield;
        public DataFieldAPIController(IDatafield _datafield)
        {
            datafield = _datafield;
        }
        // GET: api/<DataFieldAPIController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await datafield.GetDatafieldList());
        }        
    }
}
