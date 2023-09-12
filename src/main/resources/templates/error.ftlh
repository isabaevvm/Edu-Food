<#import "layout.ftlh" as main>
<@main.layout>
    <style>
        body {
            background-color: aliceblue;
        }

        .container {
            background-color: #ffffff;
            width: 65%;
            border-radius: 15px;
            text-align: center;
            padding: 50px;
        }

        .error-code {
            font-size: 48px;
            font-weight: bold;
            color: #e74c3c;
        }

        .error-message {
            font-size: 24px;
            color: #333;
            margin-top: 10px;
        }

        .home-link {
            margin-top: 20px;
            text-decoration: none;
            color: #057ae0;
            font-weight: bold;
        }
    </style>
    <div class="container shadow-lg mt-5">
        <section>
            <div class="row mt-5 pt-5">
                <div class="col mt-2">
                    <#if errorCode?has_content>
                        <h1 class="error-code">${errorCode}</h1>
                        <#else>
                        <p class="error-code">Ошибка, убдедитесь правильность запроса и повтрорите попытку!</p>
                    </#if>
                    <#if reason?has_content>
                        <p class="error-message">${reason}</p>
                    </#if>
                    <a class="home-link" href="/">На главную</a>
                </div>
            </div>
        </section>
    </div>
</@main.layout>
