
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using WebApplication5.Models;
using static System.Net.Mime.MediaTypeNames;

namespace WebApplication7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsApiController : ControllerBase
    {

        SalesDbContext _context;


        public ProductsApiController(SalesDbContext context)
        {
            _context = context;
        }


        [HttpGet]
        public IActionResult GetAllStudents()
        {
            List<Product> Products = _context.Product.ToList();
            return Ok(Products);
        }

        [HttpGet("{id}")]
        public IActionResult GetStudentById(int id)
        {
            Product obj = _context.Product.Find(id);

            if (obj != null)
            {
                return Ok(obj);
            }
            else
            {
                return NotFound(new { status = "Requested product details does not exists." });
            }
        }

        [HttpPost]
        public IActionResult CreateStudent(Product obj)
        {
            _context.Product.Add(obj);
            _context.SaveChanges();
            return Ok(new { status = "New product details added in server." });
        }

        [HttpPut]
        public IActionResult EditStudent(Product obj)
        {
            _context.Product.Update(obj);
            _context.SaveChanges();
            return Ok(new { status = "Product details updated in server." });
        }


        [HttpDelete("{id}")]
        public IActionResult DeleteStudentById(int id)
        {
            Product obj = _context.Product.Find(id);

            if (obj != null)
            {
                _context.Product.Remove(obj);
                _context.SaveChanges();
                return Ok(new { status = "Product details are deleted from server." });
            }
            else
            {
                return NotFound(new { status = "Product student details does not exists." });
            }
        }
    }
}
