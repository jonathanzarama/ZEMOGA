using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZEMOGA_JonathanZarama.Models;

namespace ZEMOGA_JonathanZarama.Services
{
    public class PostService : IPostService
    {
        public List<Post> ObtainPost(User user)
        {
            try
            {
                ZEMOGA_DBEntities db = new ZEMOGA_DBEntities();
                user = db.User.FirstOrDefault(x => x.ID == user.ID);
                UserRole role = db.UserRole.FirstOrDefault(x => x.ID == (user.UserRole));
                List<Post> postToshow = null;
                if (role.Nombre.Equals(Roles.Guest.ToString()))
                {
                    postToshow = db.Post.Where(x => x.IsApproved).ToList<Post>();
                }
                if (role.Nombre.Equals(Roles.Writer.ToString()) || role.Nombre.Equals(Roles.Editor.ToString()))
                {
                    postToshow = db.Post.ToList<Post>();
                }
                return postToshow;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public Post ObtainPost(Post post)
        {
            try
            {
                ZEMOGA_DBEntities db = new ZEMOGA_DBEntities();
                Post postDetails = db.Post.FirstOrDefault(x => x.ID == (post.ID));
                return postDetails;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        

        enum Roles
        {
            Writer,
            Editor,
            Guest
        }


    }
}