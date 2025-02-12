from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import AllowAny

from models.models import User

from django.conf import settings

import jwt
from datetime import datetime, timedelta

def generate_token(user):
	payload = {
		'user_id': user.id,
		'email': user.email,
		'exp': datetime.utcnow() + timedelta(weeks=1),
	}

	token = jwt.encode(payload, settings.SECRET_KEY, algorithm='HS256')
	return token

def verify_token(func):
	def wrapper(self, request):
		auth = request.headers.get('Authorization')
		if not auth or not auth.startswith('Bearer '):
			return Response({'message': 'Unauthorized'}, status=status.HTTP_401_UNAUTHORIZED)
		try:
			decoded = jwt.decode(auth[7:], settings.SECRET_KEY, algorithms=['HS256'])
		except jwt.ExpiredSignatureError:
			return Response({'message': 'Token expired'}, status=status.HTTP_401_UNAUTHORIZED)
		except jwt.InvalidTokenError:
			return Response({'message': 'Invalid token'}, status=status.HTTP_401_UNAUTHORIZED)
		print("decoded", decoded)
		request.user = User.objects.get(id=decoded['user_id'], email__iexact=decoded['email'])
		return func(self, request)
	return wrapper

class Token(APIView):
	
	permissions_classes = [AllowAny]

	def post(self, request):
		if any([not request.data.get('email'), not request.data.get('password')]):
			return Response({'message': 'bad email or password'}, status=status.HTTP_400_BAD_REQUEST)
		email = request.data.get('email')
		password = request.data.get('password')
		if email == "" or password == "":
			return Response({'message': 'bad email or password'}, status=status.HTTP_400_BAD_REQUEST)
		user = User.objects.filter(email__iexact=email).first()
		if user is None:
			return Response({'message': 'bad email or password'}, status=status.HTTP_400_BAD_REQUEST)
		if not user.check_password(password):
			return Response({'message': 'bad email or password'}, status=status.HTTP_400_BAD_REQUEST)
		token = generate_token(user)
		return Response({'token': token}, status=status.HTTP_200_OK)
