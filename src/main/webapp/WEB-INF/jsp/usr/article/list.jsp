<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name } 게시판" />
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div>${articlesCount }개</div>
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="70" />
					<col width="200" />
					<col />
					<col width="100" />
				</colgroup>
				<thead>
					<tr bgcolor="gray">
						<th>번호</th>
						<th>날짜</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr>
							<td>${article.id}</td>
							<td>${article.regDate.substring(2,16)}</td>
							<td><a class="hover:underline"
									href="../article/detail?id=${article.id}">${article.title}</a></td>
							<td>${article.extra__writerName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	<div class="page-menu mt-3 flex justify-center">
		<div class="btn-group">
			<c:set var="pageMenuLen" value="4" />
			<c:set var="startPage"
				value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
			<c:set var="endPage"
				value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount }" />

			<c:if test="${startPage > 1}">
				<a class="btn btn-sm" href="?page=1&boardId=${boardId }">1</a>
				<c:if test="${startPage > 2}">
					<a class="btn btn-sm btn-disabled">...</a>
				</c:if>
			</c:if>

			<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<a class="btn btn-sm ${page == i ? 'btn-active' : '' }"
					href="?page=${i }&boardId=${boardId}">${i }</a>
			</c:forEach>

			<c:if test="${endPage < pagesCount}">
				<c:if test="${endPage < pagesCount - 1}">
					<a class="btn btn-sm btn-disabled">...</a>
				</c:if>
				<a class="btn btn-sm"
					href="?page=${pagesCount }&boardId=${boardId }">${pagesCount }</a>
			</c:if>
		</div>
	</div>


	</div>
</section>



<%@ include file="../common/foot.jspf"%>