import qrcode

import json
import base64
from io  import BytesIO


class QRCode(object):
    def __init__(self, box_size: int = 10, border: int = 4):
        try:
            self.qr = qrcode.QRCode(
                version=1,
                error_correction=qrcode.constants.ERROR_CORRECT_L,
                box_size=box_size,
                border=border,
            )
        except Exception as error:
            print(f"INIT: {error}")

    def encrypt_data(self, data: dict):
        try:
            self.qr.add_data(json.dumps(data))
            self.qr.make(fit=True)
        except Exception as error:
            print(f"ENCRYPT: {error}")

    def generate_image(self, fill_color: str = "black", back_color: str = "white"):
        try:
            img = self.qr.make_image(fill_color=fill_color, back_color=back_color)
            return img
        except Exception as error:
            print(f"IMAGE: {error}")

    def convert_image_to_base64(self, image):
        buffered = BytesIO()
        image.save(buffered)
        return base64.b64encode(buffered.getvalue())