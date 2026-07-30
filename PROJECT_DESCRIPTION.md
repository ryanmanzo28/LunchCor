# LunchCor Project Description

## Overview
LunchCor is a Nuxt 4-based restaurant discovery and voting application with a MySQL-backed backend. The app allows users to browse restaurants, view menu information, cast votes, and access admin-only analytics and moderation tools.

## Tech Stack
- Frontend: Nuxt 4, Vue 3, Pinia
- Backend/API: Nitro server routes under the server directory
- Database: MySQL 8 with SQL initialization and seed scripts
- Authentication: session-style auth with password hashing and server-side validation
- Data parsing: HTML menu scraping using Cheerio

## Project Structure
- src/app.vue: main app shell
- src/pages/: public pages such as login, restaurant listing, and admin dashboard
- src/components/: reusable Vue components
- src/stores/: Pinia stores for auth, restaurants, and user state
- src/server/api/: convention-based Nitro API endpoints
- src/server/utils/: shared server-side helpers for auth, restaurants, validation, and admin checks
- src/utils/: shared client/server utilities including menu parsing and JWT verification
- database/init/: SQL schema and seed files for the MySQL database

## Core Features
### Restaurant Management
- Restaurants are stored in the MySQL database with metadata such as description, menu data, and vote counts.
- Restaurant creation includes optional link-based menu scraping.
- Restaurant listing and detail flows are backed by server-side repository logic.

### Menu Parsing
- Menu items can be scraped from restaurant links using HTML parsing.
- The parser extracts likely menu entries from common page structures and stores them as structured menu item objects.

### Voting
- Users can cast votes for restaurants.
- Vote persistence uses a dedicated votes table with a uniqueness constraint so each user can only cast one vote.
- Restaurant vote totals are updated alongside the vote record.

### Authentication and Admin Access
- User login and account creation are handled through server endpoints.
- Passwords are hashed before storage.
- Admin-only routes use helper logic to verify admin credentials for protected endpoints.

### Admin Tools
- Admin endpoints support analytics, vote reset, and restaurant deletion flows.
- Admin functionality is intentionally minimal and focused on required operational tasks.

## Technical Implementation Notes
### API Design
- The backend uses Nitro convention-based route files, with endpoints organized by domain such as auth, users, restaurants, votes, and admin.
- Shared logic is kept in server utilities rather than duplicated in each endpoint file.

### Database Layer
- Schema setup is maintained through SQL scripts in database/init.
- The database includes tables for users, restaurants, meals, orders, reviews, votes, and related metadata.
- The votes table is designed to enforce one vote per user while tracking the restaurant that received the vote.

### Data Flow
- Frontend components call Nuxt/Nitro endpoints.
- Server handlers validate request input, connect to MySQL, and return structured payloads.
- Shared utility modules help centralize database access and data transformation.

## Current State
The codebase is currently in a working state with core restaurant, voting, menu parsing, and admin-protected functionality implemented. The project has been stabilized around convention-based server routes and shared utilities, with a focus on reliability and minimal, maintainable changes.
