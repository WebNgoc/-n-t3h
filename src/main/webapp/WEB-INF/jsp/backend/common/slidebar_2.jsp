</div>
</div>


</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
<script>

    $(document).ready(function () {
        $('.nav-link.active .sub-menu').slideDown();
        // $("p").slideUp();

        $('#sidebar-menu .arrow').click(function () {
            $(this).parents('li').children('.sub-menu').slideToggle();
            $(this).toggleClass('fa-angle-right fa-angle-down');
        });

        $("input[name='checkall']").click(function () {
            var checked = $(this).is(':checked');
            $('.table-checkall tbody tr td input:checkbox').prop('checked', checked);
        });
    });
</script>
