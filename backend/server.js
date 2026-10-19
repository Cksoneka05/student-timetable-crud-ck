require('dotenv').config();
const express=require('express'),cors=require('cors');
const {run,get,all,initialize}=require('./db');
const app=express(),PORT=Number(process.env.PORT||3000);
const origin=process.env.CORS_ORIGIN||'*';
app.use(cors({origin:origin==='*'?'*':origin.split(',').map(x=>x.trim())}));
app.use(express.json());
const fields=['course_code','course_name','day_of_week','start_time','end_time','location','study_goal','status'];
const statuses=['Planned','In Progress','Completed'];
function validate(b){
 const errors=[];
 for(const f of fields) if(typeof b[f]!=='string'||!b[f].trim()) errors.push(`${f} is required`);
 if(b.status&&!statuses.includes(b.status))errors.push('status must be Planned, In Progress, or Completed');
for (const f of ['start_time', 'end_time']) {
  const value = String(b[f] ?? '').trim();

  if (value && !/^([01]\d|2[0-3]):[0-5]\d$/.test(value)) {
    errors.push(`${f} must use HH:MM format`);
  }
}
 return errors;
}
app.get('/api/health',(_,res)=>res.json({success:true,message:'Timetable API is running'}));
app.get('/api/timetable',async(_,res,next)=>{try{const data=await all('SELECT * FROM timetable ORDER BY day_of_week,start_time,id');res.json({success:true,count:data.length,data});}catch(e){next(e)}});
app.get('/api/timetable/:id',async(req,res,next)=>{try{const data=await get('SELECT * FROM timetable WHERE id=?',[req.params.id]);if(!data)return res.status(404).json({success:false,error:'Timetable entry not found'});res.json({success:true,data});}catch(e){next(e)}});
app.post('/api/timetable',async(req,res,next)=>{try{const errors=validate(req.body||{});if(errors.length)return res.status(400).json({success:false,errors});const values=fields.map(f=>req.body[f].trim());const r=await run(`INSERT INTO timetable(${fields.join(',')}) VALUES(${fields.map(()=>'?').join(',')})`,values);const data=await get('SELECT * FROM timetable WHERE id=?',[r.id]);res.status(201).json({success:true,message:'Timetable entry created',data});}catch(e){next(e)}});
app.put('/api/timetable/:id',async(req,res,next)=>{try{const errors=validate(req.body||{});if(errors.length)return res.status(400).json({success:false,errors});if(!await get('SELECT id FROM timetable WHERE id=?',[req.params.id]))return res.status(404).json({success:false,error:'Timetable entry not found'});const values=fields.map(f=>req.body[f].trim());await run(`UPDATE timetable SET ${fields.map(f=>f+'=?').join(',')},updated_at=CURRENT_TIMESTAMP WHERE id=?`,[...values,req.params.id]);const data=await get('SELECT * FROM timetable WHERE id=?',[req.params.id]);res.json({success:true,message:'Timetable entry updated',data});}catch(e){next(e)}});
app.delete('/api/timetable/:id',async(req,res,next)=>{try{const r=await run('DELETE FROM timetable WHERE id=?',[req.params.id]);if(!r.changes)return res.status(404).json({success:false,error:'Timetable entry not found'});res.json({success:true,message:'Timetable entry deleted',id:Number(req.params.id)});}catch(e){next(e)}});
app.use((_,res)=>res.status(404).json({success:false,error:'Route not found'}));
app.use((e,_,res,__)=>(console.error(e),res.status(500).json({success:false,error:'Internal server error'})));
initialize().then(()=>app.listen(PORT,()=>console.log(`API running at http://localhost:${PORT}`))).catch(e=>{console.error(e);process.exit(1)});
