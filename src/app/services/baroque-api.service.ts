import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Artist, Artwork, Event, Period } from '../models';

@Injectable({ providedIn: 'root' })
export class BaroqueApiService {
  private http = inject(HttpClient);
  private base = 'http://localhost:3000/api';

  getPeriods(): Observable<Period[]> {
    return this.http.get<Period[]>(`${this.base}/periods`);
  }

  getPeriod(decade: number): Observable<Period> {
    return this.http.get<Period>(`${this.base}/periods/${decade}`);
  }

  getArtists(decade?: number): Observable<Artist[]> {
    const url = decade
      ? `${this.base}/artists?decade=${decade}`
      : `${this.base}/artists`;
    return this.http.get<Artist[]>(url);
  }

  getArtist(id: number): Observable<Artist> {
    return this.http.get<Artist>(`${this.base}/artists/${id}`);
  }

  getArtwork(id: number): Observable<Artwork> {
    return this.http.get<Artwork>(`${this.base}/artworks/${id}`);
  }

  getTimelineMeta(): Observable<any[]> {
  return this.http.get<any[]>(`${this.base}/timeline-meta`);
  } 

  getContemporaries(artistId: number): Observable<Artist[]> {
    return this.http.get<Artist[]>(`${this.base}/artists/${artistId}/contemporaries`);
  }

  getMapArtists(): Observable<any[]> {
    return this.http.get<any[]>(`${this.base}/map/artists`);
  }

  getEvents(decade?: number): Observable<Event[]> {
    const url = decade
      ? `${this.base}/events?decade=${decade}`
      : `${this.base}/events`;
    return this.http.get<Event[]>(url);
  }
}