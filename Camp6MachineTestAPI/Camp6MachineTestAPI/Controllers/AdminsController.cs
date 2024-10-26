using Microsoft.AspNetCore.Mvc;
using Camp6MachineTestAPI.Repository;
using Camp6MachineTestAPI.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Camp6MachineTestAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminsController : ControllerBase
    {
        private readonly IAdminRepository _adminRepository;

        public AdminsController(IAdminRepository adminRepository)
        {
            _adminRepository = adminRepository;
        }

        // GET: api/Admins/loans
        [HttpGet("loans")]
        public async Task<ActionResult<IEnumerable<Loan>>> GetAllLoans()
        {
            try
            {
                var loans = await _adminRepository.GetAllLoans();

                if (loans == null || !loans.Any())
                {
                    return NotFound("No loans found.");
                }

                return Ok(loans);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // Additional controller methods (e.g., Index, Details, Create, Edit, Delete)...
        // These are sample methods; update based on specific needs

        // GET: AdminsController
        public ActionResult Index()
        {
            return View();
        }

        // GET: AdminsController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: AdminsController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: AdminsController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: AdminsController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: AdminsController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: AdminsController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
