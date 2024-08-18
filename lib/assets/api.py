from flask import Flask, jsonify, request

app = Flask(__name__)


users = []

@app.route('/api/users', methods=['POST'])
def user_registration():

    data = request.get_json()

    if not data or 'name' not in data or 'email' not in data:
        return jsonify({'error': 'invalid data'}), 400
    
    new_user = {
        'id': len(users) + 1,
        'name': data['name'],
        'email': data['email']
    }

    users.append(new_user)

    return jsonify(new_user), 200
    
@app.route('/api/users', methods=['GET'])
def list_users():
    return jsonify(users), 201

if __name__ == '__main__':
    app.run(port=5000, debug=True)