import { Component, input } from '@angular/core';
import { Artwork } from '../../models';

@Component({
  selector: 'app-artwork-card',
  standalone: true,
  imports: [],
  templateUrl: './artwork-card.component.html',
  styleUrl: './artwork-card.component.css'
})
export class ArtworkCardComponent {
  artwork = input.required<Artwork>();
}