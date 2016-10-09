<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="<%=request.getContextPath() %>/resources/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/jquery-ui.css">
<script src='<%=request.getContextPath() %>/resources/jquery-ui.js' type='text/javascript'></script>

<title>Insert title here</title>
</head>
<body>
	<input id="userFullName" type="text">
	Id: <input id="userId" type="text">
</body>


<script type="text/javascript">
$( "#userFullName" ).autocomplete({
    source: function(request, response) {
        $.ajax({
            url: "SearchUserServlet",
            dataType: "json",
            type: "POST",
            data: {
                keyword: request.term
            },
            success: function(data){
                response( $.map( data, function( item ) {
                    //alert(item.label);
                    return {
                        label: item.fullName,
                        value: item.userId     // EDIT
                    }
                }));
             }
             
        })
    },
    select: function(event, ui) {
        $("#userFullName").val(ui.item.label);
        $("#userId").val(ui.item.value);
        return false;
    }
});
</script>
</html>