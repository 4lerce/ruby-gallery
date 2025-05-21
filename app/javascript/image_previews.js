document.addEventListener('DOMContentLoaded', function () {
    const fileInput = document.getElementById('image-upload-input');
    const imagePreview = document.getElementById('image-preview');

    if (fileInput && imagePreview) {
        fileInput.addEventListener('change', function (event) {
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    imagePreview.src = e.target.result;
                    imagePreview.style.display = 'block';
                };

                reader.readAsDataURL(file);
            } else {
                imagePreview.src = '#';
                imagePreview.style.display = 'none';
            }
        });
    }
});
