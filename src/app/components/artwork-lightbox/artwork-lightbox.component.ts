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

  @HostListener('document:keydown.escape')
  onEscape() {
    this.close();
  }
}