<%@page pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/solid.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <script src="/resources/js/jquery-ui.js"></script>

    <title>Admintrator</title>
    <style>
        a {
            color: #787272;
        }

        a:hover {
            text-decoration: none;
        }

        .topnav .navbar-brand {
            width: 15rem;
            padding-left: 1rem;
            padding-right: 1rem;
            margin: 0;
            font-size: 1rem;
            font-weight: 700;
        }

        .topnav {
            padding-left: 0;
            padding: 10px 0px;
            z-index: 1039;
        }

        #sidebar-toggle {
            outline: none;
            border: 0;
            background-color: transparent;
        }

        .plus-icon {
            font-size: 25px;
            color: #8f8f8f;
        }

        .nav-right {
            flex: 1;
            justify-content: space-between;
            display: flex;
        }

        #sidebar {
            width: 15rem;
            height: 100vh;
            z-index: 500;
            padding-top: 3.625rem;
            position: fixed;
            top: 0px;
            left: 0;
        }

        #wp-content {
            flex: auto;
            /* height: calc(100vh - 58px); */
            min-height: 100vh;
            padding-top: 3.625rem;
            padding-left: 15rem;
        }

        #content {
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #content .card-header {
            text-transform: uppercase;
        }

        .nav-fixed .topnav {
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            z-index: 1030;
        }

        ul#sidebar-menu * {
            list-style: none;
            padding-left: 0;
        }

        #sidebar-menu {
            padding: 20px 15px;
        }

        .nav-link {
            display: block;
            padding: .5rem 1rem;
            position: relative;
        }

        .nav-link.active > a,
        .nav-link:hover > li > a {
            color: #0061f2;
        }

        .nav-link > li > a > i {
            color: #787272;
            font-size: 18px;
        }

        .nav-link .arrow {
            position: absolute;
            right: 10px;
            cursor: pointer;
        }

        #sidebar-menu .sub-menu {
            padding-left: 22px;
            border-left: 1px dashed #b8b8b8;
            margin-left: 6px;
            display: none;
        }

        #sidebar-menu .sub-menu li a {
            display: block;
            padding: 5px 0px;
        }

        #page-body {
            background-color: #e5e9f0;
        }

        .form-search {
            width: 300px;
        }

        .table tr td {
            vertical-align: middle;
        }

        .table-checkall input[type='checkbox'] {
            cursor: pointer;
        }

        .analytic a {
            position: relative;
            padding-right: 5px;
            margin-right: 5px;
        }

        .analytic a:not(:last-child):after {
            position: absolute;
            content: '|';
            top: -1px;
            right: -5px;
            color: #8c8c8c;
        }
    </style>
</head>
