<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Muhammed">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta name="description" content="This is a login page template based on Bootstrap 5">
	<title>Регистрация</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>

<body>
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="card shadow-lg" style="border-radius: 15px; margin-top: 100px">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Регистрация</h1>
							<form method="post" class="needs-validation" action="/register" >
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">E-Mail почта</label>
									<input id="email" type="email" class="form-control" name="email"  required>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="password">Пароль</label>
									<input id="password" type="password" class="form-control" name="password" required>
								</div>
								<div class="text-center">
										<button type="submit" class="btn btn-primary ms-auto mt-3" style="padding-left: 50px; padding-right: 50px; margin-bottom: -20px;">
											Далее
										</button>
								</div>
							</form>
						</div>
						<div class="card-footer border-0">
							<div class="text-center">
								У вас уже есть аккаунт? <a href="/login" class="text-dark">Войти</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		const select = document.getElementById("role")

		select.addEventListener("change" , function changeInnerHTML(event) {
			const userNameOption = document.getElementById("userName");
			const selectRoleOption = document.querySelector("role");
			console.log(event.target.value)
			switch (event.target.value) {
				case "1":
					userNameOption.innerHTML = "Имя пользователя";
					break;
				case "2":
					userNameOption.innerHTML = "Имя компании";
					break;
				default:
					userNameOption.innerHTML = "Имя пользователя";

			}
		})
	</script>
</body>
</html>
