from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

@app.route('/collect', methods=['POST'])
def collect_data():
    data = request.json
    response = requests.post('http://data-storage-service:5001/store', json=data)
    return jsonify({"status": "data collected", "response": response.json()})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
