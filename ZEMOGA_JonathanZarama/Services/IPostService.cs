﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZEMOGA_JonathanZarama.Models;

namespace ZEMOGA_JonathanZarama.Services
{
    public interface IPostService
    {
        List<Post> ObtainPost(User user);

        Post ObtainPost(Post post);
    }
}