<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear un nuevo trabajo</title>
        <jsp:include page="../includes/headCss.jsp"></jsp:include>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="job"/>
            </jsp:include>
            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>New Post</h1>
                    <form method="POST" action="<%=request.getContextPath()%>/PostServlet?action=crear">

                        <div class="mb-3">
                            <label class="form-label">Title</label>
                            <input type="text" class="form-control" name="title">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Comment</label>
                            <input type="text" class="form-control" name="content">
                        </div>
                        <a href="<%= request.getContextPath()%>/JobServlet" class="btn btn-danger">Cancelar</a>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
        <jsp:include page="../includes/footer.jsp"/>
    </body>
</html>
