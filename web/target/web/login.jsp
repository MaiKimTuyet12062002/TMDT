<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="<c:url value='css/style1.css'/>" rel="stylesheet"
          type="text/css"/>
    <title>Tài khoản</title>
    <link rel="stylesheet" href="css/style1.css">
    <script src="js/Login.js"></script>
</head>
<body>
<div id="logreg-forms">
    <form class="form-signin" method="post" action="login">
        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Đăng nhập</h1>
        <c:set var="erro" value="${requestScope.mess}" />
        <h5 style="color: #9500ff">${mess}</h5>

        <!-- Đoạn mã mới -->
        <input type="hidden" name="redirectURL" value="index.jsp">
        <%--    --%>
        <div class="social-login">


            <a href="https://www.facebook.com/v19.0/dialog/oauth?client_id=1586113255570962&redirect_uri=http://localhost:8080/loginFacebook&scope=email">
                <button class="btn fa-book-btn social-btn" type="button" style="background-color: #3b5998; color: white;">
                    <span><i class="fab fa-facebook-f"></i> Đăng nhập với Facebook</span>
                </button>
            </a>


            <%--  <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Đăng nhập với Google+</span> </button>--%>
            <a
                    href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/loginGoogle&response_type=code
    &client_id=1089316008342-fllevmop2b90sd7mmsqotdo1neb934sg.apps.googleusercontent.com&approval_prompt=force">
                <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Đăng nhập với Google+</span>
                </button>
            </a>

        </div>
        <p style="text-align:center"> Hoặc </p>

        <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Nhập email" required=""
               autofocus="">
        <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required="">

        <button class=" bt btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập
        </button>
        <a href="quenmatkhau.jsp" >Quên mật khẩu?</a>
        <hr>
        <!-- <p>Don't have an account!</p>  -->
        <a class="bt btn btn-primary btn-block" href="/regis"><i class="fas fa-user-plus"></i> Đăng kí</a>
    </form>

    <%--    <form action="/reset/password/" class="form-reset">--%>
    <%--        &lt;%&ndash;    <input type="email" id="resetEmail" class="form-control" placeholder="Nhập email" required="" autofocus="">&ndash;%&gt;--%>
    <%--        <a class="btn btn-primary btn-block" href="forget">quên mật khẩu</a>--%>
    <%--        <a href="/index" id="cancel_reset"><i class="fas fa-angle-left"></i> Trở về</a>--%>
    <%--    </form>--%>


    <br>
</div>
<script type="text/javascript">
    var errors = <%=request.getAttribute("errorlogin")%>;
    if (errors != null) {
        alert(errors)
    }
</script>

<%--// facebook--%>
<script>
    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        console.log('statusChangeCallback');
        console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        } else {                                 // Not logged into your webpage or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this webpage.';
        }
    }


    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function (response) {   // See the onlogin handler
            statusChangeCallback(response);
        });

    }

    //
    // window.fbAsyncInit = function () {
    //     FB.init({
    //         appId: '1946717745720529',
    //         cookie: true,                     // Enable cookies to allow the server to access the session.
    //         xfbml: true,                     // Parse social plugins on this webpage.
    //         version: 'v17.0'         // Use this Graph API version for this call.
    //     });
    //
    //     FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
    //         statusChangeCallback(response);        // Returns the login status.
    //     });
    // };
    // ...//
    window.fbAsyncInit = function () {
        FB.init({
            // appId      : '1946717745720529',
            appId: '933021047931913',
            xfbml: true,
            version: 'v17.0'
        });
        FB.AppEvents.logPageView();
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // ..//
    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
            // chuyen huong ve index
            window.location.href = "index.jsp";
        });
    }
</script>
<div id="status">
</div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="/script.js"></script>
</body>
</html>