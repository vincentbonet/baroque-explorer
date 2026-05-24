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

  onImageError(event: Event) {
    const img = event.target as HTMLImageElement;
    img.src = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/No_image_available.svg/640px-No_image_available.svg.png';
  }
}