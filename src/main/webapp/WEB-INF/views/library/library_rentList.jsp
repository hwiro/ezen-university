<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_rentList.jsp -->
<%@ include file="library_top.jsp" %>
<br><br>
<main>
	<div align="center">
		<table class="table">
			<thead>
				<tr>
					<th colspan="3">MyLibrary</th>
				</tr>
			</thead>
			
			<tbody class="table-group-divider">
				<c:if test="${listRent != null || listRent.size() != 0}">
					<c:forEach var="brdto" items="${listRent}">
						<tr>
							<c:if test="${brdto.image ==null}">
								<td>
									<img src="resources/book_img/no_image.png" class="myLibrary-img-thumbnail">
								</td>
							</c:if>
							<c:if test="${brdto.image != null}">
								<td>
									<img src="resources/book_img/${brdto.image}" class="myLibrary-img-thumbnail">
								</td>
							</c:if>
							<td>
								${brdto.book_name}<br><br>
								대여일 ${brdto.rentdate}
							</td>
							<td><a href ="library_deleteRent.do?book_id=${brdto.book_id}">반납하기</a></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${listRent == null || listRent.size() == 0}">
					<tr>
						<td colspan="4"><h1 align="center">대여한 책이 없습니다</h1></td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</main>
<%@ include file="library_bottom.jsp" %>