<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <title>Sample 3</title>
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <link rel="shortcut icon" href="/GardenPlatformWeb/resource/img/favicon.ico">
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/bootstrap.css">
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/flat-ui.css">
        <!-- Using only with Flat-UI (free)-->
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/icon-font.css">
        <!-- end -->
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/main.css">
    </head>

    <body>
        <div class="page-wrapper">
            <!-- header-11 -->
            <header class="header-11">
                <div class="container">
                    <div class="row">
                        <div class="navbar col-sm-12" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle"></button>
                                <a class="brand" href="#"><img src="/GardenPlatformWeb/resource/img/logo.png" width="50" height="50" alt=""> Startup</a>
                            </div>
                            <div class="collapse navbar-collapse pull-right">
                                <ul class="nav pull-left">
                                    <li class="active"><a href="#">HOME</a></li>
                                    <li><a href="#">COMPANY</a></li>
                                    <li><a href="#">PORTFOLIO</a></li>
                                    <li><a href="#">BLOG</a></li>
                                    <li><a href="#">CONTACT</a></li>
                                </ul>
                                <form class="navbar-form pull-left">
                                    <a class="btn btn-primary" href="#">SIGN IN</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <section class="header-11-sub bg-midnight-blue">
                <div class="background">
                    &nbsp;
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <h3>Features of Startup Framework</h3>
                            <p>
                                You have the design, you have the code. We’ve created the product that will help your startup to look even better.
                            </p>
                            <div class="signup-form">
                                <form>
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="Your E-mail">
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <input type="password" class="form-control" placeholder="Password">
                                        </div>
                                        <div>
                                            <input type="password" class="form-control" placeholder="Confirmation">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-block btn-info">Sign Up</button>
                                    </div>
                                </form>
                            </div>
                            <div class="additional-links">
                                By signing up you agree to <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>
                            </div>
                        </div>
                        <div class="col-sm-7 col-sm-offset-1 player-wrapper">
                            <div class="player">
                                <iframe src="http://player.vimeo.com/video/29568236?color=3498db" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                                <!--<iframe src="http://www.youtube.com/embed/BCC7rFxo6QA" allowfullscreen></iframe>-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- price-1 -->
            <section class="price-1">
                <div class="container">
                    <h3>Take a look to our Plans</h3>
                    <p class="lead">
                        This is a probably the best plans ever born
                    </p>
                    <div class="row plans">
                        <div class="col-sm-4">
                            <div class="plan">
                                <div class="title">Starter</div>
                                <div class="price">19$/month</div>
                                <div class="description">
                                    10,000 messages<br>
                                    <b>unlimited</b> data<br>
                                    <b>unlimited</b> users<br>
                                    first 10 day free
                                </div>
                                <a class="btn disabled" href="#">Your Current Plan</a>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan">
                                <div class="title">Professional</div>
                                <div class="price">39$/month</div>
                                <div class="description">
                                    10,000 messages<br>
                                    <b>unlimited</b> data<br>
                                    <b>unlimited</b> users<br>
                                    first 30 day free
                                </div>
                                <a class="btn btn-primary" href="#">Change to this Plan</a>

                                <div class="ribbon">NEW</div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan">
                                <div class="title">Business</div>
                                <div class="price">59$/month</div>
                                <div class="description">
                                    10,000 messages<br>
                                    <b>unlimited</b> data<br>
                                    <b>unlimited</b> users<br>
                                    first 100 day free
                                </div>
                                <a class="btn btn-primary" href="#">Change to this Plan</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- content-13  -->
            <section class="content-13 subscribe-form bg-turquoise">
                <div class="container">
                    <div class="row">
                        <form>
                            <div class="col-sm-8">
                                <input type="text" placeholder="Enter your e-mail" spellcheck="false">
                            </div>
                            <div class="col-sm-4">
                                <button class="btn btn-large btn-primary" type="submit">
                                    Subscribe now
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>

            <!-- footer-2 -->
            <footer class="footer-2 bg-midnight-blue">
                <div class="container">
                    <nav class="pull-left">
                        <ul>
                            <li class="active">
                                <a href="#">Home</a>
                            </li>
                            <li>
                                <a href="#">Company</a>
                            </li>
                            <li>
                                <a href="#">Portfolio</a>
                            </li>
                            <li>
                                <a href="#">Blog</a>
                            </li>
                            <li>
                                <a href="#">Contact</a>
                            </li>
                        </ul>
                    </nav>
                    <div class="social-btns pull-right">
                        <a href="#"><div class="fui-vimeo"></div><div class="fui-vimeo"></div></a>
                        <a href="#"><div class="fui-facebook"></div><div class="fui-facebook"></div></a>
                        <a href="#"><div class="fui-twitter"></div><div class="fui-twitter"></div></a>
                    </div>
                    <div class="additional-links">
                        Be sure to take a look to our <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>
                    </div>
                </div>
            </footer>
        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="/GardenPlatformWeb/resource/js/lib/jquery-1.10.2.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/bootstrap.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/modernizr.custom.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/startup-kit.js"></script>
        <script src="/GardenPlatformWeb/resource/js/main.js"></script>
    </body>
</html>