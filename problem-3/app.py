from flask import Flask, request, jsonify

app = Flask(__name__)
status = {"status": "OK"}

@app.route('/api/v1/status', methods=['GET', 'POST'])
def api_status():
    global status
    if request.method == 'POST':
        status = request.get_json()
        return jsonify(status), 201
    else:
        return jsonify(status), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)

