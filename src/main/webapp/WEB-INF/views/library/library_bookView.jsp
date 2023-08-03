<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_bookView.jsp -->
<%@ include file="library_top.jsp" %>
<br>
<main>
	<div align="center">
		<table class="table">
			<thead>
				<tr>
					<td colspan="2">
						<font size="5">${bdto.book_title}</font><br>
					</td>				
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:if test="${bdto.image == 'none'}">
						<td width="30%" align="center" rowspan="2">
							<img src="resources/book_img/no_image.png" class="book-img-thumbnail">
						</td>
					</c:if>
					<c:if test="${bdto.image != 'none'}">
						<td width="30%" align="center" rowspan="2">
							<img src="resources/book_img/${bdto.image}" class="book-img-thumbnail">
						</td>
					</c:if>
					<td width="70%">
						저자 ${bdto.author} 출판 ${bdto.publisher}
					</td>
				</tr>
				<tr>
					<td>
						<font size="4">책 소개</font><br><br>
						${bdto.book_intro}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<font size="5">${bdto.genre} 베스트셀러</font><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="row row-cols-2 row-cols-md-6 g-4">
							<c:forEach var="img_getGenre" items="${image_getGenre}" end="6">
								<c:if test="${bdto.image != img_getGenre.image}">
			  						<div class="col">
										<div class="card" style="width: 18rem;">
											<a href="library_bookView.do?book_id=${img_getGenre.book_id}&genre=${img_getGenre.genre}">
												<img src="resources/book_img/${img_getGenre.image}" class="card-img-top">
											</a>
											<div class="card-body" align="center">
												<p class="card-text">
													<a href="library_bookView.do?book_id=${img_getGenre.book_id}&genre=${img_getGenre.genre}">${img_getGenre.book_title}</a>
												</p>
											</div>
											<div class="card-footer" align="center">
	        									<small class="text-body-secondary">${img_getGenre.author}</small>
	      									</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</main>
<%@ include file="library_bottom.jsp" %>
