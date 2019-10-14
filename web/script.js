(function validate() {


    const xDefaultValues = [-5, -4, -3, -2, -1, 0, 1, 2, 3];
    const selectDefaultValues = [1, 1.5, 2, 2.5, 3];

    let canvas = document.getElementById("graph-canvas");
    let errorsArea = document.getElementById("errors-area");
    let submitButton = document.getElementById("submit-button");
    // let xRadioButtons = document.querySelectorAll("[data-selector='x']");
    let xRadioButtons = document.querySelectorAll("[data-setter='x']");
    let X = document.getElementById('x');
    let yText = document.getElementById("y");
    let rSelect = document.getElementById("rSelect");
    let errorsAreaCanvas = document.getElementById("errors-area-canvas");

    errorsAreaCanvas.classList.add("invisible");

    rSelect.addEventListener("change", function(){
        graphpicker.setScale(+rSelect.value);

    });

    let graphpicker = new GraphPicker(canvas);

    graphpicker.setListener(onGraphClicked);

    function onGraphClicked(x, y) {
        errorsAreaCanvas.classList.add("invisible");
        let elem = document.getElementsByTagName('form')[0];
        let xVal = document.getElementById('x'),
            yVal = document.getElementById('y'),
            RVal = document.getElementById('rSelect');

        if (parseFloat(RVal.value) === 0){
            errorsAreaCanvas.innerText = "Не задано значение R.";
            errorsAreaCanvas.classList.remove("invisible");
            return;
        }

        let st = document.getElementById('switch-1');
        if(st.checked)
            st.value = 'on';
        else
            st.value = '';

        xVal.value = x;
        yVal.value = y;
        elem.submit();
        xVal.value = "";
        yVal.value = "";
    }

    submitButton.addEventListener("click", onSubmit);

    let errorsText = "";

    function onSubmit(event) {
        if (!check()) {
            event.preventDefault();
            errorsArea.innerText = errorsText;
            if (errorsText != null)
                errorsArea.classList.remove("invisible");
            else
                errorsArea.classList.add("invisible");

            errorsText = "";
        }
    }

    function check() {
        //checking x
        let selected = null;
        for (let i = 0; i < xRadioButtons.length; i++) {
            if (xRadioButtons[i].checked) {

                if (xDefaultValues.indexOf(+xRadioButtons[i].value) === -1)   {
                    errorsText += "Уважаемые хакеры!\n Не стоит ломать это,\n оно прекрасно сломается " +
                        "\nи без Вашего участия.\n Спасибо!\n";
                }

                selected = xRadioButtons[i].value;
                X.value = selected;
            }
        }
        if (!selected) {
            errorsText += "Следует выбрать X\n";
        }

        //checking y
        yText.value = yText.value.trim();

        if (yText.value.length === 0) {
            errorsText += "Поле Y обязательно\n";
        }
        if (yText.value.length >= 10) {
            errorsText += "Значение координаты \nY некорректно\n";
        }
        let yTextValue = yText.value.replace(',', '.');
        if (isNaN(yTextValue)) {
            errorsText += "В поле Y следует\n ввести число\n";
        }
        let val = +yText.value;
        if (val <= -3 || val >= 3) {
            errorsText += 'Y должен лежать в (-3 ; 3)\n';
        }

        //checking r as text
        // rText.value = rText.value.trim();
        //
        // if (rText.value.length === 0) {
        //     errorsText += "Поле R обязательно\n";
        // }
        // if (rText.value.length >= 10) {
        //     errorsText += "Значение радиуса\n R некорректно\n";
        // }
        //
        // let rTextValue = rText.value.replace(',', '.');
        // if (isNaN(rTextValue)) {
        //     errorsText += "В поле R следует\n ввести число\n";
        // }
        // let v = +rText.value;
        // if (v <= 1 || v >= 4) {
        //     errorsText += 'R должен лежать в (1 ; 4)';
        // }
        // if (errorsText !== "")
        //     return false;
        // return true;

        let pr = 0;

        for (let i = 0; i < selectDefaultValues.length; i++) {
            if (parseFloat(rSelect.value) === selectDefaultValues[i]) {
                pr = 1;
                selected = rSelect.value;
            }
        }

        if (pr !== 1) {
            errorsText += "Введите корректное R.";
            return false;
        }

        if (errorsText !== "")
            return false;
        return true;
    }
})();