<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_bookList.jsp -->
<%@ include file="library_top.jsp" %>

<script type="text/javascript">
	function encodeHyperLink(url, book_id, genre) {
		const Ebook_id = encodeURIComponent(book_id);
		const Egenre = encodeURIComponent(genre);
		const Eurl = url +"?book_id="+ Ebook_id +"&genre="+ Egenre;
		location.href = Eurl;
	}
</script>

<br><br>
<main>
	<div align="center">
		<form name="f" action="library_findBook.do" method="post">
			<select class="form-select form-select-lg mb-3" name="search">
				<option value="book_title">도서명</option>
				<option value="genre">장르</option>
				<option value="author	">저자</option>
			</select>
			<input class="form-control" type="text" placeholder="검색어를 입력하세요." name="searchString" onkeyup="fn_checkByte(this, 100)">
			<input class="form-control mb-3" type="submit" value="검색">
		</form>
	</div>
	<div align="left">
		<table class="table">
			<thead>
				<tr>
					<th colspan="3">도서목록</th>
				</tr>
			</thead>
			
			<tbody class="table-group-divider">
				<c:if test="${booklist != null || booklist.size() != 0}">
					<c:forEach var="bdto" items="${booklist}">
						<tr>
							<c:if test="${bdto.image == 'none'}">
								<td>
									<a href="#" onclick="encodeHyperLink('library_bookView.do', '${bdto.book_id}', '${bdto.genre}')"><img src="resources/book_img/no_image.png" class="book-img-thumbnail"></a>
								</td>
							</c:if>
							<c:if test="${bdto.image != 'none'}">
								<td>
									<a href="#" onclick="encodeHyperLink('library_bookView.do', '${bdto.book_id}', '${bdto.genre}')"><img src="resources/book_img/${bdto.image}" class="book-img-thumbnail"></a>
								</td>
							</c:if>
							<td>
								<a href="#" onclick="encodeHyperLink('library_bookView.do', '${bdto.book_id}', '${bdto.genre}')">${bdto.book_title}</a><br>
								저자 ${bdto.author} | 출판 ${bdto.publisher} | 장르 ${bdto.genre}<br>
								대여수 ${bdto.readcount}
							</td>
							<td>
								<c:if test="${bdto.regdate == '대여중'}">
								${bdto.regdate}
								</c:if>
								<c:if test="${bdto.regdate != '대여중'}">
								<a href="library_insertRent.do?book_id=${bdto.book_id}">대여가능</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${booklist == null || booklist.size() == 0}">
					<tr>
						<td colspan="6"><h1 align="center">등록된 책이 없습니다</h1></td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<div align="center">
		<nav aria-label="Page navigation example">
	  		<ul class="pagination">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<li class="page-item"><a class="page-item" href="library_bookList.do?page=${i}">${i}</a>	
				</c:forEach>
			</ul>
		</nav>
	</div>
</main>
<%@ include file="library_bottom.jsp" %>