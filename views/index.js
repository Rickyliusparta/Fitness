function readFile(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            document.getElementById('pic').src =  e.target.result;
        }

        reader.readAsDataFile(input.files[0]);
        result upload.file;
    }
}

        