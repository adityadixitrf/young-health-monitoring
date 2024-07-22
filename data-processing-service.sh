# app.py
echo "from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/process', methods=['POST'])
def process_data():
    data = request.json
    heart_rate_data = data.get('heart_rate', [])
    if heart_rate_data:
        avg_heart_rate = sum(heart_rate_data) / len(heart_rate_data)
        return jsonify({\"average_heart_rate\": avg_heart_rate})
    return jsonify({\"error\": \"no heart rate data\"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)" > data-processing-service/app.py

# requirements.txt
echo "Flask" > data-processing-service/requirements.txt

# Dockerfile
echo "FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD [\"python\", \"app.py\"]" > data-processing-service/Dockerfile
