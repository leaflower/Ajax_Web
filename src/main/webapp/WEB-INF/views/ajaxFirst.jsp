<%--
  Created by IntelliJ IDEA.
  User: chenli12
  Date: 2019/3/21
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<select name="ajax" id="first" onchange="change(this.value)">
    <option value="1" selected="selected">中国</option>
    <option value="2">美国</option>
    <option value="3">俄罗斯</option>
</select>
</body>

<script type="text/javascript">
    //定义XMLHttpRequest对象
    var xmlrequest;

    //使用JS创建生成XHR（XMLHttpRequest）---Ajax
    function createXMLHttpRequest() {
        //浏览器版本的兼容
        if (window.XMLHttpRequest) {
            //DOM2 浏览器
            xmlrequest = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            //IE浏览器
            try {
                xmlrequest = new ActiveXObject("Msxml2.XMLHTTP");

            } catch (e) {
                try {
                    xmlrequest = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {

                }
            }
        }
    }


    //自定义事件监听select值的变化
    function change(id) {
        // body...
        createXMLHttpRequest();
        //编写url地址去访问web服务器
        var url = "http://localhost:8080/ajaxTest?id=" + id;
        //发送过程
        xmlrequest.open("GET", url, true)
        //设置请求头
        xmlrequest.setRequestHeader("Content_Type", "application/x-www-form-urlencoded");
        //设置处理响应结果的回调函数
        xmlrequest.onreadystatechange = processResponse;
        //发送请求
        xmlrequest.send(null)
    }

    function processResponse() {
        /*
        ResponseHeader响应头
        readyState:XHR状态结果
            XHR
            2.请求发送完毕
            3.开始读取服务器的响应
            4.读取服务器响应结束
        status：服务器响应码
            200：服务器正常
            400：无法找到你请求的资源
            401：权限不足
            404：需要访问的内容不存在
            500：服务器错误
        */
        if (xmlrequest.readyState == 4) {
            alert(xmlrequest.status);
        }
    }

</script>
</html>
