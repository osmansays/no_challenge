import random
from flask import Flask

app = Flask(__name__)

@app.route('/')
def get_random():
    rand = random.randint(0, 200)
    return { 'Random Number': rand }

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')
