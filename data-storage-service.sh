# app.py
echo "from flask import Flask, request, jsonify
import pymongo

app = Flask(__name__)

client = pymongo.MongoClient(\"mongodb://mongodb:27017/\")
db = client[\"young\"]
collection = db[\"health_data\"]
@app.route('/store', methods=['POST'])
def store_data():
    data = request.json
    collection.insert_one(data)
    return jsonify({\"status\": \"data stored\"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)" > data-storage-service/app.py

# requirements.txt
echo "Flask
pymongo" > data-storage-service/requirements.txt

# Dockerfile
echo "FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD [\"python\", \"app.py\"]" > data-storage-service/Dockerfile
