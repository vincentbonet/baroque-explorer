import { Component, inject } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { map, switchMap } from 'rxjs';
import { BaroqueApiService } from '../../services/baroque-api.service';
import { Artist, Event, Artwork } from '../../models';
import { ArtistCardComponent } from '../artist-card/artist-card.component';
import { ArtworkCardComponent } from '../artwork-card/artwork-card.component';
import { ArtworkLightboxComponent } from '../artwork-lightbox/artwork-lightbox.component';
import { EventBadgeComponent } from '../event-badge/event-badge.component';

@Component({
  selector: 'app-decade-view',
  standalone: true,
  imports: [
    RouterLink,
    ArtistCardComponent,
    ArtworkCardComponent,
    EventBadgeComponent,
    ArtworkLightboxComponent
  ],
  templateUrl: './decade-view.component.html',
  styleUrl: './decade-view.component.css'
})
export class DecadeViewComponent {
  private route = inject(ActivatedRoute);
  private api = inject(BaroqueApiService);

  private decade$ = this.route.paramMap.pipe(
    map(params => Number(params.get('year')))
  );

  decade = toSignal(this.decade$, { initialValue: 0 });

  period = toSignal(
    this.decade$.pipe(switchMap(d => this.api.getPeriod(d)))
  );

  artists = toSignal(
    this.decade$.pipe(switchMap(d => this.api.getArtists(d))),
    { initialValue: [] as Artist[] }
  );

  events = toSignal(
    this.decade$.pipe(switchMap(d => this.api.getEvents(d))),
    { initialValue: [] as Event[] }
  );

  selectedArtwork: Artwork | null = null;

  openArtwork(artwork: Artwork) {
    this.selectedArtwork = artwork;
  }

  closeArtwork() {
    this.selectedArtwork = null;
  }
}