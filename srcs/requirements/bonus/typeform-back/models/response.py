import uuid
from django.db import models

class Response(models.Model):
	session = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
	form = models.ForeignKey('Form', on_delete=models.CASCADE, null=False)
	questions = models.ManyToManyField('Question', through='Answer')
