import React, {useState, useEffect} from 'react'
import axios from 'axios'
import { Link, useNavigate } from 'react-router-dom'

const endpoint = 'http://127.0.0.1:8000/api/hotelNew'
const endpointHabs = 'http://127.0.0.1:8000/api/habNew'
const endpointAll = 'http://127.0.0.1:8000/api/hotelHabs/'

const CreateHotel = () => {
    const [nombre, setNombre] = useState('')
    const [cuidad, setCuidad] = useState('')
    const [direccion, setDirecion] = useState('')
    const [nit, setNit] = useState(0)
    const [numHabitaciones, setNumHabs] = useState(0)
    const [id_hotel, setIdHotel] = useState(0)
    const [cantidad, setCantidad] = useState(0)
    const [tipoHab, setTipoHab] = useState('')
    const [acomodacion, setAcomodacion] = useState('')
    const [addHabs, setAddHabs] = useState(false)
    const [habs, setHabs] = useState( [] )
    const [error, setError] = useState ('')
    const [noReg, setNoReg] = useState ('')
    const [sumHabs, setSumHabs] = useState(0)
    const navigate = useNavigate()

    const store =  async (e) => {
        e.preventDefault()
        await axios.post(endpoint, {nombre,cuidad,direccion,nit,numHabitaciones})
        .then((res) =>{
            setIdHotel(res.data.id)
            setAddHabs(true)
        })
        .catch((error)=> setError(error.response.data.message))
    }

    const storeHabs =  async (e) => {
        e.preventDefault()
        setSumHabs(Number(habs.reduce((prev,next)=>prev + next.cantidad, 0)) + Number(cantidad))
        console.log(sumHabs);
        if (sumHabs<=numHabitaciones) {
            await axios.post(endpointHabs, {id_hotel,cantidad,tipoHab,acomodacion})            
        }else {
            setNoReg('Ha Superado el numero de habitaciones a registrar')
        }
        getAllHabs()
    }

    const tipoAcomodacion = () => {        
        if (tipoHab==='Estandar') {
            return <select className="form-select" aria-label="Default select example" onChange={(e) => {setAcomodacion(e.target.value)}}>
                        <option defaultValue>seleccione...</option>
                        <option value='Sencilla'>Sencilla</option>
                        <option value='Doble'>Doble</option>
                    </select>
        } else if (tipoHab==='Junior') {
            return  <select className="form-select" aria-label="Default select example" onChange={(e) => {setAcomodacion(e.target.value)}}>
                        <option defaultValue>seleccione...</option>
                        <option value='Triple'>Triple</option>
                        <option value='Cuádruple'>Cuádruple</option>
                    </select>
        } else if(tipoHab==='Suite') {
            return  <select className="form-select" aria-label="Default select example" onChange={(e) => {setAcomodacion(e.target.value)}}>
                        <option defaultValue>seleccione...</option>
                        <option value='Sencilla'>Sencilla</option>
                        <option value='Doble'>Doble</option>
                        <option value='Triple'>Triple</option>
                    </select>
        }else {
            return  <select className="form-select" aria-label="Default select example">
                        <option defaultValue>seleccione...</option>
                    </select>
           
        }       
    }

    const getAllHabs = async () => {
        const response = await axios.get(`${endpointAll}${id_hotel}`)
        setHabs(response.data)
    }

    useEffect(() => {
        getAllHabs()    
      }, [])
    
  return (
    <div className='container'>
        <h3 className='display-3 my-5'>Crear Hotel</h3>
        <form onSubmit={store}>
            <div className='container col-12 row my-4'>
                <div className='mb-3 col-md-4'>
                    <label>Nombre</label>
                    <input className='form-control' value={nombre} onChange={(e) =>setNombre(e.target.value)} type='text' />
                    <div className='invalid-feedback'>{error}</div>
                </div>
                <div className='mb-3 col-md-4'>
                    <label>Cuidad</label>
                    <input className='form-control' value={cuidad} onChange={(e) =>setCuidad(e.target.value)} type='text' />
                </div>
                <div className='mb-3 col-md-4'>
                    <label>Direccion</label>
                    <input className='form-control' value={direccion} onChange={(e) =>setDirecion(e.target.value)} type='text' />
                </div>
                <div className='mb-3 col-md-4'>
                    <label>NIT</label>
                    <input className='form-control' value={nit} onChange={(e) =>setNit(e.target.value)} type='number' />
                </div>
                <div className='mb-3 col-md-4'>
                    <label>Número de Habs</label>
                    <input className='form-control' value={numHabitaciones} onChange={(e) => setNumHabs(e.target.value)} type='number' />
                </div>
            </div>            
            <button type='submit' className='btn btn-primary' style={addHabs?{display: 'none'}:{}}>Guardar y agregar habitaciones</button>
        </form>
        {addHabs &&
            <>
            <div className='container row my-4'>
                <div className='col-4'>
                    <form onSubmit={storeHabs} className='row g-3'>
                        <div className='container col-12 row'>
                            <div className='mb-3'>
                                <label>Cantidad</label>
                                <input className='form-control' value={cantidad} onChange={(e) =>setCantidad(e.target.value)} type='text' />
                                <div className='invalid-feedback' style={noReg?{display:'block'}:{}}>{noReg}</div>
                            </div>
                            <div className='mb-3'>
                                <label>Tipo Habitacion</label>
                                <select className="form-select" aria-label="Default select example" onChange={(e) => {setTipoHab(e.target.value)}}>
                                    <option selected>seleccione...</option>
                                    <option value="Estandar">Estandar</option>
                                    <option value="Junior">Junior</option>
                                    <option value="Suite">Suite</option>
                                </select>
                            </div>
                            <div className='mb-3'>
                            <label>Acomodación</label>
                                { tipoAcomodacion() }
                            </div>
                        </div>
                        <button type='submit' className='btn btn-primary'>Guardar habitaciones</button>
                    </form>                    
                </div>
                <div className='col-8'>
                    <table className='table table-striped'>
                        <thead>
                            <tr>
                                <th>Cantidad</th>
                                <th>Tipo de Habitación</th>
                                <th>Acomodación</th>
                            </tr>
                        </thead>
                        <tbody>
                            {habs &&
                                habs.map((hab) => (
                                    <tr key={hab.id}>
                                        <td>{hab.cantidad}</td>
                                        <td>{hab.tipoHab}</td>
                                        <td>{hab.acomodacion}</td>
                                    </tr>
                                ))
                            }
                        </tbody>
                    </table>
                </div>
            </div>
            <div className='container'>
                {sumHabs==numHabitaciones &&
                    <Link to={`/`} className='btn btn-success'>Finalizar</Link>
                }
            </div>
            </>
        }
    </div>
  )
}

export default CreateHotel