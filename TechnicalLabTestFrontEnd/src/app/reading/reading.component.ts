import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ReadingServiceService } from './reading-service.service';


@Component({
  selector: 'app-reading',
  templateUrl: './reading.component.html',
  styleUrls: ['./reading.component.css']
})

export class ReadingComponent implements OnInit { 
buildingList:any;
constructor(private readingService:ReadingServiceService){}

  ngOnInit(){
this.readingService.getAllBuilding().subscribe((buildingList:any) =>  {
  this.buildingList=buildingList;
});
  }
    rangeFormGroup = new FormGroup({  
      start: new FormControl(null, Validators.required),  
      end: new FormControl(null, Validators.required)  
    });
  

}
