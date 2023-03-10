<%-- 
    Document   : shopping
    Created on : Sep 27, 2022, 7:45:49 AM
    Author     : Admin
--%>

<%@page import="com.bookstore.Book.BookShop"%>
<%@page import="com.bookstore.Author.Author"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.Format.MoneyFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">


    <!-- molla/category-boxed.html  22 Nov 2019 10:03:00 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>THE5 Bookstore</title>
        <meta name="keywords" content="HTML5 Template">
        <meta name="description" content="Molla - Bootstrap eCommerce Template">
        <meta name="author" content="p-themes">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="assets/images/icons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/images/icons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/icons/favicon-16x16.png">
        <link rel="manifest" href="assets/images/icons/site.html">
        <link rel="mask-icon" href="assets/images/icons/safari-pinned-tab.svg" color="#666666">
        <link rel="shortcut icon" href="assets/images/icons/favicon.ico">
        <meta name="apple-mobile-web-app-title" content="Molla">
        <meta name="application-name" content="Molla">
        <meta name="msapplication-TileColor" content="#cc9966">
        <meta name="msapplication-config" content="assets/images/icons/browserconfig.xml">
        <meta name="theme-color" content="#ffffff">
        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">
    </head>

    <style>
        .navigation-item.active {
            color:red
        }
    </style>

    <body>
        <div class="page-wrapper">
            <jsp:include page="header.jsp"></jsp:include>
            <main class="main">
                <!--                    <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                                        <div class="container">
                                            <h1 class="page-title">Boxed No Sidebar<span>Shop</span></h1>
                                        </div> End .container 
                                    </div> End .page-header -->
                <nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
                    <div class="container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Shop</a></li>
                            <li class="breadcrumb-item"><a href="#">
                                    <%
                                        String categoryName = request.getParameter("categoryName");
                                        String searchkey = request.getParameter("searchKey");
                                        if (searchkey != null) {
                                    %>
                                    Search: <%=searchkey%>
                                    <%
                                    } else if (categoryName != null) {
                                    %>
                                    <%=categoryName%>
                                    <%
                                    } else {
                                    %>
                                    <% out.print("All"); %>
                                    <%
                                        }
                                    %>

                                </a></li>
                        </ol>
                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="page-content">
                    <div class="container">
                        <div class="products">
                            <div class="toolbox">
                                <div class="toolbox-left">
                                    <a href="#" class="sidebar-toggler"><i class="icon-bars"></i>Filters</a>
                                </div><!-- End .toolbox-left -->
                            </div>
                        </div><!-- End .toolbox -->
                        <c:if test='${checkQuanityAddShop1 == "Store has no more quantity of this book left. We apologize for the inconvenience."}'>
                            <div class="alert2">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                                <p align="center" style="color: white"> Store has no more quantity of this book left. We apologize for the inconvenience. </p> 
                            </div>
                        </c:if>
                        <c:if test='${checkQuanityAddShop2 == "Store has no more quantity of this book left. We apologize for the inconvenience."}'>
                            <div class="alert2">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                                <p align="center" style="color: white"> Store has no more quantity of this book left. We apologize for the inconvenience. </p> 
                            </div>
                        </c:if>
                        <c:if test='${checkQuanityAddShop3 == "Store has no more quantity of this book left. We apologize for the inconvenience."}'>
                            <div class="alert2">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                                <p align="center" style="color: white"> Store has no more quantity of this book left. We apologize for the inconvenience. </p> 
                            </div>
                        </c:if>

                        <style>
                            p {
                                text-align: center;
                            }
                        </style>
                        <div class="row" id="content">
                            <c:forEach items="${listAll}" var="listAll" >
                                <div class="col-6 col-md-4 col-lg-4 col-xl-3">
                                    <div class="product">
                                        <figure class="product-media">
                                             <c:if test="${listAll.discountPercent > 0}">
                                                    <span class="product-label label-new">Discount ${listAll.discountPercent}%</span>
                                                </c:if>

                                            <a href="detail?pbookCode=${listAll.bookCode}&categoryBook=${listAll.cateName}">
                                                <img style="width: 	277px; height: 	375px;" src="${listAll.image}" alt="Product image" class="product-image">
                                            </a>

                                            <div class="product-action action-icon-top">
                                                <a href="${pageContext.request.contextPath }/shoppingpage?&action=addToCart&bookCode=${listAll.bookCode}&cateName=${listAll.cateName}&index=${i}" class="btn-product btn-cart"><span>add to cart</span></a>
                                            </div><!-- End .product-action -->
                                        </figure><!-- End .product-media -->

                                        <div class="product-body">
                                            <div class="product-cat">
                                                <a href="">${listAll.cateName}</a>
                                            </div><!-- End .product-cat -->
                                            <h3 class="product-title"><a href="detail?pbookCode=${listAll.bookCode}&categoryBook=${listAll.cateName}">${listAll.bookName}</a></h3><!-- End .product-title -->
                                                <c:if test="${listAll.discountPercent == 0}">
                                                <div class="product-price">
                                                    Price <fmt:formatNumber value="${listAll.buyPrice}" pattern=" #,##0 VND" />

                                                </div><!-- End .product-price -->
                                            </c:if>
                                            <c:if test="${listAll.discountPercent > 0}">
                                                <div class="product-price" style="text-decoration: line-through">
                                                    Old Price: <fmt:formatNumber value="${listAll.buyPrice}" pattern=" #,##0 VND" />
                                                </div><!-- End .product-price -->
                                                <div class="product-price">
                                                    Sale Price: <fmt:formatNumber value="${listAll.buyPrice- (listAll.discountPercent *listAll.buyPrice/100)}" pattern=" #,##0 VND" />
                                                </div><!-- End .product-price -->
                                            </c:if>

                                            <div class="product-author">
                                                Author: 
                                                <c:if test="${listAll.getAuthorNum()==1}">
                                                    ${listAll.author}
                                                </c:if>
                                                <c:if test="${listAll.getAuthorNum()!=1}">

                                                    <div class="product">
                                                        <c:forTokens var="token" items="${listAll.author}" delims=",">
                                                            <li><c:out value="${token}"/></li>
                                                            </c:forTokens>
                                                    </div><!-- End .ratings -->
                                                </c:if>
                                            </div><!-- End .rating-container -->
                                        </div><!-- End .product-body -->
                                    </div><!-- End .product -->
                                </div><!-- End .col-sm-6 col-lg-4 col-xl-3 -->
                            </c:forEach>


                            <div class="load-more-container text-center">
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <a href="SearchController?index=${i}&searchKey=${searchKey}" class="btn btn-outline-darker btn-load-more">${i} <i class="icon-refresh"></i></a>
                                        <c:set var="i" value="${i}"></c:set>
                                    </c:forEach>
                            </div><!-- End .load-more-container -->
                        </div><!-- End .products -->

                        <div class="sidebar-filter-overlay"></div>
                    </div>
                </div><!-- End .page-content -->
                <div class="sidebar-filter-overlay"></div><!-- End .sidebar-filter-overlay -->
                <aside class="sidebar-shop sidebar-filter">
                    <div class="sidebar-filter-wrapper">
                        <div class="widget widget-clean">
                            <label><i class="icon-close"></i>Filters</label>
                            <a href="#" class="sidebar-filter-clear">Clean All</a>
                        </div><!-- End .widget -->
                        <div class="widget widget-collapsible">
                            <h3 class="widget-title">
                                <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="true" aria-controls="widget-1">
                                    Category
                                </a>
                            </h3><!-- End .widget-title -->

                            <div class="collapse show" id="widget-1">
                                <div class="widget-body">
                                    <div class="filter-items filter-items-count">
                                        <div class="filter-item">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="cat-1">
                                                <label class="custom-control-label" for="cat-1">Art - Literary </label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .filter-item -->

                                        <div class="filter-item">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="cat-2">
                                                <label class="custom-control-label" for="cat-2">Comics</label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .filter-item -->

                                        <div class="filter-item">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="cat-3">
                                                <label class="custom-control-label" for="cat-3">Textbook - Syllabus </label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .filter-item -->

                                        <div class="filter-item">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="cat-4">
                                                <label class="custom-control-label" for="cat-4">Novel </label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .filter-item -->

                                        <div class="filter-item">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="cat-5">
                                                <label class="custom-control-label" for="cat-5">Foreign language </label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .filter-item -->

                                        <div class="filter-item">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="cat-6">
                                                <label class="custom-control-label" for="cat-6">Science </label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .filter-item -->

                                        <div class="filter-item">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="cat-7">
                                                <label class="custom-control-label" for="cat-7">Horror </label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .filter-item -->

                                    </div><!-- End .filter-items -->
                                </div><!-- End .widget-body -->
                            </div><!-- End .collapse -->
                        </div><!-- End .widget -->

                        <div class="widget widget-collapsible">
                            <h3 class="widget-title">
                                <a data-toggle="collapse" href="#widget-5" role="button" aria-expanded="true" aria-controls="widget-5">
                                    Price
                                </a>
                            </h3><!-- End .widget-title -->

                            <div class="collapse show" id="widget-5">
                                <div class="widget-body">
                                    <div class="filter-price">
                                        <div class="filter-price-text">
                                            Price Range:
                                            <span id="filter-price-range"></span>
                                        </div><!-- End .filter-price-text -->

                                        <div id="price-slider"></div><!-- End #price-slider -->
                                    </div><!-- End .filter-price -->
                                    <button onclick="handleClick()" >Sort</button>
                                    <script>
                                        function handleClick() {
                                            const list = document.querySelectorAll(".noUi-tooltip");
                                            const test = document.querySelectorAll(".custom-control-input");
                                            let price;
                                            if (list.length > 1) {

                                                price = list[list.length - 1].innerText.replace("VND", "");
                                            }
                                            const categoryLists = Array.from(test).map(v => v.checked);
                                            $.ajax({url: "shopping?index=1", data: {price: price, categories: categoryLists.join("-")}, success: function (result) {
                                                    console.log({result})

                                                    const htmlString = result.map((o) => `
                                                    <div class=\"col-6 col-md-4 col-lg-4 col-xl-3\">
                                                        <div class=\"product\">
                                                            <figure class=\"product-media\">
                                                                \${o.discountPercent > 1 ? "<span class=\"product-label label-new\">Discount</span>" : ""}
                                                                <a href=\"detail?pbookCode=\${o.bookCode}&categoryBook=\${o.cateName}\">
                                                                    <img style="width:277px; height:375px;" src="\${o.image}" alt="Product image" class="product-image">
                                                                </a>
                                                                <div class=\"product-action\">
                                                                    <a href=\"${pageContext.request.contextPath }/cart?&action=addToCart&bookCode=\${o.bookCode}\" class=\"btn-product btn-cart\"><span>Add to Cart</span></a>
                                                                </div>
                                                            </figure>
                                                            <div class=\"product-body\">
                                                                <div class=\"product-cat\">
                                                                    <a href="">\${o.cateName}</a>
                                                                </div>
                                                                <h3 class="product-title">
                                                                    <a href="detail?pbookCode=\${o.bookCode}&categoryBook=\${o.cateName}">\${o.bookName}</a>
                                                                </h3>
                                                                \${o.discountPercent == 0 ? "<div class=\"product-price\">Price: " + o.buyPrice + "</div>" :"<div class=\"product-price\">Sale Price: " + (o.buyPrice-(o.discountPercent *o.buyPrice/100)) + "</div>"}
                                                                <div class="product-author">Author: \${o.authorNum == 1 ? o.author : ""+o.author+""}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                            `);
                                                    console.log({htmlString});
                                                    $("#content").html(htmlString);

                                                }
                                            });
                                        }

                                    </script>
                                </div><!-- End .widget-body -->
                            </div><!-- End .collapse -->
                        </div><!-- End .widget -->
                    </div><!-- End .sidebar-filter-wrapper -->
                </aside><!-- End .sidebar-filter -->
            </main><!-- End .main -->

            <jsp:include page="footer.jsp"></jsp:include>
            </div><!-- End .page-wrapper -->
            <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>



            <!-- Plugins JS File -->
        <%
            String nullProduct = (String) request.getAttribute("nullProduct");
            if (nullProduct != null) {
        %>
        <h3 color="red" >No Product was found</h3>
        <%
            }
        %>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.hoverIntent.min.js"></script>
        <script src="assets/js/jquery.waypoints.min.js"></script>
        <script src="assets/js/superfish.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wNumb.js"></script>
        <script src="assets/js/bootstrap-input-spinner.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/nouislider.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script>
                                        // Get all elements with class="closebtn"
                                        var close = document.getElementsByClassName("closebtn");
                                        var i;

                                        // Loop through all close buttons
                                        for (i = 0; i < close.length; i++) {
                                            // When someone clicks on a close button
                                            close[i].onclick = function () {

                                                // Get the parent of <span class="closebtn"> (<div class="alert">)
                                                var div = this.parentElement;

                                                // Set the opacity of div to 0 (transparent)
                                                div.style.opacity = "0";

                                                // Hide the div after 600ms (the same amount of milliseconds it takes to fade out)
                                                setTimeout(function () {
                                                    div.style.display = "none";
                                                }, 600);
                                            }
                                        }
        </script>
    </body>

    <style>
        .alert2 {
            padding: 20px;
            background-color: #f44336; /* Red */
            color: white;
            margin-bottom: 15px;
        }

        /* The close button */
        .closebtn {
            margin-left: 15px;
            color: white;
            font-weight: bold;
            float: right;
            font-size: 22px;
            line-height: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        /* When moving the mouse over the close button */
        .closebtn:hover {
            color: black;
        }

    </style>

    <style>
        .alert {
            opacity: 1;
            transition: opacity 0.6s; /* 600ms to fade out */
        }
    </style>



    <!-- molla/category-boxed.html  22 Nov 2019 10:03:02 GMT -->
</html>