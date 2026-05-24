import { Component, inject } from '@angular/core';
import { Router } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { BaroqueApiService } from '../../services/baroque-api.service';
import { Period } from '../../models';

@Component({
  selector: 'app-timeline',
  standalone: true,
  imports: [],
  templateUrl: './timeline.component.html',
  styleUrl: './timeline.component.css'
})
export class TimelineComponent {
  private api = inject(BaroqueApiService);
  private router = inject(Router);

  periods = toSignal(this.api.getPeriods(), { initialValue: [] as Period[] });

  navigate(decade: number) {
    this.router.navigate(['/decade', decade]);
  }
}