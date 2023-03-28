import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import ShowHotels from './components/ShowHotels';
import CreateHotel from './components/CreateHotel';
import EditHotel from './components/EditHotel';
function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<ShowHotels/>} />
          <Route path='/create' element={<CreateHotel/>} />
          <Route path='/edit/:id' element={<EditHotel/>} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
