import { Component, inject, OnInit, OnDestroy, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import { BaroqueApiService } from '../../services/baroque-api.service';
import * as L from 'leaflet';

const ARTIST_LOCATIONS: Record<string, [number, number]> = {
  'Caravaggio':              [41.9028, 12.4964],  // Rome
  'Rembrandt van Rijn':      [52.3676, 4.9041],   // Amsterdam
  'Johannes Vermeer':        [51.9225, 4.4792],   // Delft
  'Peter Paul Rubens':       [51.2194, 4.4025],   // Antwerp
  'Diego Velázquez':         [40.4168, -3.7038],  // Madrid
  'Gian Lorenzo Bernini':    [41.9028, 12.4964],  // Rome
  'Artemisia Gentileschi':   [41.9028, 12.4964],  // Rome
  'Frans Hals':              [52.3874, 4.6462],   // Haarlem
  'Nicolas Poussin':         [41.9028, 12.4964],  // Rome (lived there)
  'Bartolomé Murillo':       [37.3891, -5.9845],  // Seville
  'Anthony van Dyck':        [51.2194, 4.4025],   // Antwerp
  'Luca Giordano':           [40.8518, 14.2681],  // Naples
  'Judith Leyster':          [52.3874, 4.6462],   // Haarlem
  'José de Ribera':          [40.8518, 14.2681],  // Naples
  'Giovanni Battista Tiepolo': [45.4408, 12.3155], // Venice
  'Claude Lorrain':          [41.9028, 12.4964],  // Rome (lived there)
  'Georges de La Tour':      [48.6921, 6.1844],   // Lorraine/Nancy
  'Alonso Cano':             [37.1773, -3.5986],  // Granada
  'Salvator Rosa':           [40.8518, 14.2681],  // Naples
};

@Component({
  selector: 'app-map',
  standalone: true,
  imports: [RouterLink],
  template: `
    <div class="map-page">
      <header class="map-header">
        <a routerLink="/" class="back">&larr; Back</a>
        <div class="map-title">
          <h1>Baroque Europe</h1>
          <p>Where the masters lived and worked</p>
        </div>
      </header>
      <div id="baroque-map" class="map-container"></div>
    </div>
  `,
  styles: [`
    .map-page {
      height: 100%;
      display: flex;
      flex-direction: column;
    }

    .map-header {
      display: flex;
      align-items: center;
      gap: 1.5rem;
      padding: 1rem 2rem;
      border-bottom: 1px solid var(--border);
      flex-shrink: 0;
    }

    .back {
      color: var(--text-muted);
      text-decoration: none;
      font-size: 0.85rem;
      letter-spacing: 0.05em;
      transition: color 0.2s;
    }

    .back:hover { color: var(--gold); }

    .map-title h1 {
      font-size: 1.4rem;
      color: var(--gold-bright);
    }

    .map-title p {
      font-size: 0.8rem;
      color: var(--text-muted);
    }

    .map-container {
      flex: 1;
    }

    :host ::ng-deep .baroque-marker {
      background: none;
      border: none;
    }

    :host ::ng-deep .marker-dot {
      width: 14px;
      height: 14px;
      background: var(--gold);
      border: 2px solid var(--gold-bright);
      border-radius: 50%;
      cursor: pointer;
      transition: transform 0.2s;
      box-shadow: 0 0 8px rgba(201, 168, 76, 0.5);
    }

    :host ::ng-deep .leaflet-popup-content-wrapper {
      background: #1a1512;
      border: 1px solid #7a6030;
      border-radius: 4px;
      color: #e8d8c0;
      box-shadow: 0 4px 20px rgba(0,0,0,0.6);
    }

    :host ::ng-deep .leaflet-popup-tip {
      background: #7a6030;
    }

    :host ::ng-deep .leaflet-popup-content {
      margin: 12px 16px;
    }

    :host ::ng-deep .leaflet-tile-pane {
      filter: sepia(0.4) brightness(0.7) contrast(1.1);
    }
  `]
})
export class MapComponent implements OnInit, OnDestroy {
  private api = inject(BaroqueApiService);
  private map?: L.Map;

  ngOnInit() {
    this.api.getMapArtists().subscribe(artists => {
      this.initMap(artists);
    });
  }

  ngOnDestroy() {
    this.map?.remove();
  }

  private initMap(artists: any[]) {
    this.map = L.map('baroque-map', {
      center: [48.0, 10.0],
      zoom: 5,
      zoomControl: true,
    });

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors',
      maxZoom: 10,
      minZoom: 4,
    }).addTo(this.map);

    artists.forEach(artist => {
      const coords = ARTIST_LOCATIONS[artist.name];
      if (!coords) return;

      const icon = L.divIcon({
        className: 'baroque-marker',
        html: `<div class="marker-dot"></div>`,
        iconSize: [14, 14],
        iconAnchor: [7, 7],
        popupAnchor: [0, -10],
      });

      const popup = `
        <div style="min-width:160px">
          <div style="font-family:'Playfair Display',serif;font-size:1rem;color:#e8c97e;margin-bottom:4px">
            ${artist.name}
          </div>
          <div style="font-size:0.75rem;color:#8a7660;margin-bottom:8px">
            ${artist.nationality} · ${artist.birth_year}–${artist.death_year}
          </div>
          ${artist.sample_artwork_url ? `
            <img
              src="${artist.sample_artwork_url}"
              style="width:100%;height:90px;object-fit:cover;border-radius:2px;margin-bottom:8px"
            />
          ` : ''}
          <a
            href="/artist/${artist.id}"
            style="font-size:0.8rem;color:#c9a84c;text-decoration:none"
          >
            View artist &rarr;
          </a>
        </div>
      `;

      L.marker(coords, { icon })
        .addTo(this.map!)
        .bindPopup(popup, { maxWidth: 200 });
    });
  }
}