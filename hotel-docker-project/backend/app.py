from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
import time

app = Flask(__name__)
CORS(app)

db = None

while db is None:
    try:
        db = mysql.connector.connect(
            host="mysql",
            user="hoteladmin",
            password="Hotel123",
            database="hotel_db"
        )
        print("Connected to MySQL")
    except:
        print("Waiting for MySQL...")
        time.sleep(5)

@app.route("/")
def home():
    return "Hotel Backend Running"

@app.route("/bookings", methods=["GET"])
def get_bookings():

    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM bookings")

    data = cursor.fetchall()

    return jsonify(data)

@app.route("/bookings", methods=["POST"])
def add_booking():

    data = request.json

    cursor = db.cursor()

    cursor.execute(
        """
        INSERT INTO bookings
        (guest_name,email,room_type)
        VALUES(%s,%s,%s)
        """,
        (
            data["guest_name"],
            data["email"],
            data["room_type"]
        )
    )

    db.commit()

    return jsonify({"message":"Booking Added"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
