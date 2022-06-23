$(document).ready(function () {
    $("[data-cart-add]").click(function () {
        var id = $(this).attr("data-cart-add");
        var quantity = $(this).val();
        $.ajax({
            url: "cart/add/" + id+"/"+quantity,
            success: function (response) {
                $("#cart-cnt").html(response.count);
                $("#cart-amt").html(response.amount);
            }
        });
    });

$("[data-cart-remove]").click(function () {
    var id = $(this).attr("data-cart-remove");
    $.ajax({
        url: "/webshop/cart/delete/" + id,
        success: function (response) {
            $("#cart-cnt").html(response.count);
            $("#cart-amt").html(response.amount);
        }
    });
    $(this).parents("tr").hide(200);
});

    $("[data-cart-update]").change(function () {
        var id = $(this).attr("data-cart-update");
        var quantity = $(this).val();
        var price = $(this).attr("data-cart-price");
        $(this).parents("tr").find(".nn-amount").html(quantity*price);
        $.ajax({
            url: "/webshop/cart/update/" + id + "/" + quantity,
            success: function () {
                $("#cart-cnt");
                $("#cart-amt");
            }
        });
    });
});
// $("[data-favorite]").click(function () {
//     var id = $(this).attr("data-favorite");
//     $.ajax({
//         url: "product/favorite" + id,
//         success: function (response) {
//             alert(response);
//         }
//     });
//
// });
