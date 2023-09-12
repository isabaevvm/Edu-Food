<#import "../layout.ftlh" as main>
<@main.layout>
    <style>
        body {
            background-color: aliceblue;
        }

        .container {
            background-color: #ffffff;
            width: 65%;
            border-radius: 15px;
        }

        .profile-image img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-left: 20px;
        }

        .card {
            background-color: #ffffff;
            color: #057ae0;
            height: 180px;
            margin: 15px;
        }

        .card-title{
            font-size: 19px;
            text-decoration: none;
            font-weight: bold;
        }

        .resume-date {
            margin-top: 6px;
            color: rgb(33, 32, 32);
        }

        .pagination-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .page-button {
            background-color: #057ae0;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
            margin: 0 5px;
            cursor: pointer;
            transition: background-color 0.1s ease-in-out;
        }

        .page-button:hover {
            background-color: #06d6a0;
        }

    </style>
    <div class="container shadow-lg mt-5">
        <section>
            <div class="row mt-5 pt-5">
                    <h3 class="mb-3" style="color: rgb(32, 32, 32);">${user.email}</h3>
            </div>
            <div class="row mt-5">
                    <#assign pageSize = orders.getTotalPages()>
                    <div class="sort-container">
                        <label for="sortSelect">Сортировать по:</label>
                        <select id="sortSelect" onchange="updateSort()">
                            <option value="totalPrice">По сумме</option>
                            <option value="orderDate">По дате</option>
                        </select>
                    </div>
                <#if orders.getContent()?has_content>
                    <#list orders.getContent() as order>
                        <div class="col-md-12">
                            <div class="card shadow">
                                <div class="card-body">
                                    <p class="card-title">Итоговая сумма заказа: ${order.totalPrice}</p>
                                    <#assign dateString = order.orderDate>
                                    <#assign dateObject = dateString>

                                    <p class="card-text resume-date">Дата заказа: ${dateObject}</p>
                                </div>
                            </div>
                        </div>
                    </#list>
                    <#else>
                    <p>У вас нету сделанных заказов</p>
                </#if>
                    <div class="pagination-container">
                        <#if 1 < pageSize>
                            <#list 0..orders.totalPages - 1 as pageIndex>
                                <button class="page-button" onclick="goToPage(${pageIndex})">${pageIndex + 1}</button>
                            </#list>
                        </#if>
                    </div>
            </div>
        </section>
    </div>
    <script>
        function goToPage(page) {
            window.location.href = "/profile?page=" + page + "&size=5";
        }

        function updateSort() {
            const sortSelect = document.getElementById("sortSelect");
            const selectedSort = sortSelect.value;
            const currentUrl = window.location.href;

            const urlParts = currentUrl.split("?");
            let baseUrl = urlParts[0];

            const queryParams = new URLSearchParams(urlParts[1]);
            queryParams.set("sort", selectedSort);

            const newUrl = baseUrl + "?" + queryParams.toString();
            window.location.href = newUrl;
        }
    </script>
</@main.layout>