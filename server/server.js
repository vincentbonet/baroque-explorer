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

app.get('/api/timeline-meta', (req, res) => {
  const rows = db.prepare(`
    SELECT
      p.decade,
      p.summary,
      p.historical_context,
      COUNT(DISTINCT ap.artist_id) as artist_count,
      COUNT(DISTINCT e.id)         as event_count,
      COUNT(DISTINCT ap.artist_id) + COUNT(DISTINCT e.id) as density
    FROM periods p
    LEFT JOIN artist_periods ap ON ap.decade = p.decade
    LEFT JOIN events e ON e.year >= p.decade AND e.year < p.decade + 10
    GROUP BY p.decade
    ORDER BY p.decade
  `).all();
  res.json(rows);
});

app.get('/api/artists/:id/contemporaries', (req, res) => {
  const subject = db.prepare(
    'SELECT * FROM artists WHERE id = ?'
  ).get(req.params.id);

  if (!subject) return res.status(404).json({ error: 'Artist not found' });

  const rows = db.prepare(`
    SELECT DISTINCT a.*
    FROM artists a
    JOIN artist_periods ap1 ON ap1.artist_id = a.id
    JOIN artist_periods ap2 ON ap2.decade = ap1.decade
    WHERE ap2.artist_id = ?
      AND a.id != ?
    ORDER BY a.birth_year
  `).all(subject.id, subject.id);

  res.json(rows);
});

app.get('/api/map/artists', (req, res) => {
  const rows = db.prepare(`
    SELECT
      a.id,
      a.name,
      a.nationality,
      a.birth_year,
      a.death_year,
      a.style,
      (SELECT title FROM artworks WHERE artist_id = a.id LIMIT 1)     as sample_artwork_title,
      (SELECT image_url FROM artworks WHERE artist_id = a.id LIMIT 1) as sample_artwork_url
    FROM artists a
    ORDER BY a.nationality, a.name
  `).all();
  res.json(rows);
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));