<#macro layout>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Simple Navbar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
              crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
                background-color: aliceblue;

            }

            .nav {
                justify-content: center;
                font-size: 1rem;
                padding-left: 5px;
                height: 100px;
                padding-right: 5px;
                background: linear-gradient(to bottom, rgb(165, 203, 239), aliceblue);
            }

            .nav-link {
                margin-top: 20px;
                text-decoration: none;
                display: inline-block;
                padding: 13px 13px;
                color: #0c9be8;
                margin-right: 5px;
            }


            .nav-link:hover {
                text-decoration: none;
                color: #007ffe;
                border-bottom: 2px solid #007ffe;
            }


            .nav {
                display: flex;
                justify-content: center;
                font-size: 1.1rem;
                padding-left: 10px;
                padding-right: 10px;
                background: linear-gradient(to bottom, rgb(165, 203, 239), aliceblue);
            }

            .nav-link {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 10px;
                text-decoration: none;
                color: #0c9be8;
                transition: color 0.3s, transform 0.3s;
            }

            .nav-link i {
                font-size: 2rem;
                margin-bottom: 5px;
            }

            .nav-link:hover {
                color: #007ffe;
                transform: translateY(-3px);
            }

            @media (min-width: 768px) {
                .nav {
                    font-size: 1.1rem;
                    padding-left: 10px;
                    padding-right: 10px;
                }

                .nav-link {
                    padding: 20px 20px;
                }

            }
        </style>
    </head>
    <body>

    <#assign known = SPRING_SECURITY_CONTEXT??>
    <nav class="nav text-center">
        <a href="/" class="nav-link"><i class="fas fa-home"></i> Главная</a>
        <a href="/cart" class="nav-link"><i class="fas fa-shopping-cart"></i> Корзина
            <span id="cartItemCount" class="cart-item-count">0</span>
        </a>
        <#if known>
        <#--            <#if _csrf??>-->
        <#--                <form action="/logout" method="post">-->
        <#--                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"-->
        <#--                    value="${(_csrf.token)!'--no-token--'}"/>-->
        <#--                    <button type="submit" class="nav-link" id="logout"><i class="fas fa-sign-out-alt"></i> Выход</button>-->
        <#--                </form>-->
        <#--            <#else>-->
            <a href="/profile" class="nav-link"><i class="fas fa-user"></i> Профиль</a>
            <a href="/logout" class="nav-link"><i class="fas fa-sign-out-alt" onclick="logout()"></i> Выход</a>
        <#--            </#if>-->
        <#else>
            <a href="/register" class="nav-link"><i class="fas fa-user-plus"></i> Регистрация</a>
            <a href="/login" class="nav-link"><i class="fas fa-sign-in-alt"></i> Вход</a>
        </#if>
    </nav>
    <#nested>
    <script>
        function logout() {
            localStorage.removeItem('user')
        }
    </script>
    </body>
    </html>
</#macro>