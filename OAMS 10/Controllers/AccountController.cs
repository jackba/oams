using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using OAMS.Models;
using DotNetOpenAuth.OpenId.RelyingParty;
using DotNetOpenAuth.OpenId;
using DotNetOpenAuth.Messaging;
using DotNetOpenAuth.OpenId.Extensions.SimpleRegistration;
using DotNetOpenAuth.OpenId.Extensions.AttributeExchange;

namespace OAMS.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {

        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        // **************************************
        // URL: /Account/LogOn
        // **************************************

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        // **************************************
        // URL: /Account/LogOff
        // **************************************

        public ActionResult LogOff()
        {
            FormsService.SignOut();

            return RedirectToAction("Index", "Home");
        }

        // **************************************
        // URL: /Account/Register
        // **************************************

        public ActionResult Register()
        {
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    FormsService.SignIn(model.UserName, false /* createPersistentCookie */);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePassword
        // **************************************

        [Authorize]
        public ActionResult ChangePassword()
        {
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword))
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePasswordSuccess
        // **************************************

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }


        [AcceptVerbs(HttpVerbs.Post | HttpVerbs.Get), ValidateInput(false)]
        public ActionResult OpenIdLogOn(string returnUrl)
        {
            var openid = new OpenIdRelyingParty();
            var response = openid.GetResponse();
            if (response == null)  // Initial operation
            {
                // Step 1 - Send the request to the OpenId provider server
                string openid_identifier = "https://www.google.com/accounts/o8/id";
                Identifier id;


                //if (Identifier.TryParse(Request.Form["openid_identifier"], out id))
                //{
                //    try
                //    {
                //        var req = openid.CreateRequest(Request.Form["openid_identifier"]);
                //        return req.RedirectingResponse.AsActionResult();
                //    }
                //    catch (ProtocolException ex)
                //    {
                //        // display error by showing original LogOn view
                //        //this.ErrorDisplay.ShowError("Unable to authenticate: " + ex.Message);
                //        return View("Logon");
                //    }
                //}
                //else
                //{
                //    // display error by showing original LogOn view
                //    //this.ErrorDisplay.ShowError("Invalid identifier");
                //    //return View("LogOn", this.ViewModel);
                //    return View("LogOn");
                //}


                try
                {
                    var req = openid.CreateRequest(openid_identifier);

                    var fetch = new FetchRequest();
                    fetch.Attributes.AddRequired(WellKnownAttributes.Contact.Email);
                    fetch.Attributes.AddRequired(WellKnownAttributes.Name.First);
                    fetch.Attributes.AddRequired(WellKnownAttributes.Name.Last);

                    req.AddExtension(fetch);


                    return req.RedirectingResponse.AsActionResult();
                }
                catch (ProtocolException ex)
                {
                    // display error by showing original LogOn view
                    //this.ErrorDisplay.ShowError("Unable to authenticate: " + ex.Message);
                    return View("Logon");
                }

            }
            else  // OpenId redirection callback
            {
                // Step 2: OpenID Provider sending assertion response
                switch (response.Status)
                {
                    case AuthenticationStatus.Authenticated:
                        string identifier = response.ClaimedIdentifier;

                        var fetch = response.GetExtension<FetchResponse>();
                        string email = string.Empty;
                        string fullname = string.Empty;
                        if (fetch != null)
                        {
                            email = fetch.GetAttributeValue(WellKnownAttributes.Contact.Email);
                            fullname = fetch.GetAttributeValue(WellKnownAttributes.Name.FullName);
                        }


                        // OpenId lookup fails - Id doesn't exist for login - login first
                        //if (busUser.ValidateUserOpenIdAndLoad(identifier) == null)
                        //{
                        //    //this.ErrorDisplay.HtmlEncodeMessage = false;
                        //    //this.ErrorDisplay.ShowError(busUser.ErrorMessage +
                        //    //        "Please <a href='" + WebUtils.ResolveUrl("~/Account/Register") +
                        //    //        "'>register</a> to create a new account or <a href='" +
                        //    //        WebUtils.ResolveUrl("~/Account/Register") +
                        //    //        "'>associate</a> an existing account with your OpenId");

                        //    //return View("LogOn", this.ViewModel);
                        //    return View("LogOn");
                        //}

                        // Capture user information for AuthTicket
                        // and issue Forms Auth token
                        //UserState userState = new UserState()
                        //{
                        //    Email = busUser.Entity.Email,
                        //    Name = busUser.Entity.Name,
                        //    UserId = busUser.Entity.Id,
                        //    IsAdmin = busUser.Entity.IsAdmin
                        //};
                        //this.IssueAuthTicket(userState, true);
                        this.IssueAuthTicket(identifier, true);

                        if (!string.IsNullOrEmpty(returnUrl))
                            return Redirect(returnUrl);

                        return Redirect("~/new");

                    case AuthenticationStatus.Canceled:
                        //this.ErrorDisplay.ShowMessage("Canceled at provider");
                        //return View("LogOn", this.ViewModel);
                        return View("LogOn");
                    case AuthenticationStatus.Failed:
                        //this.ErrorDisplay.ShowError(response.Exception.Message);
                        //return View("LogOn", this.ViewModel);
                        return View("LogOn");
                }
            }
            return new EmptyResult();
        }

        //private void IssueAuthTicket(UserState userState, bool rememberMe)
        private void IssueAuthTicket(string userId, bool rememberMe)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, userId,
                                                                 DateTime.Now, DateTime.Now.AddDays(10),
                                                                 rememberMe, userId);

            string ticketString = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, ticketString);
            if (rememberMe)
                cookie.Expires = DateTime.Now.AddDays(10);

            HttpContext.Response.Cookies.Add(cookie);
        }

    }
}
