using Microsoft.AspNetCore.Mvc;
using StudentRegistration.Models;
namespace StudentRegistration.Controllers
{    
    public class UserRegistrationController : Controller
    {
        private readonly ApplicationDbContext _context;

        public UserRegistrationController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(User model)
        {
            if (ModelState.IsValid)
            {
                if (_context.UserInfo.Any(u => u.nric == model.nric))
                {
                    ModelState.AddModelError("Nric", "This NRIC is already registered.");
                    return View(model);
                }

                var user = new User
                {
                    id = Guid.NewGuid(),
                    userid = model.userid,
                    nric = model.nric,
                    name = model.name,
                    gender = model.gender,
                    birthday = model.birthday,
                    availableDate = model.availableDate,
                    subjects = string.Join(",", model.subjects),
                    createdOn = DateTime.Now,
                    createdBy = "system",
                    modifiedOn = DateTime.Now,
                    modifiedBy = "system"
                };

                using (var transaction = await _context.Database.BeginTransactionAsync())
                {
                    try
                    {
                        _context.UserInfo.Add(user);
                        await _context.SaveChangesAsync();

                        _context.LogInfo.Add(new Log
                        {
                            id = Guid.NewGuid().ToString(),
                            actionDescription = $"New user registered: {user.name}",
                            userId = user.id,
                            actionTime = DateTime.Now,
                            createdBy = "system",
                            createdOn = DateTime.Now,
                            modifiedBy = "system",
                            modifiedOn = DateTime.Now,
                        });
                        await _context.SaveChangesAsync();

                        await transaction.CommitAsync();

                        return RedirectToAction("RegisteredUsers");
                    }
                    catch
                    {
                        await transaction.RollbackAsync();
                        ModelState.AddModelError("", "An error occurred while registering the user.");
                    }
                }
            }
            else
            {
                Console.WriteLine("ModelState is invalid.");
                foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
                {
                    Console.WriteLine(error.ErrorMessage);
                }
            }
            return View(model);
        }

        public IActionResult RegisteredUsers()
        {
            var users = _context.UserInfo.ToList();
            return View(users);
        }
    }
}
