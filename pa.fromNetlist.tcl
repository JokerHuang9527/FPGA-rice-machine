
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name ricemachine -dir "C:/Users/User/Desktop/shit/ricemachine/planAhead_run_3" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/User/Desktop/shit/ricemachine/ricemachine.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/User/Desktop/shit/ricemachine} }
set_property target_constrs_file "ricemachine.ucf" [current_fileset -constrset]
add_files [list {ricemachine.ucf}] -fileset [get_property constrset [current_run]]
link_design
