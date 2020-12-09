document.body.addEventListener('ajax:success', function (event, data, status, xhr) {
    var response = event.detail[0];
    if (response.quantity > 0) {
        document.querySelector(".product#id_" + response.id + ">td.quantity").innerHTML = response.quantity;
        document.querySelector(".product#id_" + response.id + ">td.product_total").innerHTML = response.product_total;
    } else {
        const row = document.querySelector(".product#id_" + response.id);
        row.parentNode.removeChild(row);
    }
    document.querySelector(".subtotal").innerHTML = response.subtotal;
    document.querySelector(".taxes").innerHTML = response.taxes;
    document.querySelector(".total").innerHTML = response.total;
})
