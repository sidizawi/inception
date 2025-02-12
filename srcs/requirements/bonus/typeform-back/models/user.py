from django.db import models
from .manager import UserManager
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
	username = None

	email = models.EmailField('email address', unique=True)

	USERNAME_FIELD = 'email'
	REQUIRED_FIELDS = []
	objects = UserManager()

	@property
	def serialized(self):
		return {
			'email': self.email,
			'first_name': self.first_name,
			'last_name': self.last_name,
		}
