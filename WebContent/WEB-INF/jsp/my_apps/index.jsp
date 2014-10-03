<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    
    </head>

    <body>
            <div class="container">
		     <div id="sidebar" style="overflow: hidden; outline: none;">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                  <li class="mt">
                      <a class="active" href="#">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>

                  <li class="sub-menu dcjq-parent-li">
                      <a href="javascript:;" class="dcjq-parent">
                          <i class="fa fa-desktop"></i>
                          <span>DropDown Menu</span>
                      <span class="dcjq-icon"></span></a>
                      <ul class="sub" style="display: none;">
                          <li><a href="apps_detail.do">Apps Detail</a></li>
                      </ul>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>

			<section id="main-content"> 
				<section class="wrapper">
	<div class="form-group">
  <div class="input-group">
    <span class="input-group-addon">@</span>
    <input type="text" class="form-control" placeholder="Prepend" />
  </div>  
</div>
				</section> 
			</section>
    	</div>
    </body>
</html>