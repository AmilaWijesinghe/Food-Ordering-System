    <%@page import="utilities.Cart"%>
    <%@page import="entities.CartItem"%>
    <%@page import="dao.customerDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">


<title>invoice with client info description amount and pay now button - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
body{margin-top:20px;
background:#ffffff;
}

.card-footer-btn {
    display: flex;
    align-items: center;
    border-top-left-radius: 0!important;
    border-top-right-radius: 0!important;
}
.text-uppercase-bold-sm {
    text-transform: uppercase!important;
    font-weight: 500!important;
    letter-spacing: 2px!important;
    font-size: .85rem!important;
}
.hover-lift-light {
    transition: box-shadow .25s ease,transform .25s ease,color .25s ease,background-color .15s ease-in;
}
.justify-content-center {
    justify-content: center!important;
}
.btn-group-lg>.btn, .btn-lg {
    padding: 0.8rem 1.85rem;
    font-size: 1.1rem;
    border-radius: 0.3rem;
}
.btn-dark {
    color: #000;
    background-color: #ccac2f;
    border-color: #fff;
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, 0.09);
    border-radius: 0.25rem;
    box-shadow: 0 20px 27px 0 rgb(0 0 0 / 50%);
    
}

.p-5 {
    padding: 3rem!important;
}
.card-body {
    flex: 1 1 auto;
    padding: 1.5rem 1.5rem;
}

tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
    border-width: 0;
}

.table td, .table th {
    border-bottom: 0;
    border-top: 1px solid #edf2f9;
}
.table>:not(caption)>*>* {
    padding: 1rem 1rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}
.px-0 {
    padding-right: 0!important;
    padding-left: 0!important;
}
.table thead th, tbody td, tbody th {
    vertical-align: middle;
}
tbody, td, tfoot, th, thead, tr {
    border-color: inherit;
    border-style: solid;
    border-width: 0;
}

.mt-5 {
    margin-top: 3rem!important;
}

.icon-circle[class*=text-] [fill]:not([fill=none]), .icon-circle[class*=text-] svg:not([fill=none]), .svg-icon[class*=text-] [fill]:not([fill=none]), .svg-icon[class*=text-] svg:not([fill=none]) {
    fill: currentColor!important;
}
.svg-icon>svg {
    width: 1.45rem;
    height: 1.45rem;
}
</style>
</head>
<body>

<div class="container mt-6 mb-7">
<div class="row justify-content-center">
<div class="col-lg-12 col-xl-7">
   
<div class="card">
<div class="card-body p-5">
<% 
	customerDAO aa=new customerDAO();
	aa.invoice(request, response);
	%>
<h2>
Hey <%= request.getAttribute("first_name") %>,
</h2>
<a href=""><i class="fa fa-close" style="font-size:25px; color: #000; position: relative; left: 665px; bottom: 85px;"></i></a>
<p class="fs-sm">
This is the receipt for a payment of <strong>0.00</strong> (RS) you made to Spacial Foods.
</p>
<div class="border-top border-gray-200 pt-4 mt-4">
<div class="row">
<div class="col-md-6">
<div class="text-muted mb-2">Payment No.</div>
<strong>#88305</strong>

</div>
<div class="col-md-6 text-md-end">
<div class="text-muted mb-2">Payment Date And Time</div>
<strong id="current-date"></strong> <br>
<strong id="current-time"></strong>
</div>
</div>
</div>
<div class="border-top border-gray-200 mt-4 py-4">
<div class="row">
<div class="col-md-6">
<div class="text-muted mb-2">Client</div>
<strong>
<%= request.getAttribute("first_name") %> <%= request.getAttribute("last_name") %>
</strong>
<p class="fs-sm">
Kandy
<br>
</a>
</p>
</div>
<div class="col-md-6 text-md-end">
<div class="text-muted mb-2">Payment To</div>
<strong>
Burger Hut
</strong>
<p class="fs-sm">
<%= request.getAttribute("address") %>
<br>
</a>
</p>
</div>
</div>
</div>
<table class="table border-bottom border-gray-200 mt-3">
<thead>
<tr>
<th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">Description</th>
<th scope="col" class="fs-sm text-dark text-uppercase-bold-sm text-end px-0">Amount</th>
</tr>
</thead>
<tbody>
 <% for (CartItem item : Cart.getItems()) { %>
<tr>
<td class="px-0"><%=item.getItemName() %></td>
<td class="text-end px-0">Rs.<%=item.getPrice() %></td>
</tr>
  <% } %>
</tbody>
</table>
<div class="mt-5">
<div class="d-flex justify-content-end">
<p class="text-muted me-3">Subtotal:</p>
<span>RS 0.00</span>
</div>
<div class="d-flex justify-content-end mt-3">
<h5 class="me-3">Total:</h5>
<h5 class="text-success" id="final-amount">RS 0.00</h5>
</div>
</div>
</div>
<a href="FOS_menu.jsp" class="btn btn-dark btn-lg card-footer-btn justify-content-center text-uppercase-bold-sm hover-lift-light">
<span class="svg-icon text-white me-2">
<svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewbox="0 0 512 512"><title>ionicons-v5-g</title><path d="M336,208V113a80,80,0,0,0-160,0v95" style="fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px"></path><rect x="96" y="208" width="320" height="272" rx="48" ry="48" style="fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:32px"></rect></svg>
</span>
Pay Now
</a>
</div>
</div>
</div>
</div>
  <script src="js/localStorage.js"></script>
  <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
<script src="js/localStorage.js"></script>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"></script>
<script>
    var currentDateTime = new Date();
    // Extract the relevant information from the date and time
    var day = currentDateTime.getDate();
    var month = currentDateTime.getMonth() + 1; // Note: Months are zero-based
    var year = currentDateTime.getFullYear();
    var hours = currentDateTime.getHours();
    var minutes = currentDateTime.getMinutes();
    var seconds = currentDateTime.getSeconds();

    // Format the date as desired
    var formattedDate = month + '/' + day + '/' + year;

    // Format the time as desired (including AM/PM indicator)
    var amPM = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12 || 12; // Convert to 12-hour format
    var formattedTime = hours + ':' + minutes + ':' + seconds + ' ' + amPM;

    // Find the elements where you want to display the date and time
    var dateElement = document.getElementById('current-date');
    var timeElement = document.getElementById('current-time');

    // Set the formatted date and time as the elements' content
    dateElement.textContent = formattedDate;
    timeElement.textContent = formattedTime;
</script>
</body>
</html>