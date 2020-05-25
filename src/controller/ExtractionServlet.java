package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Extraction;
import beans.PostComment;
import beans.User;
import service.CommentService;
import service.ExtractionService;

@WebServlet(urlPatterns = { "/extraction" })
public class ExtractionServlet extends HttpServlet {

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {

	        boolean isShowExtractionForm = false;
	        User user = (User) request.getSession().getAttribute("loginUser");
	        if (user != null) {
	            isShowExtractionForm = true;
	       	}else{
	       		request.getRequestDispatcher("/login.jsp").forward(request, response);
	       	}

	    	Extraction posts = getExtraction(request);
	    	List<Extraction> postsB = new ExtractionService().select(posts);
         	request.setAttribute("posts", postsB);

	        List<PostComment> comments = new CommentService().select();
	        request.setAttribute("comments", comments);
	        request.setAttribute("isShowExtractionForm", isShowExtractionForm);
	        request.getRequestDispatcher("/home.jsp").forward(request, response);


	    }

	    private Extraction getExtraction(HttpServletRequest request) throws IOException, ServletException {
	    	Extraction posts = new Extraction();
	    	posts.setStart(request.getParameter("start"));
	    	posts.setEnd(request.getParameter("end"));
	    	posts.setCategory(request.getParameter("category"));

			return posts;
	    }
	}
