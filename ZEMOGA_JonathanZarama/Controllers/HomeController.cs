using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ZEMOGA_JonathanZarama.Models;
using ZEMOGA_JonathanZarama.Services;

namespace ZEMOGA_JonathanZarama.Controllers
{
    public class HomeController : Controller
    {
        IUserService _iuserService;


        public HomeController(IUserService UsertService)
        {
            _iuserService = UsertService;
        }


        public ActionResult Index(string message ="")
        {
            ViewBag.Message = message;
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            User user = _iuserService.Login(email, password);
            if (user!= null)
            {
                System.Web.HttpContext.Current.Session["userRole"]= user.UserRole1.Nombre;
                System.Web.HttpContext.Current.Session["user"]= user.ID;
                FormsAuthentication.SetAuthCookie(user.Name, true);
                return RedirectToAction("Index","Post",user);

            }
            else
            {
                return Index("User not Found");
            }
        }

    }
}