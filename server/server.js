import express from 'express'; // Import Express framework
import cors from 'cors';  // Import CORS middleware
import { db } from './database.js';

const app = express(); 
const PORT = 3000; 

app.use(cors()); // Enable CORS for all routes
app.use(express.json()); // Parse JSON bodies 

app.get('/api/periods', (req, res) => {
  const periods = db.prepare('SELECT * FROM periods ORDER BY decade').all();
  res.json(periods);
}); // Endpoint to get all periods 

app.get('/api/periods/:decade', (req, res) => {
    const { decade } = req.params; 
    const period = db.prepare('SELECT * FROM periods WHERE decade = ?').get(decade);
    res.json(period || {});
}); // Endpoint to get a specific period by decade

app.get('/api/artists', (req, res) => {
  const { decade } = req.query;
  if (decade) {
    const artists = db.prepare(`
      SELECT DISTINCT a.* FROM artists a
      JOIN artist_periods ap ON a.id = ap.artist_id
      WHERE ap.decade = ?
      ORDER BY a.name
    `).all(decade);
    res.json(artists);
  } else {
    const artists = db.prepare('SELECT * FROM artists ORDER BY name').all();
    res.json(artists);
  }
}); // Endpoint to get artists, optionally filtered by decade

app.get('/api/artists/:id', (req, res) => {
  const { id } = req.params;
  const artist = db.prepare('SELECT * FROM artists WHERE id = ?').get(id);
  const artworks = db.prepare('SELECT * FROM artworks WHERE artist_id = ?').all(id);
  res.json({ ...artist, artworks });
});
// Endpoint to get a specific artist by ID, including their artworks

import express from 'express';
import cors from 'cors';
import { db } from './database.js';

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// GET /api/periods
app.get('/api/periods', (req, res) => {
  const periods = db.prepare('SELECT * FROM periods ORDER BY decade').all();
  res.json(periods);
});

// GET /api/periods/:decade
app.get('/api/periods/:decade', (req, res) => {
  const { decade } = req.params;
  const period = db.prepare('SELECT * FROM periods WHERE decade = ?').get(decade);
  res.json(period || {});
});

// GET /api/artists?decade=1620
app.get('/api/artists', (req, res) => {
  const { decade } = req.query;
  if (decade) {
    const artists = db.prepare(`
      SELECT DISTINCT a.* FROM artists a
      JOIN artist_periods ap ON a.id = ap.artist_id
      WHERE ap.decade = ?
      ORDER BY a.name
    `).all(decade);
    res.json(artists);
  } else {
    const artists = db.prepare('SELECT * FROM artists ORDER BY name').all();
    res.json(artists);
  }
});

// GET /api/artists/:id
app.get('/api/artists/:id', (req, res) => {
  const { id } = req.params;
  const artist = db.prepare('SELECT * FROM artists WHERE id = ?').get(id);
  const artworks = db.prepare('SELECT * FROM artworks WHERE artist_id = ?').all(id);
  res.json({ ...artist, artworks });
});

// GET /api/artworks/:id
app.get('/api/artworks/:id', (req, res) => {
  const { id } = req.params;
  const artwork = db.prepare('SELECT * FROM artworks WHERE id = ?').get(id);
  res.json(artwork || {});
});

// GET /api/events?decade=1620
app.get('/api/events', (req, res) => {
  const { decade } = req.query;
  if (decade) {
    const start = parseInt(decade);
    const end = start + 10;
    const events = db.prepare(`
      SELECT * FROM events WHERE year >= ? AND year < ?
      ORDER BY year
    `).all(start, end);
    res.json(events);
  } else {
    const events = db.prepare('SELECT * FROM events ORDER BY year').all();
    res.json(events);
  }
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));