# scripts
some bash scripts to increase my productivity

#directories list
ls -d */
for i in $(ls -d */); do echo ${i%%/}; done

#list of retailers in config folder
(cd config; for i in $(ls -d */); do echo ${i}; done)

# list of retailers - web platform
arnotts bash benbridge bloom brownt buckle chicos cosbar cotr danmurphys dxl elguntors gnc hbc holt humantouch jwas lilly macys novartis perrysport peru pharmaprix rtb saks shiseido shoppers sjk soma whbm


