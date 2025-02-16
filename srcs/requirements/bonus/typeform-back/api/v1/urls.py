from django.urls import path
from . import user, token

urlpatterns = [
	# users
	path('user/', user.UserAPI.as_view()),

	# login
	path('login/', token.Token.as_view()),
]
