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
		<div class="row justify-content-center">
			<div class="card shadow" style="width: 18.75rem;">

				<div class="card-body">
					<form action="/ouROBOrous/login" method="POST">

						<div class="mb-3">

							<label class="form-label" for="email">Email</label> <input
								type="text" class="form-control" id="email" required
								placeholder="email" name="email">

						</div>

						<div class="mb-3">

							<label class="form-label" for="password">Password</label> <input
								type="password" class="form-control" id="password" required
								placeholder="Password" name="password">

						</div>

						<div class="mb-3 pb-3 border-bottom">

							<button type="submit" class="btn btn-primary w-100">Sign
								in</button>

						</div>

						<div class="text-center text-body-secondary">

							Don't have an account? <a href="/ouROBOrous/register">Sign up</a>

						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="includes/footer.jsp"%>
</html>