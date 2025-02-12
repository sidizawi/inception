import uuid, json
from django.db import models

class Response(models.Model):
	session = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
	form = models.ForeignKey('Form', on_delete=models.CASCADE, null=False)
	question = models.ForeignKey('Question', on_delete=models.CASCADE, null=False)
	response = models.JSONField(null=False)

	@property
	def serialized(self):
		return {
			'response': json.loads(self.response),
		}
