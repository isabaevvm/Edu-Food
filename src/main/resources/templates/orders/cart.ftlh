<#import "../layout.ftlh" as main>
<@main.layout>
    <style>
        .total-section {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 30px;
        }

        .btn-update {
            background-color: #057ae0;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
        }

        #totalPrice {
            font-size: 20px;
            color: #06d6a0;
            font-weight: bold;
            margin-left: 20px;
        }
    </style>
    <div class="container shadow-lg mt-5">
        <section>
            <div class="row mt-5 pt-5">
                <div class="col mt-2">
                    <h3 class="mb-3" style="color: rgb(32, 32, 32);">Корзина</h3>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-12">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="total-section">
                                <div>
                                    <button class="btn btn-update" onclick="payForOrder()">Оплатить</button>
                                </div>
                                <div id="totalPrice">Итого: 0 руб.</div>
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Наименование</th>
                                    <th scope="col">Заведение</th>
                                    <th scope="col">Цена</th>
                                    <th scope="col">Количество</th>
                                    <th scope="col">Сумма</th>
                                </tr>
                                </thead>
                                <tbody id="cartItems">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        function loadCartFromLocalStorage() {
            const savedCart = localStorage.getItem('cart');
            const cartData = savedCart ? JSON.parse(savedCart) : {items: [], totalPrice: 0};

            return cartData;
        }

        let cart = loadCartFromLocalStorage();

        function renderCartItems() {
            const cartItemsElement = document.getElementById('cartItems');

            if (cart.items.length === 0) {
                cartItemsElement.innerHTML = '<tr><td colspan="4">Корзина пуста</td></tr>';
            } else {
                cartItemsElement.innerHTML = cart.items.map(item => `
            <tr>
                <td>` + item.dishName + `</td>
                <td>` + item.restaurant + `</td>
                <td>` + item.price + `</td>
                <td>` + item.quantity + `</td>
                <td>` + item.price * item.quantity + `</td>
            </tr>
        `).join('');
            }

            const totalPriceElement = document.getElementById('totalPrice');
            const total = cart.items.reduce((acc, item) => acc + (item.price * item.quantity), 0);
            totalPriceElement.textContent = `Итого: ` + total + ` руб.`;
        }


        renderCartItems();

        function readUser() {
            let userAsJson = localStorage.getItem('user')
            return JSON.parse(userAsJson)
        }

        function payForOrder() {
            const user = readUser();

            if (!user) {
                alert("перед оформлением заказа проходите регистрацию!")
                window.location.href = '/login';
                return;
            }

            const orderData = {
                totalPrice: cart.totalPrice,
                orders: cart.items.map(item => ({
                    dishId: item.dishId,
                    quantity: item.quantity
                }))
            };

            const url = '/api/order';

            let headers = new Headers()
            headers.set('Authorization', 'Basic ' + btoa(user.username + ':' + user.password))
            headers.set('Content-Type', 'application/json');

            const requestOptions = {
                method: 'POST',
                headers: headers,
                body: JSON.stringify(orderData)
            };

            fetch(url, requestOptions)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Ошибка при выполнении запроса');
                    }
                })
                .then(data => {
                    console.log('Заказ успешно оплачен:', data);

                    cart = {items: [], totalPrice: 0};
                    localStorage.removeItem('cart');
                    renderCartItems();
                })

        }

    </script>
</@main.layout>
