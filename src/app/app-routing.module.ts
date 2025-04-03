import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {HeaderfooterComponent} from "./headerfooter/headerfooter.component";
import {LoginComponent} from "./login/login.component";
import {HomeComponent} from "./home/home.component";
import {UsersComponent} from "./users/users.component";
import {ProductComponent} from "./product/product.component";

const routes: Routes = [{
  path:'acceuil',component:HeaderfooterComponent,children:[
    {path:'',component:HomeComponent},
    {path:'users',component:UsersComponent},
    {path:'products',component:ProductComponent}
  ]
},
  {path:'login',component:LoginComponent},
  {path:'',redirectTo:'acceuil', pathMatch:'full'},
  {path:'**',redirectTo:'acceuil'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
