import { Component, inject } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { map, switchMap } from 'rxjs';
import { BaroqueApiService } from '../../services/baroque-api.service';
import { ArtworkCardComponent } from '../artwork-card/artwork-card.component';

@Component({
  selector: 'app-detail-panel',
  standalone: true,
  imports: [RouterLink, ArtworkCardComponent],
  templateUrl: './detail-panel.component.html',
  styleUrl: './detail-panel.component.css'
})
export class DetailPanelComponent {
  private route = inject(ActivatedRoute);
  private api = inject(BaroqueApiService);

  artist = toSignal(
    this.route.paramMap.pipe(
      map(p => Number(p.get('id'))),
      switchMap(id => this.api.getArtist(id))
    )
  );
}