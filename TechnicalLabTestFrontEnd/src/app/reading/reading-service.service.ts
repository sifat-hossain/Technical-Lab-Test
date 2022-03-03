import { Injectable } from '@angular/core';
import{HttpClient} from '@angular/common/http'
@Injectable({
  providedIn: 'root'
})
export class ReadingServiceService {

  constructor(private http:HttpClient) { }
  getAllBuilding(){
    return this.http.get('https://localhost:44391/api/BuildingAPI',{responseType: 'text'});
  }
}
