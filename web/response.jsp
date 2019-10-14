<%@ page import="java.util.ArrayList" %>
<%@ page import="ifmo.pip.lab2.Point" %>
<%--
  Created by IntelliJ IDEA.
  User: mmmlpmsw
  Date: 11.10.2019
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='UTF-8'>
    <title>response</title>
    <link href='stylesheet-dark.css' rel='stylesheet'>
    <link rel='stylesheet' href='stylesheet-light.css'>
</head>
<body>
    <div class='container' style='padding:20px 0px;'>
<%--        <a href='index.jsp'>--%>
<%--            <button class='submit'>--%>
<%--                Return--%>
<%--            </button>--%>
<%--        </a>--%>
        <br>
        <%
            boolean pr = false;
            try {
                String switchTheme = request.getParameter("switch-1");
                pr = switchTheme.equals("on");
            } catch (NullPointerException e) {
//                e.printStackTrace();
                pr = false;
            }

            if (pr) { %>
                <script>
                    let head = document.head;
                    let link1 = document.createElement('link');
                    link1.rel = 'stylesheet';
                    link1.href = 'stylesheet-dark.css';
                    head.appendChild(link1);
                </script>
        <%
            }
        %>
        <br>
        <table align="left" class="block" id = responsesTable>
            <tr><td>X</td><td>Y</td><td>R</td><td>Result</td></tr><%
             ArrayList<Point> list = (ArrayList)config.getServletContext().getAttribute("list");
             for(int i = 0; i < list.size(); i++) {
                 %>
            <tr>
                <td><%=list.get(i).x%></td>
                <td><%=list.get(i).y%></td>
                <td><%=list.get(i).R%></td>
                <td><%if (Point.checkArea(list.get(i).x, list.get(i).y, list.get(i).R)) {
                    %> Yes<%
                    list.get(list.size()-1).isInArea = true;
                } else {
                %> No<%
                        list.get(list.size()-1).isInArea = false;
                }%>
                </td>
            </tr>
            <%
             }
         %>
        </table>
        <div id='responseFooter'> <div class='switch' align='left' onclick='aaaaa()'>
            <input type='checkbox' align='right' id='switch-2' class='switch-check'>
            <label for='switch-2'>сделать красиво?</label>
        </div>
            <div style='clear: left'>
            </div>
            <script>
                function aaaaa() {
                    let head = document.head,
                        link = document.createElement('link');
                    link.rel = 'stylesheet';
                    // проверяем значение из localStorage если dark то темная тема
                    if (localStorage.getItem('themeStyle') === 'dark') {
                        link.href = 'stylesheet-dark.css'; // ссылка на темный стиль
                        document.getElementById('switch-2').setAttribute('checked', true); // переключаем чекбокс в положение "темная тема"
                    }
                    // по умолчанию светлая тема
                    else {
                        link.href = 'stylesheet-light.css'; // ссылка на светлый стиль
                    }
                    head.appendChild(link); // вставляем <link rel="stylesheet" href="light|dark.css"> в шапку страницы между темаги head


                    // событие при переключении чекбокса
                    document.getElementById('switch-2').addEventListener('change', ev => {
                        let btn = ev.target;
                        // если чекбокс включен
                        if (btn.checked) {
                            link.href = 'stylesheet-dark.css'; // сключаем темную тему
                            localStorage.setItem('themeStyle', 'dark'); // записываем значение в localStorage
                        } else {
                            link.href = 'stylesheet-light.css'; // включаем светлую тему
                            localStorage.setItem('themeStyle', 'light'); // записываем значение в localStorage
                        }
                    });
                }
            </script>
        </div>
    </div>
</body>
</html>