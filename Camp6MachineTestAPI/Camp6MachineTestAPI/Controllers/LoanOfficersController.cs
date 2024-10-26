using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Camp6MachineTestAPI.Controllers
{
    public class LoanOfficersController : Controller
    {
        // GET: LoanOfficersController
        public ActionResult Index()
        {
            return View();
        }

        // GET: LoanOfficersController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: LoanOfficersController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LoanOfficersController/Create
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

        // GET: LoanOfficersController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: LoanOfficersController/Edit/5
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

        // GET: LoanOfficersController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: LoanOfficersController/Delete/5
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
