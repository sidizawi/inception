import uuid, json
from django.db import models

from .user import User

class Form(models.Model):
	description = models.TextField()
	title = models.CharField(max_length=255)
	updated_at = models.DateTimeField(auto_now=True)
	created_at = models.DateTimeField(auto_now_add=True)
	user = models.ForeignKey(User, on_delete=models.CASCADE, null=False)
	id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)

	def __str__(self):
		return self.title

	@property
	def serialized(self):
		return {
			'id': self.id,
			'title': self.title,
			'description': self.description,
			'questions': [question.serialized for question in self.questions.all()]
		}

class Question(models.Model):
	description = models.TextField()
	title = models.CharField(max_length=255)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	form = models.ForeignKey(Form, on_delete=models.CASCADE, null=False)

	class Types(models.TextChoices):
		TEXT = 'text', 'text'
		EMAIL = 'email', 'email'
		PASSWORD = 'password', 'password'
		RADIO = 'radio', 'radio'
		CHECKBOX = 'checkbox', 'checkbox'
	
	type = models.CharField(max_length=255, choices=Types.choices, default=Types.TEXT)
	choices = models.JSONField(null=False)

	def __str__(self):
		return self.title

	@property
	def serialized(self):
		return {
			'id': self.id,
			'type': self.type,
			'title': self.title,
			'description': self.description,
			'choices': json.loads(self.choices),
		}
