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
    public class ObjectAPIController : ControllerBase
    {
        private readonly IObject objects;
        public ObjectAPIController(IObject _objects)
        {
            objects = _objects;
        }
        // GET: api/<ObjectAPIController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await objects.GetObjectList());
        }

    }
}
