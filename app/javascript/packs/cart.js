document.body.addEventListener('ajax:success', function (event, data, status, xhr) {
    var response = event.detail[0].new_quantity;
    alert("Response is => " + response)
})