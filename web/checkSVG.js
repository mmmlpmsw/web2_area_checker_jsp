function clickCanvas() {
    let errorsAreaCanvas = document.getElementById("errors-area-canvas");
    let svg = document.getElementsByTagName('svg')[0];
    let R = document.getElementById("rSelect");
    let event = window.event;
    errorsAreaCanvas.classList.add("invisible");

    function getCursorPosition(event, svgElement) {
        let svgPoint = svgElement.createSVGPoint();

        svgPoint.x = event.clientX;
        svgPoint.y = event.clientY;

        return svgPoint.matrixTransform(svgElement.getScreenCTM().inverse());
    }

    let cursor = getCursorPosition(event, svg);


    if (parseFloat(R.value) === 0){
        errorsAreaCanvas.innerText = "Не задано значение R.";
        errorsAreaCanvas.classList.remove("invisible");
        return;
    } else
   /* if (parseFloat(R.value) !== 0)*/ {
        errorsAreaCanvas.classList.add("invisible");
        let x1 = (cursor.x - 500)*R.value / 400,
            y1 = (500 - cursor.y)*R.value / 400,
            a = x1 + parseFloat(R.value);
        if(x1 <= 0 && y1 >= 0 && y1 <= a){
            drawPoint(cursor.x, cursor.y, true);
            send();
            return;
        }
        if(x1 >= 0 && y1 >= 0 && (x1*x1 + y1*y1) <= R.value*R.value/4 ){
            drawPoint(cursor.x, cursor.y, true);
            send();
            return;
        }
        if(x1 <= 0 && y1 <= 0 && x1 >= -R.value && y1 >= -R.value/2){
            drawPoint(cursor.x, cursor.y, true);
            send();
            return;
        }

        drawPoint(cursor.x, cursor.y, false);
        send();
        return;

    }

    function send() {
        let x1 = (cursor.x - 500)*R.value / 400,
            y1 = (500 - cursor.y)*R.value / 400;
        let elem = document.getElementsByTagName('form')[0];
        let xVal = document.getElementById('x'),
            yVal = document.getElementById('y'),
            RVal = document.getElementById('rSelect');
        xVal.value = x1;
        yVal.value = y1;
        elem.submit();
        xVal.value = "";
        yVal.value = "";
    }

}



function setPosition(x, y) {
    let s = "translate(" + x.toString() + "," + y.toString() + ")";
    return s;
}


function drawPoint(x, y, isArea){
    let svg = document.getElementsByTagName("svg")[0];
    let pictureT = document.createElement("image");
    pictureT.setAttribute("href", "true.png");
    pictureT.setAttribute("x", x-20+"px");
    pictureT.setAttribute("y", y-20+"px");
    pictureT.setAttribute("width", '40px');
    pictureT.setAttribute("height", '40px');

    var newElement = document.createElementNS("http://www.w3.org/2000/svg", 'path'); //Create a path in SVG namespace
    newElement.setAttribute("d","M 0 0 L 3 3"); //Set path data

    if(isArea){
        svg.appendChild(pictureT);
        svg.appendChild(pictureT);
        // newElement.style.stroke = "green";
    } else {
        newElement.style.stroke = "red";
        svg.appendChild(newElement);
    }

    newElement.style.strokeWidth = "5px"; //Set stroke width
    newElement.setAttribute("transform", setPosition(x, y));
    // svg.appendChild(newElement);

}