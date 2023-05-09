from flask import Blueprint, request, current_app, jsonify, Response, session
from flask.views import MethodView
from flask_cors import cross_origin
from flask_jwt_extended import create_access_token
from flask_jwt_extended import get_jwt_identity
from flask_jwt_extended import jwt_required

import json


authenticate_app = Blueprint('authenticate', __name__)

class AuthenticateView(MethodView):
    @cross_origin(supports_credentials=True)
    def post(self):
        data = request.json
        email = data['email']
        password = data['password']

        user = {
            "email": 'admin@admin.com',
            "password": 'admin1213'
        }

        current_app.logger.debug(data)

        if user['email'] != email:
            return Response(json.dumps({"message": 'Invalid email'}), mimetype='application/json', status=500)

        if user['password'] != password:
            return Response(json.dumps({"message": 'Invalid password'}), mimetype='application/json', status=500)

        access_token = create_access_token(identity=email)

        session['user'] = user
        session['token'] = access_token

        current_app.logger.debug(f'access_token: {access_token}')
        return Response(json.dumps({"message": 'Login successful', "token": access_token}), mimetype='application/json', status=200)

    @jwt_required()
    @cross_origin(supports_credentials=True)
    def get(self):
        session.pop('user', None)
        session.pop('token', None)
        current_app.logger.debug(f'session: {session}')
        return Response(json.dumps({"message": 'Logout successful'}), mimetype='application/json', status=200)


authenticate_view = AuthenticateView.as_view('authenticate_view')

# adding routes
authenticate_app.add_url_rule('/api/v1/authenticate/', view_func=authenticate_view, methods=['POST'])
authenticate_app.add_url_rule('/api/v1/logout/', view_func=authenticate_view, methods=['GET'])