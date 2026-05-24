import { Component, inject, signal } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { filter, map } from 'rxjs';
import { BaroqueApiService } from '../../services/baroque-api.service';
import { Period } from '../../models';

@Component({
  selector: 'app-timeline-bar',
  standalone: true,
  imports: [],
  templateUrl: './timeline-bar.component.html',
  styleUrl: './timeline-bar.component.css'
})
export class TimelineBarComponent {
  router = inject(Router);
  private api = inject(BaroqueApiService);

  periods = toSignal(this.api.getPeriods(), { initialValue: [] as Period[] });

  hoveredDecade = signal<number | null>(null);

  activeDecade = toSignal(
    this.router.events.pipe(
      filter(e => e instanceof NavigationEnd),
      map(e => {
        const match = (e as NavigationEnd).urlAfterRedirects.match(/\/decade\/(\d+)/);
        return match ? Number(match[1]) : null;
      })
    ),
    { initialValue: null as number | null }
  );

  dotSize(index: number, total: number): number {
    const mid = total / 2;
    const dist = Math.abs(index - mid);
    const normalized = 1 - dist / mid;
    return 8 + normalized * 6;
  }
}