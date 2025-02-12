from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, AllowAny

from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError

from .token import verify_token

class User(APIView):
	
	permissions_classes = [AllowAny]

	# get user data
	@verify_token
	def get(self, request):
		return Response({'user': request.user.serialized}, status=status.HTTP_200_OK)

	# create a user
	def post(self, request):
		email = request.data.get('email')
		password = request.data.get('password')
		first_name = request.data.get('first_name')
		last_name = request.data.get('last_name')

		if not email or not password or not first_name or not last_name:
			return Response({'message': 'missing fields'}, status=status.HTTP_400_BAD_REQUEST)
		
		try:
			validate_password(password)
		except ValidationError as e: # todo: front should check return message
			return Response({'message': e.messages}, status=status.HTTP_400_BAD_REQUEST)

		user = User.objects.filter(email=email).first()
		if user:
			return Response({'message': 'user with this email already exists'}, status=status.HTTP_400_BAD_REQUEST)
		user = User.objects.create_user(email=email, password=password, first_name=first_name, last_name=last_name)
		user.set_password(password)
		user.save()
		return Response({'user': user.serialized}, status=status.HTTP_201_CREATED)

	# update user data
	@verify_token
	def put(self, request):
		user = request.user
		if request.data.get('email') and request.data.get('email') != user.email:
			return Response({'message': 'email cannot be changed'}, status=status.HTTP_400_BAD_REQUEST)
		user.first_name = request.data.get('first_name', user.first_name)
		user.last_name = request.data.get('last_name', user.last_name)
		password = request.data.get('password')
		if password:
			try:
				validate_password(password)
			except ValidationError as e:
				return Response({'message': e.messages}, status=status.HTTP_400_BAD_REQUEST)
			user.set_password(password)
		user.save()
		return Response({'user': user.serialized}, status=status.HTTP_200_OK)
