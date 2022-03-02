using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TechnicalLabTest_API.ViewModel;
using TechnicalLabTest_ServiceLayer.Interface;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TechnicalLabTest_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuildingAPIController : ControllerBase
    {
        private readonly IBuilding building;
        public BuildingAPIController(IBuilding _building)
        {
            building = _building;
        }
        // GET: api/<BuildingAPIController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await building.GetBuildingList());
        }
       
    }
}
