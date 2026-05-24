import { Component, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Artist } from '../../models';

@Component({
  selector: 'app-artist-card',
  standalone: true,
  imports: [RouterLink],
  templateUrl: './artist-card.component.html',
  styleUrl: './artist-card.component.css'
})
export class ArtistCardComponent {
  artist = input.required<Artist>();
}