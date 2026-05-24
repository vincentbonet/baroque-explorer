import { Component, inject } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { map, switchMap } from 'rxjs';
import { BaroqueApiService } from '../../services/baroque-api.service';
import { ArtworkCardComponent } from '../artwork-card/artwork-card.component';
import { ArtistCardComponent } from '../artist-card/artist-card.component';
import { ArtworkLightboxComponent } from '../artwork-lightbox/artwork-lightbox.component';
import { Artist, Artwork } from '../../models';

@Component({
  selector: 'app-detail-panel',
  standalone: true,
  imports: [
    RouterLink,
    ArtworkCardComponent,
    ArtistCardComponent,
    ArtworkLightboxComponent
  ],
  templateUrl: './detail-panel.component.html',
  styleUrl: './detail-panel.component.css'
})
export class DetailPanelComponent {
  private route = inject(ActivatedRoute);
  private api = inject(BaroqueApiService);

  selectedArtwork: Artwork | null = null;

  private id$ = this.route.paramMap.pipe(
    map(params => Number(params.get('id')))
  );

  artist = toSignal(
    this.id$.pipe(
      switchMap(id => this.api.getArtist(id))
    )
  );

  contemporaries = toSignal(
    this.id$.pipe(
      switchMap(id => this.api.getContemporaries(id))
    ),
    { initialValue: [] as Artist[] }
  );

  openArtwork(artwork: Artwork) {
    this.selectedArtwork = artwork;
  }

  closeArtwork() {
    this.selectedArtwork = null;
  }
}