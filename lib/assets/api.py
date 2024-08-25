from flask import Flask, jsonify, request, Response
from collections import OrderedDict
import json

app = Flask(__name__)


users = []

@app.route('/api/users', methods=['POST'])
def user_registration():

    data = request.get_json()

    name = data.get('name')
    email = data.get('email')
    phone = data.get('phone')

    if not name or not email or not phone or not name.strip() or not email.strip or not phone.strip:
        return jsonify({'erro': 'Os campos nome, email e phone não podem ser vazios.'}), 400

    new_user = {
        'id': len(users) + 1,
        'name': name,
        'email': email,
        'phone': phone
    }

    users.append(new_user)

    return jsonify(new_user), 200
    
@app.route('/api/users', methods=['GET'])
def list_users():

    order_data = [
        
        OrderedDict({'id': user['id'], 'name': user['name'], 'email': user['email'], 'phone': user['phone']})
        for user in users
    ]

    return Response(json.dumps(order_data), mimetype='application/json'), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)