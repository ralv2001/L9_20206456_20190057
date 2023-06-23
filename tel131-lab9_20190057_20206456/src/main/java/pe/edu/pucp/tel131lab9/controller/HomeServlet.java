package pe.edu.pucp.tel131lab9.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.pucp.tel131lab9.bean.Post;
import pe.edu.pucp.tel131lab9.dao.PostDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HomeServlet", urlPatterns = {"/HomeServlet",""})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view;

        PostDao postDao = new PostDao();

        request.setAttribute("posts", postDao.listPosts());
        view = request.getRequestDispatcher("home.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action") == null ? "buscar" : request.getParameter("action");
        PostDao postDao = new PostDao();

        switch (action) {
            case "buscar":
                String textoBuscar = request.getParameter("textoBusqueda");
                if (textoBuscar == null) {
                    response.sendRedirect("HomeServlet");
                } else {
                    ArrayList<Post> listaPost = postDao.buscarPosts(textoBuscar);
                    request.setAttribute("textoBusqueda", textoBuscar);
                    request.setAttribute("posts", listaPost);
                    RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                    view.forward(request, response);
                }
                break;
        }
    }

}
