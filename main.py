# main.py is the top-level entrypoint of this service.

from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def index() -> str:
    return jsonify({"message": "It works"})

def main() -> None:
    app.run(host='0.0.0.0', port=1010)

if __name__ == "__main__":
    main()
