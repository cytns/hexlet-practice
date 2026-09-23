from flask import Flask, render_template

from partner_service import get_partners


app = Flask(__name__)


@app.route("/")
def index():
    partners = get_partners()
    return render_template("index.html", partners=partners)


app.run(debug=True)