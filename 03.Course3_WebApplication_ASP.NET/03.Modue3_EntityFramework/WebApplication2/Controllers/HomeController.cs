using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class HomeController : Controller
    {
        SalesDbContext _context;

        public HomeController(SalesDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            List<Product> productsList = _context.Products.ToList();
            return View(productsList);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Product obj)
        {
            if (ModelState.IsValid)
            {
                _context.Products.Add(obj);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        public IActionResult Details(int id)
        {
            Product obj = _context.Products.Find(id);
            return View(obj);
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            Product obj = _context.Products.Find(id);
            return View(obj);
        }

        [HttpPost]
        public IActionResult Edit(Product obj)
        {
            _context.Products.Update(obj);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }


        [HttpGet]
        public IActionResult Delete(int id)
        {
            Product obj = _context.Products.Find(id);
            return View(obj);
        }

        [HttpPost]
        [ActionName("Delete")]
        public IActionResult DeleteConfirm(int id)
        {
            Product obj = _context.Products.Find(id);
            _context.Products.Remove(obj);
            _context.SaveChanges();
            return RedirectToAction("Index");

        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
