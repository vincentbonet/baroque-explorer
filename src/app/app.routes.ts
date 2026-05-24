import { Routes } from '@angular/router';
import { TimelineComponent } from './components/timeline/timeline.component';

export const routes: Routes = [
  {
    path: '',
    component: TimelineComponent
  },
  {
    path: 'decade/:year',
    loadComponent: () =>
      import('./components/decade-view/decade-view.component')
        .then(m => m.DecadeViewComponent)
  },
  {
    path: 'artist/:id',
    loadComponent: () =>
      import('./components/detail-panel/detail-panel.component')
        .then(m => m.DetailPanelComponent)
  },
  {
    path: '**',
    redirectTo: ''
  }
];