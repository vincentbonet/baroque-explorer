import { Component, input } from '@angular/core';
import { Event } from '../../models';

@Component({
  selector: 'app-event-badge',
  standalone: true,
  imports: [],
  templateUrl: './event-badge.component.html',
  styleUrl: './event-badge.component.css'
})
export class EventBadgeComponent {
  event = input.required<Event>();
}