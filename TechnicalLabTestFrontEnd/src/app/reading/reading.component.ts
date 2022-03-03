import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';


@Component({
  selector: 'app-reading',
  templateUrl: './reading.component.html',
  styleUrls: ['./reading.component.css']
})
export class ReadingComponent { 

  
    rangeFormGroup = new FormGroup({  
      start: new FormControl(null, Validators.required),  
      end: new FormControl(null, Validators.required)  
    }) 
  

}
