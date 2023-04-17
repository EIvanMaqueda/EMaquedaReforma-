using Microsoft.AspNetCore.Mvc;

namespace PL_Core.Controllers
{
    public class UsuarioController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
