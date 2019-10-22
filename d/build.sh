dmd -of=app_dmd -O -release -inline -boundscheck=off source/app.d
ldc2 -of=app_ldc -O3 -boundscheck=off -release source/app.d

