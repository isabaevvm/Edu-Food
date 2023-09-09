<#import "layout.ftlh" as main>
<@main.layout>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta name="_csrf_token" content="${_csrf.token}"/>
    <style>
        .container {
            background-color: #ffffff;
            width: 65%;
            border-radius: 15px;
        }

        .card {
            background-color: #ffffff;
            height: 200px;
            margin: 15px;
        }

        .resume-date {
            margin-top: 6px;
            color: rgb(33, 32, 32);
        }

        .card-title {
            color: #057ae0;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
        }

        .btn-update {
            background-color: #06d6a0;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
        }

        .btn-edit {
            background-color: white;
            color: #06d6a0;
            border-color: #06d6a0;
            border-radius: 5px;
            padding: 8px 16px;
            margin-left: 10px;
            transition: background-color 0.1s ease-in-out;
        }

        .btn-edit:hover {
            background-color: #06d6a0;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .noidung_dropdown {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .noidung_dropdown a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
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

        .no-content {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: white;
            width: 50%;
            margin: 10% auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .close {
            float: right;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
    <div class="container shadow-lg mt-5">
        <div class="dropdown">
            <div>
                <input type="text" id="searchInput" placeholder="Поиск вакансий...">
            </div>
            <div id="searchResults">
                <!-- Результаты поиска будут здесь -->
            </div>
        </div>
        <section class="mb-5">
            <#assign pageSize = restaurants.getTotalPages()>
            <#if restaurants.getContent()?has_content>
            <#list restaurants.getContent() as restaurant>
                <div class="row">
                    <div class="col-md-12 mt-3">
                        <div class="card shadow">
                            <div class="card-body">
                                <a href="/vacancies/${restaurant.id}" class="card-title">${restaurant.name}</a>
                            </div>
                        </div>
                    </div>
                </div>
                <#else>
                <p>No content</p>
            </#list>
            </#if>
            <div class="pagination-container">
                <#if 1 < pageSize>
                    <#list 0..restaurants.totalPages - 1 as pageIndex>
                        <button class="page-button" onclick="goToPage(${pageIndex})">${pageIndex + 1}</button>
                    </#list>
                </#if>
            </div>

<#--            <p class="no-content" <#if vacancies.isEmpty()>style="display: block;"<#else>style="display: none;"</#if>>No content</p>-->

        </section>
    </div>
    <script>

        function readUser() {
            let userAsJson = localStorage.getItem('user')
            return JSON.parse(userAsJson)
        }

        let user = readUser()

        function goToPage(page) {
            window.location.href = "/restaurants?page=" + page + "&size=5";
        }


        const searchInput = document.getElementById("searchInput");
        const searchResults = document.getElementById("searchResults");

        searchInput.addEventListener("input", () => {
            const query = searchInput.value.trim();

            if (query !== "") {
                fetch(`http://localhost:8989/api/restaurants/search/` + query)
                    .then(response => response.json())
                    .then(data => {
                        displaySearchResults(data);
                    })
                    .catch(error => {
                        console.error("Error searching for vacancies:", error);
                    });
            } else {
                searchResults.innerHTML = "";
            }
        });

        function displaySearchResults(results) {
            searchResults.innerHTML = "";

            if (results.length === 0) {
                searchResults.innerHTML = "<p>Нет результатов</p>";
                return;
            }

            results.forEach(restaurant => {
                const resultItem = document.createElement("div");
                const resultUrl = document.createElement("a")

                resultItem.classList.add("search-result");
                resultUrl.textContent = restaurant.name;
                resultUrl.href = "/restaurants/" + restaurant.id

                resultItem.appendChild(resultUrl)
                searchResults.appendChild(resultItem);
            });
        }
    </script>
</@main.layout>