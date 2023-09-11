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

        .edit-profile {
            color: #ffffff;
            padding: 10px 0px;
            width: 200px;
            background-color: #057ae0;
            box-shadow: 4px 8px 10px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 10px;
            letter-spacing: 1px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }

        .card {
            background-color: #ffffff;
            color: #057ae0;
            height: 180px;
            margin: 15px;
        }

        .card-title {
            font-size: 19px;
            text-decoration: none;
            font-weight: bold;
        }

        .resume-date {
            margin-top: 6px;
            color: rgb(33, 32, 32);
        }

        .custom-button {
            text-align: center;
            width: 120px;
            height: 150px;
            border-radius: 15%;
            box-shadow: 4px 8px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
            border: none;
            font-size: 1px;
            cursor: pointer;
            margin-right: 25px;
            transition: transform 0.3s ease-in-out;
        }

        .custom-button:hover {
            transform: scale(1.05);
        }

        .button-label {
            font-size: 16px;
            color: rgb(32, 32, 32);
            margin-top: 6px;
        }

        .button-group {
            margin-top: 40px;
        }

        .btn-update {
            background-color: #057ae0;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
        }

        .btn-edit {
            background-color: white;
            color: #057ae0;
            border-color: #057ae0;
            border-radius: 5px;
            padding: 8px 16px;
            margin-left: 10px;
            transition: background-color 0.1s ease-in-out;
        }

        .btn-edit:hover {
            background-color: #057ae0;
        }

        .user-info {
            margin-bottom: 3px;
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
                <div class="col mt-2">
                    <h3 class="mb-3" style="color: rgb(32, 32, 32);">${restaurant.name}</h3>
                </div>
            </div>
            <div class="row mt-5">
                    <#if dishes?has_content>
                        <#assign pageSize = dishes.getTotalPages()>
                        <#list dishes.getContent() as dish>
                            <div class="col-md-12">
                                <div class="card shadow">
                                    <div class="card-body">
                                        <a href="/resume/${dish.id}" class="card-title">${dish.name}</a>
                                        <p class="card-text resume-date">Дата обновления: ${dish.description}</p>
                                    </div>
                                </div>
                            </div>
                        </#list>
                        <div class="pagination-container">
                            <#if 1 < pageSize>
                                <#list 0..dishes.totalPages - 1 as pageIndex>
                                    <button class="page-button" onclick="goToPage(${pageIndex})">${pageIndex + 1}</button>
                                </#list>
                            </#if>
                        </div>
                    </#if>
            </div>
        </section>
    </div>
    <script>
        function goToPage(page) {
            const currentUrl = window.location.href;
            const url = new URL(currentUrl);

            url.searchParams.set('page', page);
            url.searchParams.set('size', '5');

            window.location.href = url.href;
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