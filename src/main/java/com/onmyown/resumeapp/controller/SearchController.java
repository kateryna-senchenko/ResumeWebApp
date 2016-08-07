package com.onmyown.resumeapp.controller;

import com.onmyown.resumeapp.service.NameService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/search")
public class SearchController extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(SearchController.class);
    private static final long serialVersionUID = -5124798529487954960L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.debug("doGet search");
        req.getRequestDispatcher("/WEB-INF/JSP/search-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.debug("doGet search: {}", req.getParameterMap());
        final String name = req.getParameter("query");

        if(!isValid(name)){
            req.setAttribute("invalid", Boolean.TRUE);
            req.getRequestDispatcher("/WEB-INF/JSP/search-form.jsp").forward(req, resp);
            return;
        }

        final String result = NameService.getInstance().convertName(name);
        req.setAttribute("name", result);
        req.getRequestDispatcher("/WEB-INF/JSP/search-result.jsp").forward(req, resp);
    }

    private boolean isValid(String name){
        return name != null && !name.trim().isEmpty();
    }
}
