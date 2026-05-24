import { Routes } from '@angular/router';
import { ShellComponent } from './components/shell/shell.component';

export const routes: Routes = [
  {
    path: '',
    component: ShellComponent,
    children: [
      {
        path: '',
        loadComponent: () =>
          import('./components/timeline/timeline.component')
            .then(m => m.TimelineComponent)
      },
      {
        path: 'map',
        loadComponent: () =>
          import('./components/map/map.component')
            .then(m => m.MapComponent)
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
      }
    ]
  },
  { path: '**', redirectTo: '' }
];