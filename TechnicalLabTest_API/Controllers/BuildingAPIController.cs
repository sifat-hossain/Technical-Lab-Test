using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TechnicalLabTest_API.ViewModel;
using TechnicalLabTest_ServiceLayer.Interface;



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
        
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await building.GetBuildingList()); //Get full list of Building.                                              
                                                         //it is calling the "GetBuildingList()" method from "TechnicalLabTest_ServiceLayer.Interface"
        }

    }
}
