from datetime import datetime
import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    ct = datetime.now()
    hn = os.uname().nodename
    return f"<p>Hello from {hn}! It's now {ct}</p>"

if __name__ == "__main__":
 app.run(host='0.0.0.0', port=8080, debug=True)