import { Component, computed, inject } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { switchMap, map } from 'rxjs';
import { ApiService } from '../../services/baroque-api.service';
import { ArtistCardComponent } from '../artist-card/artist-card.component';
import { ArtworkCardComponent } from '../artwork-card/artwork-card.component';
import { ArtworkLightboxComponent } from '../artwork-lightbox/artwork-lightbox.component';
import { Artwork } from '../../models';

@Component({
  selector: 'app-detail-panel',
  standalone: true,
  imports: [
    RouterLink,
    ArtistCardComponent,
    ArtworkCardComponent,
    ArtworkLightboxComponent
  ],
  templateUrl: './detail-panel.component.html',
  styleUrl: './detail-panel.component.css'
})
export class DetailPanelComponent {
  private route = inject(ActivatedRoute);
  private api = inject(ApiService);

  selectedArtwork: Artwork | null = null;

  artist = toSignal(
    this.route.paramMap.pipe(
      map(params => Number(params.get('id'))),
      switchMap(id => this.api.getArtist(id))
    )
  );

  contemporaries = computed(() => this.artist()?.contemporaries ?? []);

  openArtwork(artwork: Artwork) {
    this.selectedArtwork = artwork;
  }

  closeArtwork() {
    this.selectedArtwork = null;
  }
}