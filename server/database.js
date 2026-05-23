import { DatabaseSync } from 'node:sqlite';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));

export const db = new DatabaseSync(join(__dirname, 'baroque.db'));

db.exec('PRAGMA journal_mode = WAL');

const alreadySeeded = db.prepare(
  "SELECT name FROM sqlite_master WHERE type='table' AND name='periods'"
).get();

if (!alreadySeeded) {
  const seed = readFileSync(join(__dirname, 'baroque-seed.sql'), 'utf8');
  db.exec(seed);
}