import { Component, EventEmitter, HostListener, Input, Output } from '@angular/core';
import { Artwork } from '../../models';

@Component({
  selector: 'app-artwork-lightbox',
  standalone: true,
  templateUrl: './artwork-lightbox.component.html',
  styleUrl: './artwork-lightbox.component.css'
})
export class ArtworkLightboxComponent {
  @Input({ required: true }) artwork!: Artwork;
  @Output() closed = new EventEmitter<void>();

  close() {
    this.closed.emit();
  }

  onImageError(event: Event) {
    const img = event.target as HTMLImageElement;
    img.src = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/No_image_available.svg/640px-No_image_available.svg.png';
  }

  @HostListener('document:keydown.escape')
  onEscape() {
    this.close();
  }
}