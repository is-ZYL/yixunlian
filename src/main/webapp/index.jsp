<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h2>Hello World!</h2>
<label for="id">点我</label>
<form action="${pageContext.request.contextPath}/app/front/activity/test444" method="get">
    <input type="datetime" id="id" name="date">
    <input type="submit" onclick="ok()" value="test">
</form>
<script>
    function ok() {
        var id = document.getElementById("id").value;
        alert(id);
    }
</script>
</body>