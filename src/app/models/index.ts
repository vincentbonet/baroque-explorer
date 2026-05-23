export interface Period {
  decade: number;
  summary: string;
  historical_context: string;
}

export interface Artist {
  id: number;
  name: string;
  nationality: string;
  birth_year: number;
  death_year: number;
  style: string;
  bio: string;
  artworks?: Artwork[];
}

export interface Artwork {
  id: number;
  artist_id: number;
  title: string;
  year_created: number;
  medium: string;
  location: string;
  image_url: string;
  description: string;
}

export interface Event {
  id: number;
  year: number;
  title: string;
  description: string;
}