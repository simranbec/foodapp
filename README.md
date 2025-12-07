# Food App

A beautiful food recipe application built with HTML, Tailwind CSS, and vanilla JavaScript.

## Features

- Browse recipes by meal type (Breakfast, Lunch, Dinner, Dessert)
- Search recipes by name
- View detailed recipe information including ingredients and steps
- Responsive design
- Customizable colors and fonts (Canva integration)

## Deployment

This project is configured for deployment on Vercel.

### Deploy to Vercel

1. **Using Vercel CLI:**
   ```bash
   npm i -g vercel
   vercel
   ```

2. **Using GitHub Integration:**
   - Push your code to GitHub
   - Import your repository in [Vercel](https://vercel.com)
   - Vercel will automatically detect and deploy your project

3. **Using Vercel Dashboard:**
   - Go to [vercel.com](https://vercel.com)
   - Click "New Project"
   - Import your Git repository or upload the project folder

### Project Structure

```
foodapp/
├── foodapp.html    # Main application file
├── vercel.json     # Vercel configuration
└── README.md       # This file
```

## Local Development

Simply open `foodapp.html` in your web browser or use a local server:

```bash
# Using Python
python -m http.server 8000

# Using Node.js (http-server)
npx http-server

# Using PHP
php -S localhost:8000
```

Then visit `http://localhost:8000/foodapp.html`

## Notes

- The app uses Tailwind CSS via CDN
- Canva SDK integration is included for customization features
- The app works as a standalone HTML file with no build process required

