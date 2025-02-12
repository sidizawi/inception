from django.urls import path
from . import user, token

urlpatterns = [
	# users
	path('user/', user.User.as_view()),

	# login
	path('token/', token.Token.as_view()),
]
