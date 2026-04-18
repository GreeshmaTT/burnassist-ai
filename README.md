# Burn Assist

This is a Django-based burn severity detection web app.

## Setup for Render

The project is already configured for Render using `render.yaml`.

### What is included
- `burn_project/requirements.txt` for Python dependencies
- `render.yaml` to configure Render build and start commands
- `.gitignore` to exclude local secrets, uploads, model artifacts, and venv files

### Important deployment notes
- `burn_model_final.keras` and `labels.pkl` are not committed to Git and should be provided separately to Render via a secure file, build script, or secret file.
- Set these environment variables in Render:
  - `DJANGO_SECRET_KEY`
  - `DJANGO_DEBUG=false`
  - `DJANGO_ALLOWED_HOSTS=<your-render-app-host>`

### Local development
1. Create and activate a Python 3.10 venv:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```
2. Install dependencies:
   ```bash
   pip install -r burn_project/requirements.txt
   ```
3. Run migrations:
   ```bash
   cd burn_project
   python manage.py migrate
   ```
4. Start local server:
   ```bash
   python manage.py runserver
   ```

### Render deployment
1. Push the repo to GitHub.
2. Create a Render Web Service using this repo.
3. Ensure `render.yaml` is used and environment variables are configured.
4. Deploy.
