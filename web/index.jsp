 <!DOCTYPE html>
<html lang="en">
<head>
    <link href="stylesheet-dark.css" rel="stylesheet">
    <link href="stylesheet-light.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta charset="UTF-8">
    <title>lab2</title>
</head>
<body>
<header>
    <p class="info left"> Наумова Н.А, P3201</p>
    <p class="info right">Вариант 201051</p>
    <div style="clear: left"></div>
</header>

<section>

    <div class="content-container container">
            <canvas class="graph" id="graph-canvas" width="1000" height="1000">
            </canvas>
<%--        <svg class="graph" xmlns:xlink= "http://www.w3.org/1999/xlink" onclick="clickCanvas()" viewBox="0 0 1000 1000" >--%>

<%--            <path d="M 500 500--%>
<%--                            l 0 200 -400 0 0 -200 400 -400 0 200--%>
<%--                            M 500 300--%>
<%--                            A 200 200 0 0 1 700 500--%>
<%--                            l -200 0 z--%>
<%--                           "--%>
<%--                  fill="lightskyblue" stroke-width="2"></path>--%>

<%--            <path d=" M 0 500--%>
<%--                            l 1000 0 -25 -15--%>
<%--                            m 25 15--%>
<%--                            l -25 15--%>
<%--                            M 100 490 l 0 20--%>
<%--                            M 300 490 l 0 20--%>
<%--                            M 700 490 l 0 20--%>
<%--                            M 900 490 l 0 20--%>

<%--                            M 500 1000--%>
<%--                            l 0 -1000 -15 30--%>
<%--                            m 15 -30--%>
<%--                            l 15 30--%>
<%--                            M 490 900 l 20 0--%>
<%--                            M 490 700 l 20 0--%>
<%--                            M 490 300 l 20 0--%>
<%--                            M 490 100 l 20 0" stroke="black" fill="transparent" stroke-width="1"></path>--%>

<%--            <text x="8%" y="47.5%" font-size="45" class="graph-text">-R</text>--%>
<%--            <text x="24%" y="47.5%" font-size="45" class="graph-text">-R/2</text>--%>
<%--            <text x="66%" y="47.5%" font-size="45" class="graph-text">R/2</text>--%>
<%--            <text x="89%" y="47.5%" font-size="45" class="graph-text">R</text>--%>
<%--            <text x="52%" y="91.5%" font-size="45" class="graph-text">-R</text>--%>
<%--            <text x="52%" y="71.5%" font-size="45" class="graph-text">-R/2</text>--%>
<%--            <text x="52%" y="31.5%" font-size="45" class="graph-text">R/2</text>--%>
<%--            <text x="52%" y="11.5%" font-size="45" class="graph-text">R</text>--%>

<%--            <text x="46.5%" y="54%" font-size="45" class="graph-text">0</text>--%>
<%--            <text x="97.5%" y="54.5%" font-size="40" class="graph-view__text-x">x</text>--%>
<%--            <text x="45%" y="2%" font-size="40" class="graph-view__text-x">y</text>--%>
<%--        </svg>--%>
        <form method="post" action="control" target="graphics">
            <div class="control-points block region">
                <div id="xInput">
                    <p class="title"><label title="X"> Значение X </label></p>
                    <table class="main">
                        <tr>
                            <td><input data-setter="x" type="radio" name="x1" value="-5" id="-5">-5</td>
                            <td><input data-setter="x" type="radio" name="x1" value="-4" id="-4">-4</td>
                            <td><input data-setter="x" type="radio" name="x1" value="-3" id="-3">-3</td>
                        </tr>
                        <tr>
                            <td><input data-setter="x" type="radio" name="x1" value="-2" id="-2">-2</td>
                            <td><input data-setter="x" type="radio" name="x1" value="-1" id="-1">-1</td>
                            <td><input data-setter="x" type="radio" name="x1" value="0" id="0">0</td>
                        </tr>
                        <tr>
                            <td><input data-setter="x" type="radio" name="x1" value="1" id="1">1</td>
                            <td><input data-setter="x" type="radio" name="x1" value="2" id="2">2</td>
                            <td><input data-setter="x" type="radio" name="x1" value="3" id="3">3</td>
                        </tr>

                    </table>
                    <input type="hidden" class="invisible" name="x" id="x">

                </div>

                <div >
                    <p class="title"><label for="Y"> Значение Y </label></p>
                    <p><input class="input_Y" id="y" type="text" name="y" placeholder="(-3 .. 3)"><br></p>
                </div>

                <div >
                    <p class="title"><label for="RSelect"> Значение R </label></p>
                    <p>
                        <select class="input_R" id="rSelect" type="text" name="r">  <!--Supplement an id here instead of using 'name'-->
                            <option value="0" selected>выберите R</option>
                            <option value="1" >1</option>
                            <option value="1.5">1.5</option>
                            <option value="2">2</option>
                            <option value="2.5">2.5</option>
                            <option value="3">3</option>
                        </select>
                    </p>

                </div>

                <div class="block invisible" id="errors-area" style="box-shadow: none; border: 2px solid crimson"></div>
                <div class="block invisible" id="errors-area-canvas" style="box-shadow: none; border: 2px solid crimson"></div>

            </div>
            <button class="region" type="submit" id="submit-button">IMMA_CHARGIN_MAH_LAZER</button>

            <div class="switch" align="right" onclick="aaaaaaaaaaaaaa()">
                <input type="checkbox" align="right" id="switch-1" name="switch-1" class="switch-check">
                <label for="switch-1">сделать красиво?</label>
            </div>

        </form>
    </div>

</section>

<script src="graphpicker.js"></script>
<script src="script.js"></script>
<script src="checkSVG.js"></script>


<script>
    function aaaaaaaaaaaaaa() {
        let head = document.head,
            link = document.createElement('link');
        link.rel = 'stylesheet';
        // проверяем значение из localStorage если dark то темная тема
        if (localStorage.getItem('themeStyle') === 'dark') {
            link.href = 'stylesheet-dark.css'; // ссылка на темный стиль
            document.getElementById('switch-1').setAttribute('checked', true); // переключаем чекбокс в положение "темная тема"
        }
        // по умолчанию светлая тема
        else {
            link.href = 'stylesheet-light.css'; // ссылка на светлый стиль
        }
        head.appendChild(link); // вставляем <link rel="stylesheet" href="light|dark.css"> в шапку страницы между темаги head


        // событие при переключении чекбокса
        document.getElementById('switch-1').addEventListener('change', ev => {
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

<footer >
    <p class="info left">
        Санкт-Петербург, 2019
    </p>
    <p class="info right">


    </p>
    <div style="clear: left"></div>

</footer>

</body>
</html>