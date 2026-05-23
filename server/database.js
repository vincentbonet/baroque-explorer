import Database from 'better-sqlite3';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));

export const db = new Database(join(__dirname, 'baroque.db'));
db.pragma('journal_mode = WAL');

const seed = readFileSync(join(__dirname, 'baroque-seed.sql'), 'utf8');
db.exec(seed);