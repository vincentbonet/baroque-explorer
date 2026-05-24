import { Component, inject, signal } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { filter, map } from 'rxjs';
import { BaroqueApiService } from '../../services/baroque-api.service';

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

  periods = toSignal(this.api.getTimelineMeta(), { initialValue: [] as any[] });

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

  dotSize(density: number, maxDensity: number): number {
    const normalized = density / maxDensity;
    return 7 + normalized * 10; // range: 7px to 17px
  }

  maxDensity(): number {
    const all = this.periods();
    return all.length ? Math.max(...all.map((p: any) => p.density)) : 1;
  }
}