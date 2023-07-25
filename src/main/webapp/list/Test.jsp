<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>


<script>

	
	  /* document.addEventListener("DOMContentLoaded", function() {
	    // 기본값으로 선택할 옵션의 인덱스를 지정합니다. (0부터 시작)
	    var defaultOptionIndex = 2;
	    var selectElement = document.getElementById("mySelect");
	    selectElement.selectedIndex = defaultOptionIndex;
	  }); */

	  <% session.setAttribute("wordDay","2");%>
	  
	  
	  document.addEventListener("DOMContentLoaded", function() {
		    // 기본값으로 선택할 옵션의 인덱스를 지정합니다. (0부터 시작)
		    var defaultOptionIndex = "<%=session.getAttribute("wordDay")%>" -1;
		    var selectElement = document.getElementById("levelSelect");
		    selectElement.selectedIndex = defaultOptionIndex;
		  }); 
	  
	  
</script>


</head>
<body>
	<!-- <select id="mySelect">
	  <option value="option1">Option 1</option>
	  <option value="option2">Option 2</option>
	  <option value="option3">Option 3</option>
	</select> -->
	
	 <select name="levelSelect" id="levelSelect" onchange="javascript:changeSelect()" >
    	  <option value="1" >1</option>
	      <option value="2" >2</option>
	      <option value="3" >3</option>
	      <option value="4" >4</option>
          <option value="5" >5</option>
    </select> 



	
</body>
</html>