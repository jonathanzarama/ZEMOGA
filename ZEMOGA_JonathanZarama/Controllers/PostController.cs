using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZEMOGA_JonathanZarama.Models;
using ZEMOGA_JonathanZarama.Services;

namespace ZEMOGA_JonathanZarama.Controllers
{
    public class PostController : Controller
    {

        IPostService _postService;
        IUserService _userService;
        ICommentService _commentService;

        public PostController(IPostService PostService, IUserService UserService, ICommentService CommentService)
        {
            _postService = PostService;
            _userService = UserService;
            _commentService = CommentService;

        }


        // GET: Post
        public ActionResult Index(User user)
        {
            List<Post> ApprovedPost = _postService.ObtainPost(user);

            return View(ApprovedPost);
        }

        public ActionResult Details(Post post)
        {
            Post postComplete = _postService.ObtainPost(post);

            postComplete.commentsPost = _commentService.ObtainComments(postComplete);

            return View("Details", postComplete);
        }
        
      

    }
}