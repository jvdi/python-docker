from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello World'


if __name__ == '__name__':
    app.run()

app.run(host='0.0.0.0', port=5000) # this setting just for test not for production