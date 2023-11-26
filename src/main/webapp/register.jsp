<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="dark" data-bs-core="modern">
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>ouROBOrous</title>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		if (window.location.href.includes('failed')) {
			var alertElement = document.getElementById('alert');
			alertElement.style.opacity = '100%';
		} else {
		}
	});
</script>
</head>
<body class="">
	<%@include file="includes/navbar.jsp"%>

	<div class="container align-middle">
		<div
			class="alert alert-danger border-0 rounded-0 d-flex align-items-center"
			role="alert" id="alert" style="opacity: 0;">

			<i class="fa-light fa-exclamation-circle text-danger-emphasis me-2"></i>

			<div>
				Login <strong>failed</strong> please try again.
			</div>

		</div>
		<div class="row justify-content-center mb-5 mt-2">
			<div class="card shadow" style="width: 50%;">

				<div class="card-body">
					<form action="/ouROBOrous/register" method="POST">
						<div class="mb-1">
							<label class="form-label" for="email">Email address</label> <input
								type="email" class="form-control" name="email" id="email"
								required placeholder="Email address">
						</div>
						<div class="mb-1">
							<label class="form-label" for="phone_number">Phone Number</label>
							<input type="tel" class="form-control" name="phone_number"
								id="phone_number" required placeholder="Phone Number">
						</div>

						<div class="mb-1">
							<label class="form-label" for="password">Password</label> <input
								type="password" class="form-control" name="password"
								id="password" required placeholder="Password">
						</div>
						<hr>
						<div class="row">
							<div class="mb-1 col">
								<label class="form-label" for="firstname">First Name</label> <input
									type="text" class="form-control" name="firstname"
									id="firstname" required placeholder="First Name">
							</div>
							<div class="mb-1 col">
								<label class="form-label" for="lastname">Last Name</label> <input
									type="text" class="form-control" name="lastname" id="lastname"
									required placeholder="Last Name">
							</div>
						</div>
						<div class="mb-1">
							<label class="form-label" for="birthdate">Birth Date</label> <input
								type="date" class="form-control" name="birthdate" id="birthdate"
								required placeholder="Birth Date">
						</div>
						<hr>
						<div class="mb-1">
							<label class="form-label" for="address">Address</label> <input
								type="text" class="form-control" name="address" id="address"
								required placeholder="Address">
						</div>
						<div class="mb-1">
							<label for="city" class="form-label">City</label> <select
								class="form-select" id="city" name="city">
								<option selected>Select your city</option>
								<option value="frontend">Rabat</option>
								<option value="backend">Fes</option>
								<option value="fullstack">Agadir</option>
								<option value="fullstack">Casablanca</option>
								<option value="fullstack">Oulad Teima</option>
								<option value="fullstack">Taroudant</option>
							</select>
						</div>
						<div class="d-flex align-items-center">
							<button type="submit" class="btn btn-primary w-100 mt-2 btn-lg">Sign
								Up</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="includes/footer.jsp"%>
</html>