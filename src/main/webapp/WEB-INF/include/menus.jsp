<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 
$ { 조건 ? 'A' : 'B' } == ${menu.menu_id eq menu_id ? 'active' : ''}
 : menu 에서 꺼내온 menu_id 가 이 페이지에 menu_id 와 같다면
 : menu.menu_id 와 넘어온 menu_id 가 같다면 class='active' 추가
 , 다르면 아무런 클래스도 넣지 않음(빈 문자열) 
-->
  <table class="menu">
    <tr>
      <c:forEach var="menu" items="${ mList }">
        <td>
          <a href="/Board/List?menu_id=${ menu.menu_id }" 
          class="${menu.menu_id eq menu_id ? 'active' : ''}">
            ${ menu.menu_name }
          </a>
        </td>
      </c:forEach>
  	</tr>
  </table>
  
  