import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { TimelineBarComponent } from '../timeline-bar/timeline-bar.component';

@Component({
  selector: 'app-shell',
  standalone: true,
  imports: [RouterOutlet, TimelineBarComponent],
  templateUrl: './shell.component.html',
  styleUrl: './shell.component.css'
})
export class ShellComponent {}