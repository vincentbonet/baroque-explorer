import express from 'express';
import cors from 'cors';
import { db } from './database.js';

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

app.get('/api/periods', (req, res) => {
  const rows = db.prepare('SELECT * FROM periods ORDER BY decade').all();
  res.json(rows);
});

app.get('/api/periods/:decade', (req, res) => {
  const row = db.prepare('SELECT * FROM periods WHERE decade = ?').get(req.params.decade);
  res.json(row || {});
});

app.get('/api/artists', (req, res) => {
  const { decade } = req.query;
  if (decade) {
    const rows = db.prepare(`
      SELECT DISTINCT a.* FROM artists a
      JOIN artist_periods ap ON a.id = ap.artist_id
      WHERE ap.decade = ?
      ORDER BY a.name
    `).all(decade);
    res.json(rows);
  } else {
    const rows = db.prepare('SELECT * FROM artists ORDER BY name').all();
    res.json(rows);
  }
});

app.get('/api/artists/:id', (req, res) => {
  const artist = db.prepare('SELECT * FROM artists WHERE id = ?').get(req.params.id);
  if (!artist) return res.status(404).json({ error: 'Artist not found' });
  const artworks = db.prepare('SELECT * FROM artworks WHERE artist_id = ?').all(req.params.id);
  res.json({ ...artist, artworks });
});

app.get('/api/artworks/:id', (req, res) => {
  const row = db.prepare('SELECT * FROM artworks WHERE id = ?').get(req.params.id);
  res.json(row || {});
});

app.get('/api/events', (req, res) => {
  const { decade } = req.query;
  if (decade) {
    const start = parseInt(decade);
    const rows = db.prepare(
      'SELECT * FROM events WHERE year >= ? AND year < ? ORDER BY year'
    ).all(start, start + 10);
    res.json(rows);
  } else {
    const rows = db.prepare('SELECT * FROM events ORDER BY year').all();
    res.json(rows);
  }
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));