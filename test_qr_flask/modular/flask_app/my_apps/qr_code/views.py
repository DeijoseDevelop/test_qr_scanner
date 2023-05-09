from flask import Blueprint, request, current_app, jsonify, Response, session
from flask.views import MethodView
from flask_cors import cross_origin
from flask_jwt_extended import jwt_required

import json

from my_apps.qr_code.models.qr_code import QRCode


qr_code_app = Blueprint('qr_code', __name__)

class QRView(MethodView):

    # @jwt_required()
    @cross_origin(supports_credentials=True)
    def post(self):
        data = request.json
        current_app.logger.debug(data)

        qr_code = QRCode()
        qr_code.encrypt_data(data=data)
        image = qr_code.generate_image()
        image.save("/code/modular/flask_app/my_apps/utils/qrcode/qr.jpg")

        # image_base64 = qr_code.convert_image_to_base64(image)


        return Response(json.dumps({"message": 'QR code created Successful'}), mimetype='application/json', status=200)

qr_code_view = QRView.as_view('qr_code_view')

# adding routes
qr_code_app.add_url_rule('/api/v1/generate/qr/', view_func=qr_code_view, methods=['POST'])