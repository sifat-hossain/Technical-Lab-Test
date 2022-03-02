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

        // GET api/<BuildingAPIController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<BuildingAPIController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<BuildingAPIController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<BuildingAPIController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
