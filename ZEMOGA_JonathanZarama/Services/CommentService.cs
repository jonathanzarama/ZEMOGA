using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ZEMOGA_JonathanZarama.Models;
using Microsoft.AspNet.Identity;

namespace ZEMOGA_JonathanZarama.Services
{
    public class CommentService : ICommentService
    {
        public List<Comment> ObtainComments(Post PostComments)
        {
            try
            {
                ZEMOGA_DBEntities db = new ZEMOGA_DBEntities();


                List<PostComment> postComment = db.PostComment.Where(x => x.IDPost == PostComments.ID).ToList();
                List<Comment> comments = new List<Comment>();

                foreach (var item in postComment)
                {
                    comments.Add(item.Comment);
                }

                return comments;
            }
            catch (Exception e)
            {
                throw e;
            }

        }
    }
}