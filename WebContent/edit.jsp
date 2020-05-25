<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ユーザー編集画面</title>
    </head>
    <body>
        <div class="main-contents">

            <c:if test="${ not empty errorMessages }">
                <div class="errorMessages">
                    <ul>
                        <c:forEach items="${errorMessages}" var="errorMessage">
                            <li><c:out value="${errorMessage}" />
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <form action="edit" method="post"><br />
                <div hidden><input name="id" value="${user.id}" id="id"  /> <br /></div>

                <label for="account">アカウント名</label>
                <input name="account" value="${user.account}" id="account" /> <br />

                <div hidden><label for="oldAccount">旧アカウント名</label>
                <input name="oldAccount" value="${user.account}" id="oldAccount" /> <br /></div>

                <label for="password">パスワード</label>
                <input name="password"  type="password" id="password" /><br />

   				<label for="passwordB">パスワード(確認用)</label>
                <input name="passwordB"  type="password" id="password" /> <br />

                <label for="name">名称</label>
                <input name="name" value="${user.name}" id="name" /> <br />

                <label for="branch_office">支社</label>
                	<select name="branch_office"  type="branch_office" id="branch_office">
                		<option value=1>本社</option>
						<option value=2>A支社</option>
						<option value=3>B支社</option>
						<option value=4>C支社</option>
					</select><br />

                <label for="department">部署</label>
                	<select name="department"  type="department" id="department">
                		<option value=1>総務人事部</option>
						<option value=2>情報管理部</option>
						<option value=3>営業部</option>
						<option value=4>技術部</option>
					</select><br />

                <label for="status">ユーザー停止状態</label>
                	<select name="status" type="status" id="status">
						<option value=1>活性</option>
						<option value=2>停止</option>
					</select><br />

                <input type="submit" value="更新" /> <br />
            </form>

                <a href="management">戻る</a>
            <div class="copyright">Copyright(c)Your Name</div>
        </div>
    </body>
</html>