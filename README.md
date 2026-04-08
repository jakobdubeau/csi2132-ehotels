# eHotels

CSI2132 Databases I Course Project  
  
Jakob Dubeau - 300442742  
William Bickerton - 300417591

## Tech Stack

- **DBMS:** PostgreSQL
- **Language:** JavaScript
- **Framework:** Next.js 16 (React 19)
- **Styling:** Tailwind CSS
- **DB Driver:** node-postgres (pg)

## Prerequisites

- [Node.js](https://nodejs.org/)
- [PostgreSQL](https://www.postgresql.org/)

## Installation

1. **Clone the repository**
   ```bash
   git clone <repo-url>
   cd csi2132-ehotels
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Configure the database connection**

   Create a `.env.local` file in the project root:
   ```
   DATABASE_URL=postgresql://<user>:<password>@localhost:5432/ehotels
   ```
   Replace `<user>` and `<password>` with your PostgreSQL credentials.

## Database Setup

Run the following commands in order to create and populate the database:

1. **Create the database**
   ```bash
   psql -U <user> -f db/create_db.sql
   ```

2. **Create the schema**
   ```bash
   psql -U <user> -d ehotels -f db/schema.sql
   ```

3. **Create the triggers**
   ```bash
   psql -U <user> -d ehotels -f db/triggers.sql
   ```

4. **Seed the data**
   ```bash
   psql -U <user> -d ehotels -f db/seed.sql
   ```

5. **Create the views**
   ```bash
   psql -U <user> -d ehotels -f db/views.sql
   ```

6. **Create the indexes**
   ```bash
   psql -U <user> -d ehotels -f db/indexes.sql
   ```

## Running the Application

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.