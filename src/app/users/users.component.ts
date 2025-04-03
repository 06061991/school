import { Component } from '@angular/core';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent {
  title: string="welcome user one"
  imageUrl : string="/assets/img/user-love.jpg"
  property: boolean=true
  onclick(){
    alert( "clicked")
  }
Name: string= 'asslam';
isvisible=true

}
