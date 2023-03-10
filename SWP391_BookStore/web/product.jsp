<%-- 
    Document   : product.jsp
    Created on : Sep 30, 2022, 7:24:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>THE5 BookStore</title>
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
        <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
        <!-- Main CSS File -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">

        <style>
            .product-content-desc {
                margin-bottom: 0;
                height: 100px;
                overflow: hidden
            }
        </style>

        <style>
            .navigation-item.active {
                color:red
            }
        </style>

    </head>

    <body>
        <div class="page-wrapper">
            <jsp:include page="header.jsp"></jsp:include>S

            <main class="main">
                <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                    <div class="container d-flex align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="shopping?index=1">Shopping</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${detailProduct.bookName}</li>
                        </ol>

                    </div><!-- End .container -->
                </nav><!-- End .breadcrumb-nav -->

                <div class="page-content">
                    <div class="container">
                        <c:if test='${checkQuanityAddProduct1 == "Store has no more quantity of this book left. We apologize for the inconvenience."}'>
                            <div class="alert2">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                                <p align="center" style="color: white"> Store has no more quantity of this book left. We apologize for the inconvenience. </p> 
                            </div>
                        </c:if>
                        <c:if test='${checkQuanityAddProduct2 == "Store has no more quantity of this book left. We apologize for the inconvenience."}'>
                            <div class="alert2">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                                <p align="center" style="color: white"> Store has no more quantity of this book left. We apologize for the inconvenience. </p> 
                            </div>
                        </c:if>
                        <c:if test='${checkQuanityAddProduct3 == "Store has no more quantity of this book left. We apologize for the inconvenience."}'>
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
                        <div class="product-details-top">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="product-gallery product-gallery-vertical">
                                        <div class="row">
                                            <figure class="product-main-image">
                                                <img id="product-zoom" src="${detailProduct.image}" data-zoom-image="" alt="product image">

                                                <a href="#" id="btn-product-gallery" class="btn-product-gallery">
                                                    <i class="icon-arrows"></i>
                                                </a>
                                            </figure><!-- End .product-main-image -->

                                        </div><!-- End .row -->
                                    </div><!-- End .product-gallery -->
                                </div><!-- End .col-md-6 -->

                                <div class="col-md-6">                                 
                                    <div class="product-details">
                                        <h1 class="product-title">${detailProduct.bookName}</h1><!-- End .product-title -->

                                        <div class="discount-price"  style="text-decoration: line-through"  >
                                            Old Price: <fmt:formatNumber value="${detailProduct.buyPrice}" pattern=" #,##0 VND" />
                                        </div><!-- End .product-price -->
                                        <div class="product-price">
                                            Sale Price: <fmt:formatNumber value="${detailProduct.buyPrice-((detailProduct.discountPercent*detailProduct.buyPrice)/100)}" pattern=" #,##0 VND" />
                                        </div>

                                        <c:if test="${detailProduct.qty==0}">
                                            <div style="color: red" class="product-price">
                                                SOLD OUT
                                            </div>
                                        </c:if>       

                                        <div class="product-content">
                                            <p id="product-content-desc" class="product-content-desc">${detailProduct.description}</p>
                                            <button class="btn btn-outline-primary-2" onclick="handleMoreLessClick()">show more/less</button>
                                            <script>
                                                const element = document.getElementById("product-content-desc");
                                                function handleMoreLessClick() {
                                                    console.log({element});
                                                    element.classList.toggle("product-content-desc");
                                                }
                                            </script>
                                        </div><!-- End .product-content -->



                                        <div class="product-details-footer">
                                            <div class="product-cat">
                                                <span>Category:</span>
                                                <a href="category?categoryName=${detailProduct.cateName}">${detailProduct.cateName}</a>
                                            </div><!-- End .product-cat -->
                                        </div>
                                        <div class="product-details-footer">
                                            <div class="product-cat">
                                                <span>Author:</span>
                                                <div class="product">
                                                    <c:forTokens var="token" items="${detailProduct.author}" delims=",">
                                                        <li><c:out value="${token}"/></li>
                                                        </c:forTokens>

                                                </div><!-- End .ratings -->
                                            </div>
                                        </div><!-- End .product-cat -->

                                        <!-- End .product-details-footer -->
                                    </div><!-- End .product-details -->
                                </div><!-- End .col-md-6 -->
                            </div><!-- End .row -->
                        </div><!-- End .product-details-top -->




                        <div class="container">
                            <div class="heading heading-center mb-6">
                                <h2 class="title">Related products</h2><!-- End .title -->
                            </div><!-- End .heading -->

                            <div class="tab-content">
                                <div class="tab-pane p-0 fade show active" id="top-all-tab" role="tabpanel" aria-labelledby="top-all-link">
                                    <div class="products">
                                        <div class="row justify-content-center">
                                            <c:forEach items="${listRecentArrival}" var="listAll" >
                                                <div class="col-6 col-md-4 col-lg-4 col-xl-3">
                                                    <div class="product">
                                                        <figure class="product-media">

                                                            <c:if test="${listAll.discountPercent > 0}">
                                                                <span class="product-label label-new">Discount</span>
                                                            </c:if>

                                                            <a href="detail?pbookCode=${listAll.bookCode}&categoryBook=${listAll.cateName}">
                                                                <img style="width: 	277px; height: 	375px;" src="${listAll.image}" alt="Product image" class="product-image">
                                                            </a>                                             

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
                                                <c:set var="cateName" value="${listAll.cateName}"></c:set>
                                            </c:forEach>
                                        </div><!-- End .row -->
                                    </div><!-- End .products -->
                                </div><!-- .End .tab-pane -->
                            </div><!-- End .row -->
                        </div><!-- End .products -->





                        <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": false, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":1
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":4,
                             "nav": true,
                             "dots": false
                             }
                             }
                             }'>
                        </div><!-- End .owl-carousel -->
                    </div><!-- End .container -->
                </div><!-- End .page-content -->
            </main><!-- End .main -->

            <jsp:include page="footer.jsp"></jsp:include>
            <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>


            <!--        <form action="productpage" method="post">-->
            <!-- Sticky Bar -->
            <div class="sticky-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <figure class="product-media">
                                <a href="product.jsp">
                                    <img src="${detailProduct.image}" alt="Product image">
                                </a>
                            </figure><!-- End .product-media -->
                            <h4 class="product-title"><a href="product.jsp">${detailProduct.bookName}</a></h4><!-- End .product-title -->
                        </div><!-- End .col-6 -->   


                        <div class="col-6 justify-content-end">
                            <div class="product-price">
                                <fmt:formatNumber value="${detailProduct.buyPrice}" pattern=" #,##0 VND" />

                            </div><!-- End .product-price -->

                            <!--                            <div class="product-details-quantity">
                                                            <input type="number" id="sticky-cart-qty" name="txtnumber" class="form-control" value="1" min="1" max="10" step="1" data-decimals="0" required>
                                                        </div> End .product-details-quantity -->
                            <input type="text" name="bookCode" value="${detailProduct.bookCode}" hidden>
                            <input type="text" name="action" value="addToCart" hidden>

                            <div class="product-details-action">
                                <a href="${pageContext.request.contextPath }/productpage?action=addToCart&bookCode=${detailProduct.bookCode}&cateName=${cateName}" class="btn-product btn-cart"><span>add to cart</span></a>
                            </div><!-- End .product-details-action -->

                        </div><!-- End .col-6 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .sticky-bar -->
            <!--        </form>-->




            <!-- Mobile Menu -->
            <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

            <div class="mobile-menu-container">
                <div class="mobile-menu-wrapper">
                    <span class="mobile-menu-close"><i class="icon-close"></i></span>

                    <form action="#" method="get" class="mobile-search">
                        <label for="mobile-search" class="sr-only">Search</label>
                        <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in..." required>
                        <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                    </form>

                    <!--            <nav class="mobile-nav">
                                    <ul class="mobile-menu">
                                        <li class="active">
                                            <a href="index.html">Home</a>
                    
                                            <ul>
                                                <li><a href="index-1.html">01 - furniture store</a></li>
                                                <li><a href="index.html">02 - furniture store</a></li>
                                                <li><a href="index-3.html">03 - electronic store</a></li>
                                                <li><a href="index-4.html">04 - electronic store</a></li>
                                                <li><a href="index-5.html">05 - fashion store</a></li>
                                                <li><a href="index-6.html">06 - fashion store</a></li>
                                                <li><a href="index-7.html">07 - fashion store</a></li>
                                                <li><a href="index-8.html">08 - fashion store</a></li>
                                                <li><a href="index-9.html">09 - fashion store</a></li>
                                                <li><a href="index-10.html">10 - shoes store</a></li>
                                                <li><a href="index-11.html">11 - furniture simple store</a></li>
                                                <li><a href="index-12.html">12 - fashion simple store</a></li>
                                                <li><a href="index-13.html">13 - market</a></li>
                                                <li><a href="index-14.html">14 - market fullwidth</a></li>
                                                <li><a href="index-15.html">15 - lookbook 1</a></li>
                                                <li><a href="index-16.html">16 - lookbook 2</a></li>
                                                <li><a href="index-17.html">17 - fashion store</a></li>
                                                <li><a href="index-18.html">18 - fashion store (with sidebar)</a></li>
                                                <li><a href="index-19.html">19 - games store</a></li>
                                                <li><a href="index-20.html">20 - book store</a></li>
                                                <li><a href="index-21.html">21 - sport store</a></li>
                                                <li><a href="index-22.html">22 - tools store</a></li>
                                                <li><a href="index-23.html">23 - fashion left navigation store</a></li>
                                                <li><a href="index-24.html">24 - extreme sport store</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="category.html">Shop</a>
                                            <ul>
                                                <li><a href="category-list.html">Shop List</a></li>
                                                <li><a href="category-2cols.html">Shop Grid 2 Columns</a></li>
                                                <li><a href="category.html">Shop Grid 3 Columns</a></li>
                                                <li><a href="category-4cols.html">Shop Grid 4 Columns</a></li>
                                                <li><a href="category-boxed.html"><span>Shop Boxed No Sidebar<span class="tip tip-hot">Hot</span></span></a></li>
                                                <li><a href="category-fullwidth.html">Shop Fullwidth No Sidebar</a></li>
                                                <li><a href="product-category-boxed.html">Product Category Boxed</a></li>
                                                <li><a href="product-category-fullwidth.html"><span>Product Category Fullwidth<span class="tip tip-new">New</span></span></a></li>
                                                <li><a href="cart.html">Cart</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                                <li><a href="#">Lookbook</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="product.jsp" class="sf-with-ul">Product</a>
                                            <ul>
                                                <li><a href="product.jsp">Default</a></li>
                                                <li><a href="product-centered.html">Centered</a></li>
                                                <li><a href="product-extended.html"><span>Extended Info<span class="tip tip-new">New</span></span></a></li>
                                                <li><a href="product-gallery.html">Gallery</a></li>
                                                <li><a href="product-sticky.html">Sticky Info</a></li>
                                                <li><a href="product-sidebar.html">Boxed With Sidebar</a></li>
                                                <li><a href="product-fullwidth.html">Full Width</a></li>
                                                <li><a href="product-masonry.html">Masonry Sticky Info</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">Pages</a>
                                            <ul>
                                                <li>
                                                    <a href="about.html">About</a>
                    
                                                    <ul>
                                                        <li><a href="about.html">About 01</a></li>
                                                        <li><a href="about-2.html">About 02</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="contact.html">Contact</a>
                    
                                                    <ul>
                                                        <li><a href="contact.html">Contact 01</a></li>
                                                        <li><a href="contact-2.html">Contact 02</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="login.html">Login</a></li>
                                                <li><a href="faq.html">FAQs</a></li>
                                                <li><a href="404.html">Error 404</a></li>
                                                <li><a href="coming-soon.html">Coming Soon</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="blog.html">Blog</a>
                    
                                            <ul>
                                                <li><a href="blog.html">Classic</a></li>
                                                <li><a href="blog-listing.html">Listing</a></li>
                                                <li>
                                                    <a href="#">Grid</a>
                                                    <ul>
                                                        <li><a href="blog-grid-2cols.html">Grid 2 columns</a></li>
                                                        <li><a href="blog-grid-3cols.html">Grid 3 columns</a></li>
                                                        <li><a href="blog-grid-4cols.html">Grid 4 columns</a></li>
                                                        <li><a href="blog-grid-sidebar.html">Grid sidebar</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#">Masonry</a>
                                                    <ul>
                                                        <li><a href="blog-masonry-2cols.html">Masonry 2 columns</a></li>
                                                        <li><a href="blog-masonry-3cols.html">Masonry 3 columns</a></li>
                                                        <li><a href="blog-masonry-4cols.html">Masonry 4 columns</a></li>
                                                        <li><a href="blog-masonry-sidebar.html">Masonry sidebar</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#">Mask</a>
                                                    <ul>
                                                        <li><a href="blog-mask-grid.html">Blog mask grid</a></li>
                                                        <li><a href="blog-mask-masonry.html">Blog mask masonry</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#">Single Post</a>
                                                    <ul>
                                                        <li><a href="single.html">Default with sidebar</a></li>
                                                        <li><a href="single-fullwidth.html">Fullwidth no sidebar</a></li>
                                                        <li><a href="single-fullwidth-sidebar.html">Fullwidth with sidebar</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="elements-list.html">Elements</a>
                                            <ul>
                                                <li><a href="elements-products.html">Products</a></li>
                                                <li><a href="elements-typography.html">Typography</a></li>
                                                <li><a href="elements-titles.html">Titles</a></li>
                                                <li><a href="elements-banners.html">Banners</a></li>
                                                <li><a href="elements-product-category.html">Product Category</a></li>
                                                <li><a href="elements-video-banners.html">Video Banners</a></li>
                                                <li><a href="elements-buttons.html">Buttons</a></li>
                                                <li><a href="elements-accordions.html">Accordions</a></li>
                                                <li><a href="elements-tabs.html">Tabs</a></li>
                                                <li><a href="elements-testimonials.html">Testimonials</a></li>
                                                <li><a href="elements-blog-posts.html">Blog Posts</a></li>
                                                <li><a href="elements-portfolio.html">Portfolio</a></li>
                                                <li><a href="elements-cta.html">Call to Action</a></li>
                                                <li><a href="elements-icon-boxes.html">Icon Boxes</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav> End .mobile-nav -->

                    <div class="social-icons">
                        <a href="#" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
                        <a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
                        <a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
                        <a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
                    </div><!-- End .social-icons -->
                </div><!-- End .mobile-menu-wrapper -->
            </div><!-- End .mobile-menu-container -->

            <!-- Sign in / Register Modal -->
            <div class="modal fade" id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icon-close"></i></span>
                            </button>

                            <div class="form-box">
                                <div class="form-tab">
                                    <ul class="nav nav-pills nav-fill" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="signin-tab" data-toggle="tab" href="#signin" role="tab" aria-controls="signin" aria-selected="true">Sign In</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="false">Register</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="tab-content-5">
                                        <div class="tab-pane fade show active" id="signin" role="tabpanel" aria-labelledby="signin-tab">
                                            <form action="#">
                                                <div class="form-group">
                                                    <label for="singin-email">Username or email address *</label>
                                                    <input type="text" class="form-control" id="singin-email" name="singin-email" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-group">
                                                    <label for="singin-password">Password *</label>
                                                    <input type="password" class="form-control" id="singin-password" name="singin-password" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-footer">
                                                    <button type="submit" class="btn btn-outline-primary-2">
                                                        <span>LOG IN</span>
                                                        <i class="icon-long-arrow-right"></i>
                                                    </button>

                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="signin-remember">
                                                        <label class="custom-control-label" for="signin-remember">Remember Me</label>
                                                    </div><!-- End .custom-checkbox -->

                                                    <a href="#" class="forgot-link">Forgot Your Password?</a>
                                                </div><!-- End .form-footer -->
                                            </form>
                                            <div class="form-choice">
                                                <p class="text-center">or sign in with</p>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <a href="#" class="btn btn-login btn-g">
                                                            <i class="icon-google"></i>
                                                            Login With Google
                                                        </a>
                                                    </div><!-- End .col-6 -->
                                                    <div class="col-sm-6">
                                                        <a href="#" class="btn btn-login btn-f">
                                                            <i class="icon-facebook-f"></i>
                                                            Login With Facebook
                                                        </a>
                                                    </div><!-- End .col-6 -->
                                                </div><!-- End .row -->
                                            </div><!-- End .form-choice -->
                                        </div><!-- .End .tab-pane -->
                                        <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                            <form action="#">
                                                <div class="form-group">
                                                    <label for="register-email">Your email address *</label>
                                                    <input type="email" class="form-control" id="register-email" name="register-email" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-group">
                                                    <label for="register-password">Password *</label>
                                                    <input type="password" class="form-control" id="register-password" name="register-password" required>
                                                </div><!-- End .form-group -->

                                                <div class="form-footer">
                                                    <button type="submit" class="btn btn-outline-primary-2">
                                                        <span>SIGN UP</span>
                                                        <i class="icon-long-arrow-right"></i>
                                                    </button>

                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="register-policy" required>
                                                        <label class="custom-control-label" for="register-policy">I agree to the <a href="#">privacy policy</a> *</label>
                                                    </div><!-- End .custom-checkbox -->
                                                </div><!-- End .form-footer -->
                                            </form>
                                            <div class="form-choice">
                                                <p class="text-center">or sign in with</p>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <a href="#" class="btn btn-login btn-g">
                                                            <i class="icon-google"></i>
                                                            Login With Google
                                                        </a>
                                                    </div><!-- End .col-6 -->
                                                    <div class="col-sm-6">
                                                        <a href="#" class="btn btn-login  btn-f">
                                                            <i class="icon-facebook-f"></i>
                                                            Login With Facebook
                                                        </a>
                                                    </div><!-- End .col-6 -->
                                                </div><!-- End .row -->
                                            </div><!-- End .form-choice -->
                                        </div><!-- .End .tab-pane -->
                                    </div><!-- End .tab-content -->
                                </div><!-- End .form-tab -->
                            </div><!-- End .form-box -->
                        </div><!-- End .modal-body -->
                    </div><!-- End .modal-content -->
                </div><!-- End .modal-dialog -->
            </div><!-- End .modal -->

            <!-- Plugins JS File -->
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <script src="assets/js/jquery.hoverIntent.min.js"></script>
            <script src="assets/js/jquery.waypoints.min.js"></script>
            <script src="assets/js/superfish.min.js"></script>
            <script src="assets/js/owl.carousel.min.js"></script>
            <script src="assets/js/bootstrap-input-spinner.js"></script>
            <script src="assets/js/jquery.elevateZoom.min.js"></script>
            <script src="assets/js/bootstrap-input-spinner.js"></script>
            <script src="assets/js/jquery.magnific-popup.min.js"></script>
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


    <!-- molla/product.jsp  22 Nov 2019 09:55:05 GMT -->
</html>
