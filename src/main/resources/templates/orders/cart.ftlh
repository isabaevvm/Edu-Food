<#import "../layout.ftlh" as main>
<@main.layout>
    <style>
        /* Ваш стиль оформления */
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
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Наименование</th>
                                    <th scope="col">Цена</th>
                                    <th scope="col">Количество</th>
                                    <th scope="col">Сумма</th>
                                </tr>
                                </thead>
                                <tbody id="cartItems">
                                <!-- Здесь будут отображаться товары из корзины -->
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
            const cartData = savedCart ? JSON.parse(savedCart) : { items: [], totalPrice: 0 };
            console.log('Cart data from localStorage:', cartData);
            console.log('Cart data from localStorage:', cartData.length);
            return cartData;
        }

        let cart = loadCartFromLocalStorage();

        function renderCartItems() {
            const cartItemsElement = document.getElementById('cartItems');

            if (cart.length === 0) {
                console.log("// Если корзина пуста, выводим сообщение")
                cartItemsElement.innerHTML = '<tr><td colspan="4">Корзина пуста</td></tr>';
            } else {
                console.log("// Выводим каждый товар из корзины")
                console.log("// Выводим каждый товар из корзины", cart.items)
                cartItemsElement.innerHTML = cart.map(item =>  `
                    <tr>
                        <td>` + item.dishName + `</td>
                        <td>` + item.price + `</td>
                        <td>` + item.quantity + `</td>
                        <td>` + item.price * item.quantity + `</td>
                    </tr>
                `).join('');
            }
        }

        renderCartItems();
    </script>
</@main.layout>
