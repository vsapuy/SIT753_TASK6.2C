from flask import Flask, request, render_template
import math
app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    result = None
    if request.method == "POST":
        try:
            # Get the mW value from the form
            mw = float(request.form["mw"])
            
            # Calculate dBm
            if mw > 0:
                dbm = 10 * (math.log10(mw))
                result = f"{mw} mW is equivalent to {dbm:.2f} dBm."
            else:
                result = "mW value must be greater than 0."
        except ValueError:
            result = "Invalid input. Please enter a numeric value."
    
    return render_template("index.html", result=result)

if __name__ == "__main__":
    app.run(debug=True)
