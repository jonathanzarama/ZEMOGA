﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZEMOGA_JonathanZarama.Models;
using Microsoft.AspNet.Identity;

namespace ZEMOGA_JonathanZarama.Services
{
    public class UserService : IUserService
    {
        public User Login(string email, string password)
        {

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                ZEMOGA_DBEntities db = new ZEMOGA_DBEntities();
                User user = db.User.FirstOrDefault(x => x.Name == email && x.Password == password);
                if(user != null)
                {
                    return user;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
        public User ObtainUser(Guid user)
        {
            try
            {
                ZEMOGA_DBEntities db = new ZEMOGA_DBEntities();
                User currentUser = db.User.FirstOrDefault(x => x.ID == user);
                return currentUser;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}