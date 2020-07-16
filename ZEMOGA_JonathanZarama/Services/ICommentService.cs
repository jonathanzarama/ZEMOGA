using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZEMOGA_JonathanZarama.Models;

namespace ZEMOGA_JonathanZarama.Services
{
    public interface ICommentService
    {
        List<Comment> ObtainComments(Post PostComments);

    }
}