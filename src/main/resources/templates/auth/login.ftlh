<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Muhamad Nauval Azhar">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta name="description" content="This is a login page template based on Bootstrap 5">
	<title>Вход</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>

<body>
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
					</div>
					<div class="card shadow-lg" style="border-radius: 15px; margin-top: 100px;">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Войти</h1>
							<form method="post" class="needs-validation" action="/login" id="/login-form">
								<#if _csrf??>
								<input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
									   value="${(_csrf.token)!'--no-token--'}"/>
								</#if>
								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">E-Mail почта</label>
									<input id="email" type="email" class="form-control" name="username" value="" required autofocus>
								</div>

								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="text-muted" for="password">Пароль</label>
									</div>
									<input id="password" type="password" class="form-control" name="password" required>
								</div>

								<div class="text-center mt-4">
									<button type="submit" class="btn btn-primary" style="padding-left: 50px; padding-right: 50px; margin-bottom: -20px;">
										Войти
									</button>
								</div>
							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								У вас нет аккаунта?<a href="/register" class="text-dark">  Создать аккаунт</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		document.getElementById("/login-form").addEventListener("submit", onLoginHandler)

		let user = {}

		function onLoginHandler(event){
			let form = event.target
			let userFormData = new FormData(form)

			user = Object.fromEntries(userFormData)
			localStorage.setItem('user', JSON.stringify(user))
		}
	</script>
</body>
</html>
