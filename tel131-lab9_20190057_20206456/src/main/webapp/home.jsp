<%@page import="java.util.ArrayList" %>
<%@ page import="pe.edu.pucp.tel131lab9.bean.Post" %>
<jsp:useBean id="posts" type="java.util.ArrayList<pe.edu.pucp.tel131lab9.bean.Post>" scope="request"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="textoBusqueda" scope="request" type="java.lang.String" class="java.lang.String"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <jsp:include page="includes/headCss.jsp"></jsp:include>
</head>
<body>
<div class='container'>
    <jsp:include page="includes/navbar.jsp">
        <jsp:param name="currentPage" value="home"/>
    </jsp:include>
    <div class="row mb-5 mt-4">
        <div class="col-md-7">
            <h1>Home</h1>
        </div>
        <div class="col-md-5 col-lg-4 ms-auto my-auto text-md-end">
            <a href="<%= request.getContextPath()%>/PostServlet?action=new" class="btn btn-primary">New Post</a>
        </div>
    </div>
    <form method="post" action="<%=request.getContextPath()%>/HomeServlet?action=buscar">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Search posts" name="textoBusqueda"
                   value="<%=textoBusqueda%>"/>
            <button class="input-group-text" type="submit">
                <i class="bi bi-search"></i>
            </button>
            <a class="input-group-text" href="<%=request.getContextPath()%>/HomeServlet">
                <i class="bi bi-x-circle"></i>
            </a>
        </div>
    </form>
    <div class="row">
        <%for (Post p : posts) {%>
        <div class="col-sm-4 py-3">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title"><%= p.getTitle()%></h3>
                    <h5 class="card-subtitle mb-2 text-muted"><%= p.getEmployee().getFirstName() + p.getEmployee().getLastName()%></h5>
                    <p class="card-text"><%= p.getContent()%></p>

                    <a href="<%= request.getContextPath()%>/PostServlet?action=view&id=<%=p.getPostId()%>" class="btn btn-primary">View</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>
    <jsp:include page="includes/footer.jsp"/>
</div>
</body>
</html>
