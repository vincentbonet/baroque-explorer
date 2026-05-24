import { Component, inject } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { map, switchMap } from 'rxjs';
import { BaroqueApiService } from '../../services/baroque-api.service';
import { Artist, Event, Period } from '../../models';
import { ArtistCardComponent } from '../artist-card/artist-card.component';
import { EventBadgeComponent } from '../event-badge/event-badge.component';

@Component({
  selector: 'app-decade-view',
  standalone: true,
  imports: [RouterLink, ArtistCardComponent, EventBadgeComponent],
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
    this.decade$.pipe(switchMap(d => this.api.getPeriod(d))),
    { initialValue: null as Period | null }
  );

  artists = toSignal(
    this.decade$.pipe(switchMap(d => this.api.getArtists(d))),
    { initialValue: [] as Artist[] }
  );

  events = toSignal(
    this.decade$.pipe(switchMap(d => this.api.getEvents(d))),
    { initialValue: [] as Event[] }
  );
}