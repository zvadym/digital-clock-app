# Render Deployment Guide

This guide explains how to deploy your Digital Clock App to Render hosting with automated CI/CD.

## 🚀 Quick Setup

### 1. Create Render Account
1. Go to [render.com](https://render.com) and sign up
2. Connect your GitHub account

### 2. Deploy to Render

#### Option A: Automatic Deployment (Recommended)
1. In Render dashboard, click "New +" → "Static Site"
2. Connect your GitHub repository
3. Configure the deployment:
   - **Build Command**: `npm ci && npm run build`
   - **Publish Directory**: `dist`
   - **Auto-Deploy**: `Yes` (enables automatic deploys on push to main)

#### Option B: Using render.yaml (Infrastructure as Code)
1. The `render.yaml` file in your repo root will automatically configure the deployment
2. In Render dashboard, click "New +" → "Blueprint"
3. Connect your repository - Render will detect the `render.yaml` file

### 3. GitHub Actions Setup

Two workflows are provided:

1. **`ci.yml`** (Recommended): Runs basic checks, Render handles deployment
2. **`deploy-render.yml`**: Full CI/CD with GitHub Actions deployment

## 🔧 GitHub Repository Settings

### Required GitHub Secrets (Only for deploy-render.yml workflow)

If you choose to use the `deploy-render.yml` workflow, add these secrets in GitHub:

**Repository Settings → Secrets and variables → Actions → New repository secret**

| Secret Name | Description | How to Get |
|-------------|-------------|------------|
| `RENDER_SERVICE_ID` | Your Render service ID | Found in Render service URL: `https://dashboard.render.com/static/srv-XXXXX` |
| `RENDER_API_KEY` | Render API key for deployments | Render Account Settings → API Keys → Create API Key |

### How to Get Render Credentials

1. **Service ID**:
   - Go to your Render service dashboard
   - Copy the service ID from the URL (e.g., `srv-abcd1234efgh5678`)

2. **API Key**:
   - Go to Render Account Settings
   - Click "API Keys" in the sidebar
   - Click "Create API Key"
   - Give it a name (e.g., "GitHub Actions")
   - Copy the generated key

## 🏗️ Build Configuration

The app is configured to build with:
- **Node.js**: 18
- **Build Command**: `npm ci && npm run build`
- **Output Directory**: `dist`
- **Framework**: Vue.js with Vite

## 🔄 Deployment Flow

### Automatic Deployment (Recommended)
1. Push code to `main` branch
2. GitHub Actions runs CI checks (`ci.yml`)
3. Render automatically detects the push and deploys
4. Your app is live!

### Manual GitHub Actions Deployment
1. Push code to `main` branch
2. GitHub Actions runs tests and build checks
3. If successful, deploys to Render via API
4. Your app is live!

## 🌐 Environment Variables

### GitHub Environment Variables (Optional)
Add these in **Repository Settings → Secrets and variables → Actions → Variables**:

| Variable Name | Value | Purpose |
|---------------|--------|---------|
| `NODE_VERSION` | `18` | Specify Node.js version |
| `RENDER_SERVICE_NAME` | `digital-clock-app` | Service name for deployment |

## 🚦 CI/CD Features

The pipeline includes:
- ✅ Dependency installation and caching
- ✅ Build verification
- ✅ Bundle size checking
- ✅ Lint checking (if configured)
- ✅ Automated deployment on main branch
- ✅ PR build verification

## 🛠️ Troubleshooting

### Common Issues

1. **Build Fails**
   - Check Node.js version compatibility
   - Verify all dependencies are in `package.json`
   - Check build logs in GitHub Actions

2. **Render Deployment Fails**
   - Verify build command and publish directory
   - Check Render build logs
   - Ensure `dist` folder contains `index.html`

3. **GitHub Actions Fails**
   - Check secrets are correctly set
   - Verify API key permissions
   - Check service ID format

### Build Commands Reference
```bash
# Local development
npm run dev

# Production build
npm run build

# Preview build locally
npm run preview
```

## 📱 Your App URLs

After deployment:
- **Production**: `https://your-app-name.onrender.com`
- **GitHub**: Your repository with green checkmarks ✅

## 🔄 Next Steps

1. **Custom Domain**: Configure in Render dashboard
2. **SSL**: Automatically provided by Render
3. **Environment Variables**: Add in Render service settings if needed
4. **Analytics**: Consider adding Google Analytics or similar

## 📚 Resources

- [Render Static Sites Documentation](https://render.com/docs/static-sites)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Vite Deployment Guide](https://vitejs.dev/guide/static-deploy.html)