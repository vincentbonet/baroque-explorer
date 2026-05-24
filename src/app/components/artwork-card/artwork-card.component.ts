import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Artwork } from '../../models';

@Component({
  selector: 'app-artwork-card',
  standalone: true,
  templateUrl: './artwork-card.component.html',
  styleUrl: './artwork-card.component.css'
})
export class ArtworkCardComponent {
  @Input({ required: true }) artwork!: Artwork;
  @Output() selected = new EventEmitter<Artwork>();

  open() {
    this.selected.emit(this.artwork);
  }
}