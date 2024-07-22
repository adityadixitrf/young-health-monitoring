from flask import Flask, request, jsonify
import pymongo

app = Flask(__name__)

client = pymongo.MongoClient("mongodb://mongodb:27017/")
db = client["young"]
collection = db["health_data"]
@app.route('/store', methods=['POST'])
def store_data():
    data = request.json
    collection.insert_one(data)
    return jsonify({"status": "data stored"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
