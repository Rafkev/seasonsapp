from flask import Flask, render_template
import datetime

app = Flask(__name__)

def get_season(month):
    if month in [12, 1, 2]:
        return "Winter"
    elif month in [3, 4, 5]:
        return "Spring"
    elif month in [6, 7, 8]:
        return "Summer"
    else:
        return "Autumn"

@app.route("/")
def index():
    now = datetime.datetime.now()
    current_month = now.month
    season = get_season(current_month)
    return render_template("index.html", season=season)

if __name__ == "__main__":
    app.run(debug=True)
