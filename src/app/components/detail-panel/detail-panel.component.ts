import { Component, inject } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { map, switchMap } from 'rxjs';
import { BaroqueApiService } from '../../services/baroque-api.service';
import { ArtworkCardComponent } from '../artwork-card/artwork-card.component';
import { ArtistCardComponent } from '../artist-card/artist-card.component';

@Component({
  selector: 'app-detail-panel',
  standalone: true,
  imports: [RouterLink, ArtworkCardComponent, ArtistCardComponent],
  templateUrl: './detail-panel.component.html',
  styleUrl: './detail-panel.component.css'
})
export class DetailPanelComponent {
  private route = inject(ActivatedRoute);
  private api = inject(BaroqueApiService);

  private id$ = this.route.paramMap.pipe(
    map(p => Number(p.get('id')))
  );

  artist = toSignal(
    this.id$.pipe(switchMap(id => this.api.getArtist(id)))
  );

  contemporaries = toSignal(
    this.id$.pipe(switchMap(id => this.api.getContemporaries(id))),
    { initialValue: [] as any[] }
  );
}