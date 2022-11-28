warning: in the working copy of 'Scenes/MainScenes/GameScene.tscn', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'Scenes/Maps/Map1.tscn', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'Scenes/Turrets/GunT1.tscn', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'Scenes/Turrets/GunT2.tscn', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'Scenes/Turrets/MissileT1.tscn', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'Scenes/UIScenes/MainMenu.tscn', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'project.godot', LF will be replaced by CRLF the next time Git touches it
[1mdiff --git a/Scenes/MainScenes/GameScene.tscn b/Scenes/MainScenes/GameScene.tscn[m
[1mindex e204dc8..89ead0f 100644[m
[1m--- a/Scenes/MainScenes/GameScene.tscn[m
[1m+++ b/Scenes/MainScenes/GameScene.tscn[m
[36m@@ -1,7 +1,74 @@[m
[31m-[gd_scene load_steps=2 format=2][m
[32m+[m[32m[gd_scene load_steps=7 format=2][m
 [m
 [ext_resource path="res://Scenes/Maps/Map1.tscn" type="PackedScene" id=1][m
[32m+[m[32m[ext_resource path="res://Assets/UI/Buttons/blue_button12.png" type="Texture" id=2][m
[32m+[m[32m[ext_resource path="res://Assets/Towers/towerDefense_tile251.png" type="Texture" id=3][m
[32m+[m[32m[ext_resource path="res://Assets/Towers/towerDefense_tile249.png" type="Texture" id=4][m
[32m+[m[32m[ext_resource path="res://Scenes/MainScenes/GameScene.gd" type="Script" id=5][m
[32m+[m[32m[ext_resource path="res://Scenes/MainScenes/UI.gd" type="Script" id=6][m
 [m
 [node name="GameScene" type="Node2D"][m
[32m+[m[32mscript = ExtResource( 5 )[m
 [m
 [node name="Map1" parent="." instance=ExtResource( 1 )][m
[32m+[m
[32m+[m[32m[node name="UI" type="CanvasLayer" parent="."][m
[32m+[m[32mscript = ExtResource( 6 )[m
[32m+[m
[32m+[m[32m[node name="HUD" type="Control" parent="UI"][m
[32m+[m[32mmargin_right = 40.0[m
[32m+[m[32mmargin_bottom = 40.0[m
[32m+[m[32mmouse_filter = 2[m
[32m+[m
[32m+[m[32m[node name="BuildBar" type="VBoxContainer" parent="UI/HUD"][m
[32m+[m[32manchor_right = 1.0[m
[32m+[m[32manchor_bottom = 1.0[m
[32m+[m[32mmargin_top = 320.0[m
[32m+[m[32mmargin_right = 60.0[m
[32m+[m[32mmargin_bottom = 680.0[m
[32m+[m[32mrect_min_size = Vector2( 100, 400 )[m
[32m+[m[32msize_flags_horizontal = 0[m
[32m+[m[32mcustom_constants/separation = 25[m
[32m+[m
[32m+[m[32m[node name="Gun" type="TextureButton" parent="UI/HUD/BuildBar" groups=["build_buttons"]][m
[32m+[m[32mmargin_left = 10.0[m
[32m+[m[32mmargin_right = 90.0[m
[32m+[m[32mmargin_bottom = 80.0[m
[32m+[m[32mrect_min_size = Vector2( 80, 80 )[m
[32m+[m[32msize_flags_horizontal = 4[m
[32m+[m[32msize_flags_vertical = 4[m
[32m+[m[32mtexture_normal = ExtResource( 2 )[m
[32m+[m[32mexpand = true[m
[32m+[m
[32m+[m[32m[node name="Icon" type="TextureRect" parent="UI/HUD/BuildBar/Gun"][m
[32m+[m[32manchor_left = 0.5[m
[32m+[m[32manchor_top = 0.5[m
[32m+[m[32manchor_right = 0.5[m
[32m+[m[32manchor_bottom = 0.5[m
[32m+[m[32mmargin_left = -32.0[m
[32m+[m[32mmargin_top = -32.0[m
[32m+[m[32mmargin_right = 32.0[m
[32m+[m[32mmargin_bottom = 32.0[m
[32m+[m[32mtexture = ExtResource( 4 )[m
[32m+[m
[32m+[m[32m[node name="Missile" type="TextureButton" parent="UI/HUD/BuildBar" groups=["build_buttons"]][m
[32m+[m[32mmargin_left = 10.0[m
[32m+[m[32mmargin_top = 105.0[m
[32m+[m[32mmargin_right = 90.0[m
[32m+[m[32mmargin_bottom = 185.0[m
[32m+[m[32mrect_min_size = Vector2( 80, 80 )[m
[32m+[m[32msize_flags_horizontal = 4[m
[32m+[m[32msize_flags_vertical = 4[m
[32m+[m[32mtexture_normal = ExtResource( 2 )[m
[32m+[m[32mexpand = true[m
[32m+[m
[32m+[m[32m[node name="Icon" type="TextureRect" parent="UI/HUD/BuildBar/Missile"][m
[32m+[m[32manchor_left = 0.5[m
[32m+[m[32manchor_top = 0.5[m
[32m+[m[32manchor_right = 0.5[m
[32m+[m[32manchor_bottom = 0.5[m
[32m+[m[32mmargin_left = -32.0[m
[32m+[m[32mmargin_top = -32.0[m
[32m+[m[32mmargin_right = 32.0[m
[32m+[m[32mmargin_bottom = 32.0[m
[32m+[m[32mtexture = ExtResource( 3 )[m
[1mdiff --git a/Scenes/Maps/Map1.tscn b/Scenes/Maps/Map1.tscn[m
[1mindex 623974f..56a26a5 100644[m
[1m--- a/Scenes/Maps/Map1.tscn[m
[1m+++ b/Scenes/Maps/Map1.tscn[m
[36m@@ -1,13 +1,11 @@[m
[31m-[gd_scene load_steps=11 format=2][m
[32m+[m[32m[gd_scene load_steps=9 format=2][m
 [m
 [ext_resource path="res://Assets/Environment/Tilesets/terrainTiles_default.png" type="Texture" id=1][m
 [ext_resource path="res://Assets/Environment/Props/crateMetal.png" type="Texture" id=2][m
 [ext_resource path="res://Assets/Environment/Props/crateWood.png" type="Texture" id=3][m
 [ext_resource path="res://Assets/Environment/Props/treeGreen_large.png" type="Texture" id=4][m
 [ext_resource path="res://Assets/Environment/Props/treeBrown_large.png" type="Texture" id=5][m
[31m-[ext_resource path="res://Scenes/Turrets/GunT1.tscn" type="PackedScene" id=6][m
[31m-[ext_resource path="res://Scenes/Turrets/GunT2.tscn" type="PackedScene" id=7][m
[31m-[ext_resource path="res://Scenes/Turrets/MissileT1.tscn" type="PackedScene" id=8][m
[32m+[m[32m[ext_resource path="res://Assets/Environment/Tilesets/Obstructed.png" type="Texture" id=6][m
 [m
 [sub_resource type="TileSet" id=1][m
 0/name = "terrainTiles_default.png 0"[m
[36m@@ -114,13 +112,27 @@[m
 4/shape_one_way_margin = 0.0[m
 4/shapes = [  ][m
 4/z_index = 0[m
[32m+[m[32m5/name = "Obstructed.png 5"[m
[32m+[m[32m5/texture = ExtResource( 6 )[m
[32m+[m[32m5/tex_offset = Vector2( 0, 0 )[m
[32m+[m[32m5/modulate = Color( 1, 1, 1, 1 )[m
[32m+[m[32m5/region = Rect2( 64, 0, 64, 64 )[m
[32m+[m[32m5/tile_mode = 0[m
[32m+[m[32m5/occluder_offset = Vector2( 0, 0 )[m
[32m+[m[32m5/navigation_offset = Vector2( 0, 0 )[m
[32m+[m[32m5/shape_offset = Vector2( 0, 0 )[m
[32m+[m[32m5/shape_transform = Transform2D( 1, 0, 0, 1, 0, 0 )[m
[32m+[m[32m5/shape_one_way = false[m
[32m+[m[32m5/shape_one_way_margin = 0.0[m
[32m+[m[32m5/shapes = [  ][m
[32m+[m[32m5/z_index = 0[m
 [m
 [node name="Map1" type="Node2D"][m
 [m
 [node name="Ground" type="TileMap" parent="."][m
 tile_set = SubResource( 1 )[m
 format = 1[m
[31m-tile_data = PoolIntArray( -1, -1610612736, 0, -65536, -1610612736, 0, -65535, -1610612736, 0, -65534, -1610612736, 0, -65533, -1610612736, 0, -65532, -1610612736, 0, -65531, -1610612736, 0, -65530, -1610612736, 0, -65529, -1610612736, 0, -65528, -1610612736, 0, -65527, -1610612736, 0, -65526, -1610612736, 0, -65525, -1610612736, 0, -65524, -1610612736, 0, -65523, -1610612736, 0, -65522, -1610612736, 0, -65521, -1610612736, 0, -65520, -1610612736, 0, -65519, -1610612736, 0, 65535, -1610612736, 0, 0, -1610612736, 65536, 1, -1610612736, 0, 2, -1610612736, 0, 3, -1610612736, 65536, 4, -1610612736, 65536, 5, -1610612736, 65536, 6, -1610612736, 65536, 7, -1610612736, 65536, 8, -1610612736, 65536, 9, -1610612736, 0, 10, -1610612736, 0, 11, -1610612736, 65536, 12, -1610612736, 65536, 13, -1610612736, 65536, 14, -1610612736, 65536, 15, -1610612736, 0, 16, -1610612736, 0, 17, -1610612736, 0, 131071, -1610612736, 0, 65536, -1610612736, 0, 65537, -1610612736, 0, 65538, -1610612736, 0, 65539, -1610612736, 0, 65540, -1610612736, 65536, 65541, -1610612736, 65536, 65542, -1610612736, 0, 65543, -1610612736, 65536, 65544, -1610612736, 0, 65545, -1610612736, 0, 65546, -1610612736, 65536, 65547, -1610612736, 0, 65548, -1610612736, 0, 65549, -1610612736, 0, 65550, -1610612736, 65536, 65551, -1610612736, 0, 65552, -1610612736, 65536, 65553, -1610612736, 0, 196607, -1610612736, 0, 131072, -1610612736, 65536, 131073, -1610612736, 0, 131074, -1610612736, 0, 131075, -1610612736, 65536, 131076, -1610612736, 65536, 131077, -1610612736, 0, 131078, -1610612736, 0, 131079, -1610612736, 65536, 131080, -1610612736, 65536, 131081, -1610612736, 65536, 131082, -1610612736, 65536, 131083, -1610612736, 65536, 131084, -1610612736, 65536, 131085, -1610612736, 0, 131086, -1610612736, 65536, 131087, -1610612736, 0, 131088, -1610612736, 65536, 131089, -1610612736, 0, 262143, -1610612736, 0, 196608, -1610612736, 65536, 196609, -1610612736, 65536, 196610, -1610612736, 0, 196611, -1610612736, 0, 196612, -1610612736, 0, 196613, -1610612736, 65536, 196614, -1610612736, 65536, 196615, -1610612736, 0, 196616, -1610612736, 0, 196617, -1610612736, 65536, 196618, -1610612736, 0, 196619, -1610612736, 65536, 196620, -1610612736, 0, 196621, -1610612736, 65536, 196622, -1610612736, 0, 196623, -1610612736, 65536, 196624, -1610612736, 65536, 196625, -1610612736, 0, 327679, -1610612736, 0, 262144, -1610612736, 65536, 262145, -1610612736, 65536, 262146, -1610612736, 0, 262147, -1610612736, 65536, 262148, -1610612736, 0, 262149, -1610612736, 0, 262150, -1610612736, 65536, 262151, -1610612736, 0, 262152, -1610612736, 0, 262153, -1610612736, 0, 262154, -1610612736, 0, 262155, -1610612736, 65536, 262156, -1610612736, 0, 262157, -1610612736, 65536, 262158, -1610612736, 0, 262159, -1610612736, 65536, 262160, -1610612736, 0, 262161, -1610612736, 0, 393215, -1610612736, 0, 327680, -1610612736, 65536, 327681, -1610612736, 0, 327682, -1610612736, 65536, 327683, -1610612736, 0, 327684, -1610612736, 0, 327685, -1610612736, 0, 327686, -1610612736, 0, 327687, -1610612736, 0, 327688, -1610612736, 65536, 327689, -1610612736, 65536, 327690, -1610612736, 65536, 327691, -1610612736, 0, 327692, -1610612736, 65536, 327693, -1610612736, 0, 327694, -1610612736, 65536, 327695, -1610612736, 0, 327696, -1610612736, 65536, 327697, -1610612736, 0, 458751, -1610612736, 0, 393216, -1610612736, 0, 393217, -1610612736, 0, 393218, -1610612736, 0, 393219, -1610612736, 65536, 393220, -1610612736, 65536, 393221, -1610612736, 65536, 393222, -1610612736, 0, 393223, -1610612736, 65536, 393224, -1610612736, 65536, 393225, -1610612736, 0, 393226, -1610612736, 65536, 393227, -1610612736, 65536, 393228, -1610612736, 0, 393229, -1610612736, 0, 393230, -1610612736, 0, 393231, -1610612736, 0, 393232, -1610612736, 65536, 393233, -1610612736, 0, 524287, -1610612736, 0, 458752, -1610612736, 0, 458753, -1610612736, 65536, 458754, -1610612736, 65536, 458755, -1610612736, 65536, 458756, -1610612736, 65536, 458757, -1610612736, 0, 458758, -1610612736, 0, 458759, -1610612736, 0, 458760, -1610612736, 65536, 458761, -1610612736, 0, 458762, -1610612736, 65536, 458763, -1610612736, 0, 458764, -1610612736, 65536, 458765, -1610612736, 0, 458766, -1610612736, 65536, 458767, -1610612736, 0, 458768, -1610612736, 0, 458769, -1610612736, 0, 589823, -1610612736, 0, 524288, -1610612736, 65536, 524289, -1610612736, 65536, 524290, -1610612736, 0, 524291, -1610612736, 0, 524292, -1610612736, 0, 524293, -1610612736, 0, 524294, -1610612736, 0, 524295, -1610612736, 65536, 524296, -1610612736, 65536, 524297, -1610612736, 0, 524298, -1610612736, 0, 524299, -1610612736, 0, 524300, -1610612736, 65536, 524301, -1610612736, 0, 524302, -1610612736, 0, 524303, -1610612736, 65536, 524304, -1610612736, 0, 524305, -1610612736, 0, 655359, -1610612736, 0, 589824, -1610612736, 65536, 589825, -1610612736, 65536, 589826, -1610612736, 65536, 589827, -1610612736, 0, 589828, -1610612736, 65536, 589829, -1610612736, 65536, 589830, -1610612736, 65536, 589831, -1610612736, 65536, 589832, -1610612736, 0, 589833, -1610612736, 0, 589834, -1610612736, 0, 589835, -1610612736, 0, 589836, -1610612736, 65536, 589837, -1610612736, 65536, 589838, -1610612736, 65536, 589839, -1610612736, 0, 589840, -1610612736, 65536, 589841, -1610612736, 0, 720895, -1610612736, 0, 655360, -1610612736, 65536, 655361, -1610612736, 0, 655362, -1610612736, 65536, 655363, -1610612736, 65536, 655364, -1610612736, 65536, 655365, -1610612736, 0, 655366, -1610612736, 65536, 655367, -1610612736, 65536, 655368, -1610612736, 65536, 655369, -1610612736, 65536, 655370, -1610612736, 65536, 655371, -1610612736, 65536, 655372, -1610612736, 0, 655373, -1610612736, 0, 655374, -1610612736, 65536, 655375, -1610612736, 0, 655376, -1610612736, 65536, 655377, -1610612736, 0, 786431, -1610612736, 0, 720896, -1610612736, 0, 720897, -1610612736, 0, 720898, -1610612736, 0, 720899, -1610612736, 0, 720900, -1610612736, 0, 720901, -1610612736, 0, 720902, -1610612736, 0, 720903, -1610612736, 0, 720904, -1610612736, 0, 720905, -1610612736, 0, 720906, -1610612736, 0, 720907, -1610612736, 0, 720908, -1610612736, 0, 720909, -1610612736, 0, 720910, -1610612736, 0, 720911, -1610612736, 0, 720912, -1610612736, 0, 720913, -1610612736, 0 )[m
[32m+[m[32mtile_data = PoolIntArray( -1, -1610612736, 0, -65536, -1610612736, 0, -65535, -1610612736, 0, -65534, -1610612736, 0, -65533, -1610612736, 0, -65532, -1610612736, 0, -65531, -1610612736, 0, -65530, -1610612736, 0, -65529, -1610612736, 0, -65528, -1610612736, 0, -65527, -1610612736, 0, -65526, -1610612736, 0, -65525, -1610612736, 0, -65524, -1610612736, 0, -65523, -1610612736, 0, -65522, -1610612736, 0, -65521, -1610612736, 0, -65520, -1610612736, 0, -65519, -1610612736, 0, 65535, -1610612736, 0, 0, 0, 0, 1, -1610612736, 0, 2, -1610612736, 0, 3, -1610612736, 65536, 4, -1610612736, 65536, 5, -1610612736, 65536, 6, -1610612736, 65536, 7, -1610612736, 65536, 8, -1610612736, 65536, 9, -1610612736, 0, 10, -1610612736, 0, 11, -1610612736, 65536, 12, -1610612736, 65536, 13, -1610612736, 65536, 14, -1610612736, 65536, 15, -1610612736, 0, 16, -1610612736, 0, 17, -1610612736, 0, 131071, -1610612736, 0, 65536, -1610612736, 0, 65537, -1610612736, 0, 65538, -1610612736, 0, 65539, -1610612736, 0, 65540, -1610612736, 65536, 65541, -1610612736, 65536, 65542, -1610612736, 0, 65543, -1610612736, 65536, 65544, -1610612736, 0, 65545, -1610612736, 0, 65546, -1610612736, 65536, 65547, -1610612736, 0, 65548, -1610612736, 0, 65549, -1610612736, 0, 65550, -1610612736, 65536, 65551, -1610612736, 0, 65552, -1610612736, 65536, 65553, -1610612736, 0, 196607, -1610612736, 0, 131072, -1610612736, 65536, 131073, -1610612736, 0, 131074, -1610612736, 0, 131075, -1610612736, 65536, 131076, -1610612736, 65536, 131077, -1610612736, 0, 131078, -1610612736, 0, 131079, -1610612736, 65536, 131080, -1610612736, 65536, 131081, -1610612736, 65536, 131082, -1610612736, 65536, 131083, -1610612736, 65536, 131084, -1610612736, 65536, 131085, -1610612736, 0, 131086, -1610612736, 65536, 131087, -1610612736, 0, 131088, -1610612736, 65536, 131089, -1610612736, 0, 262143, -1610612736, 0, 196608, -1610612736, 65536, 196609, -1610612736, 65536, 196610, -1610612736, 0, 196611, -1610612736, 0, 196612, -1610612736, 0, 196613, -1610612736, 65536, 196614, -1610612736, 65536, 196615, -1610612736, 0, 196616, -1610612736, 0, 196617, -1610612736, 65536, 196618, -1610612736, 0, 196619, -1610612736, 65536, 196620, -1610612736, 0, 196621, -1610612736, 65536, 196622, -1610612736, 0, 196623, -1610612736, 65536, 196624, -1610612736, 65536, 196625, -1610612736, 0, 327679, -1610612736, 0, 262144, -1610612736, 65536, 262145, -1610612736, 65536, 262146, -1610612736, 0, 262147, -1610612736, 65536, 262148, -1610612736, 0, 262149, -1610612736, 0, 262150, -1610612736, 65536, 262151, -1610612736, 0, 262152, -1610612736, 0, 262153, -1610612736, 0, 262154, -1610612736, 0, 262155, -1610612736, 65536, 262156, -1610612736, 0, 262157, -1610612736, 65536, 262158, -1610612736, 0, 262159, -1610612736, 65536, 262160, -1610612736, 0, 262161, -1610612736, 0, 393215, -1610612736, 0, 327680, -1610612736, 65536, 327681, -1610612736, 0, 327682, -1610612736, 65536, 327683, -1610612736, 0, 327684, -1610612736, 0, 327685, -1610612736, 0, 327686, -1610612736, 0, 327687, -1610612736, 0, 327688, -1610612736, 65536, 327689, -1610612736, 65536, 327690, -1610612736, 65536, 327691, -1610612736, 0, 327692, -1610612736, 65536, 327693, -1610612736, 0, 327694, -1610612736, 65536, 327695, -1610612736, 0, 327696, -1610612736, 65536, 327697, -1610612736, 0, 458751, -1610612736, 0, 393216, -1610612736, 0, 393217, -1610612736, 0, 393218, -1610612736, 0, 393219, -1610612736, 65536, 393220, -1610612736, 65536, 393221, -1610612736, 65536, 393222, -1610612736, 0, 393223, -1610612736, 65536, 393224, -1610612736, 65536, 393225, -1610612736, 0, 393226, -1610612736, 65536, 393227, -1610612736, 65536, 393228, -1610612736, 0, 393229, -1610612736, 0, 393230, -1610612736, 0, 393231, -1610612736, 0, 393232, -1610612736, 65536, 393233, -1610612736, 0, 524287, -1610612736, 0, 458752, -1610612736, 0, 458753, -1610612736, 65536, 458754, -1610612736, 65536, 458755, -1610612736, 65536, 458756, -1610612736, 65536, 458757, -1610612736, 0, 458758, -1610612736, 0, 458759, -1610612736, 0, 458760, -1610612736, 65536, 458761, -1610612736, 0, 458762, -1610612736, 65536, 458763, -1610612736, 0, 458764, -1610612736, 65536, 458765, -1610612736, 0, 458766, -1610612736, 65536, 458767, -1610612736, 0, 458768, -1610612736, 0, 458769, -1610612736, 0, 589823, -1610612736, 0, 524288, -1610612736, 65536, 524289, -1610612736, 65536, 524290, -1610612736, 0, 524291, -1610612736, 0, 524292, -1610612736, 0, 524293, -1610612736, 0, 524294, -1610612736, 0, 524295, -1610612736, 65536, 524296, -1610612736, 65536, 524297, -1610612736, 0, 524298, -1610612736, 0, 524299, -1610612736, 0, 524300, -1610612736, 65536, 524301, -1610612736, 0, 524302, -1610612736, 0, 524303, -1610612736, 65536, 524304, -1610612736, 0, 524305, -1610612736, 0, 655359, -1610612736, 0, 589824, -1610612736, 65536, 589825, -1610612736, 65536, 589826, -1610612736, 65536, 589827, -1610612736, 0, 589828, -1610612736, 65536, 589829, -1610612736, 65536, 589830, -1610612736, 65536, 589831, -1610612736, 65536, 589832, -1610612736, 0, 589833, -1610612736, 0, 589834, -1610612736, 0, 589835, -1610612736, 0, 589836, -1610612736, 65536, 589837, -1610612736, 65536, 589838, -1610612736, 65536, 589839, -1610612736, 0, 589840, -1610612736, 65536, 589841, -1610612736, 0, 720895, -1610612736, 0, 655360, -1610612736, 65536, 655361, -1610612736, 0, 655362, -1610612736, 65536, 655363, -1610612736, 65536, 655364, -1610612736, 65536, 655365, -1610612736, 0, 655366, -1610612736, 65536, 655367, -1610612736, 65536, 655368, -1610612736, 65536, 655369, -1610612736, 65536, 655370, -1610612736, 65536, 655371, -1610612736, 65536, 655372, -1610612736, 0, 655373, -1610612736, 0, 655374, -1610612736, 65536, 655375, -1610612736, 0, 655376, -1610612736, 65536, 655377, -1610612736, 0, 786431, -1610612736, 0, 720896, -1610612736, 0, 720897, -1610612736, 0, 720898, -1610612736, 0, 720899, -1610612736, 0, 720900, -1610612736, 0, 720901, -1610612736, 0, 720902, -1610612736, 0, 720903, -1610612736, 0, 720904, -1610612736, 0, 720905, -1610612736, 0, 720906, -1610612736, 0, 720907, -1610612736, 0, 720908, -1610612736, 0, 720909, -1610612736, 0, 720910, -1610612736, 0, 720911, -1610612736, 0, 720912, -1610612736, 0, 720913, -1610612736, 0 )[m
 [m
 [node name="TowerExclusion" type="TileMap" parent="."][m
 tile_set = SubResource( 2 )[m
[36m@@ -128,12 +140,3 @@[m [mformat = 1[m
 tile_data = PoolIntArray( 1, 1, 0, 9, 4, 0, 13, 2, 0, 65543, 1, 0, 65546, 2, 0, 65548, 0, 65538, 65549, 0, 1, 65550, 0, 1, 65551, 0, 1, 65552, 0, 1, 65553, 0, 1, 65554, 0, 0, 131073, 4, 0, 131076, 2, 0, 131081, 3, 0, 131084, 0, 0, 196620, 0, 0, 262146, 3, 0, 262148, 0, 65538, 262149, 0, 1, 262150, 0, 1, 262151, 0, 1, 262152, 0, 1, 262153, 0, 5, 262154, 0, 1, 262155, 0, 1, 262156, 0, 65541, 262159, 2, 0, 327684, 0, 0, 327689, 0, 0, 393217, 1, 0, 393220, 0, 0, 393222, 1, 0, 393225, 0, 0, 393232, 4, 0, 458756, 0, 0, 458761, 0, 0, 458764, 2, 0, 458767, 1, 0, 589821, 0, 0, 589822, 0, 1, 589823, 0, 1, 524288, 0, 1, 524289, 0, 1, 524290, 0, 1, 524291, 0, 1, 524292, 0, 4, 524293, 0, 1, 524294, 0, 1, 524295, 0, 1, 524296, 0, 1, 524297, 0, 65541, 589835, 3, 0, 589838, 1, 0, 655363, 3, 0, 655367, 2, 0, 655369, 4, 0 )[m
 [m
 [node name="Turrets" type="Node2D" parent="."][m
[31m-[m
[31m-[node name="GunT1" parent="Turrets" instance=ExtResource( 6 )][m
[31m-position = Vector2( 852, 148 )[m
[31m-[m
[31m-[node name="GunT2" parent="Turrets" instance=ExtResource( 7 )][m
[31m-position = Vector2( 337, 494 )[m
[31m-[m
[31m-[node name="MissileT1" parent="Turrets" instance=ExtResource( 8 )][m
[31m-position = Vector2( 659, 345 )[m
[1mdiff --git a/Scenes/Turrets/GunT1.tscn b/Scenes/Turrets/GunT1.tscn[m
[1mindex ae67f53..609353f 100644[m
[1m--- a/Scenes/Turrets/GunT1.tscn[m
[1m+++ b/Scenes/Turrets/GunT1.tscn[m
[36m@@ -8,9 +8,11 @@[m
 script = ExtResource( 3 )[m
 [m
 [node name="Base" type="Sprite" parent="."][m
[32m+[m[32mposition = Vector2( 32, 32 )[m
 texture = ExtResource( 2 )[m
 [m
 [node name="Turret" type="Sprite" parent="."][m
[32m+[m[32mposition = Vector2( 32, 32 )[m
 texture = ExtResource( 1 )[m
 offset = Vector2( 12, 0 )[m
 [m
[1mdiff --git a/Scenes/Turrets/GunT2.tscn b/Scenes/Turrets/GunT2.tscn[m
[1mindex 357c9cb..74757cd 100644[m
[1m--- a/Scenes/Turrets/GunT2.tscn[m
[1m+++ b/Scenes/Turrets/GunT2.tscn[m
[36m@@ -8,9 +8,11 @@[m
 script = ExtResource( 3 )[m
 [m
 [node name="Base" type="Sprite" parent="."][m
[32m+[m[32mposition = Vector2( 32, 32 )[m
 texture = ExtResource( 2 )[m
 [m
 [node name="Turret" type="Sprite" parent="."][m
[32m+[m[32mposition = Vector2( 32, 32 )[m
 texture = ExtResource( 1 )[m
 offset = Vector2( 10, 0 )[m
 [m
[1mdiff --git a/Scenes/Turrets/MissileT1.tscn b/Scenes/Turrets/MissileT1.tscn[m
[1mindex 1f1a150..9713abe 100644[m
[1m--- a/Scenes/Turrets/MissileT1.tscn[m
[1m+++ b/Scenes/Turrets/MissileT1.tscn[m
[36m@@ -9,9 +9,11 @@[m
 script = ExtResource( 4 )[m
 [m
 [node name="Base" type="Sprite" parent="."][m
[32m+[m[32mposition = Vector2( 32, 32 )[m
 texture = ExtResource( 3 )[m
 [m
 [node name="Turret" type="Sprite" parent="."][m
[32m+[m[32mposition = Vector2( 32, 32 )[m
 texture = ExtResource( 2 )[m
 offset = Vector2( 2, 0 )[m
 [m
[1mdiff --git a/Scenes/UIScenes/MainMenu.tscn b/Scenes/UIScenes/MainMenu.tscn[m
[1mindex 8daf664..3048562 100644[m
[1m--- a/Scenes/UIScenes/MainMenu.tscn[m
[1m+++ b/Scenes/UIScenes/MainMenu.tscn[m
[36m@@ -140,7 +140,6 @@[m [mrect_min_size = Vector2( 450, 0 )[m
 size_flags_horizontal = 2[m
 [m
 [node name="Label" type="Label" parent="M/TitleVBox"][m
[31m-margin_top = 50.0[m
 margin_right = 450.0[m
 margin_bottom = 74.0[m
 size_flags_horizontal = 5[m
[1mdiff --git a/project.godot b/project.godot[m
[1mindex f044e0b..f40d871 100644[m
[1m--- a/project.godot[m
[1m+++ b/project.godot[m
[36m@@ -14,17 +14,45 @@[m [mconfig/name="td game"[m
 run/main_scene="res://SceneHandler.tscn"[m
 config/icon="res://icon.png"[m
 [m
[32m+[m[32m[autoload][m
[32m+[m
[32m+[m[32mGameData="*res://Singletons/GameData.gd"[m
[32m+[m
 [display][m
 [m
 window/size/width=1080[m
 window/size/height=720[m
[32m+[m[32mmouse_cursor/custom_image="res://Assets/UI/cursor_pointer3D_shadow.png"[m
 window/stretch/mode="2d"[m
 window/stretch/aspect="keep"[m
 [m
[32m+[m[32m[global][m
[32m+[m
[32m+[m[32mcursor=false[m
[32m+[m
 [gui][m
 [m
 common/drop_mouse_on_gui_input_disabled=true[m
 [m
[32m+[m[32m[input][m
[32m+[m
[32m+[m[32mui_accept={[m
[32m+[m[32m"deadzone": 0.5,[m
[32m+[m[32m"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777221,"physical_scancode":0,"unicode":0,"echo":false,"script":null)[m
[32m+[m[32m, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777222,"physical_scancode":0,"unicode":0,"echo":false,"script":null)[m
[32m+[m[32m, Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":32,"physical_scancode":0,"unicode":0,"echo":false,"script":null)[m
[32m+[m[32m, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":0,"pressure":0.0,"pressed":false,"script":null)[m
[32m+[m[32m, Object(InputEventMouseButton,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"button_mask":0,"position":Vector2( 0, 0 ),"global_position":Vector2( 0, 0 ),"factor":1.0,"button_index":1,"pressed":false,"doubleclick":false,"script":null)[m
[32m+[m[32m ][m
[32m+[m[32m}[m
[32m+[m[32mui_cancel={[m
[32m+[m[32m"deadzone": 0.5,[m
[32m+[m[32m"events": [ Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"pressed":false,"scancode":16777217,"physical_scancode":0,"unicode":0,"echo":false,"script":null)[m
[32m+[m[32m, Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":0,"button_index":1,"pressure":0.0,"pressed":false,"script":null)[m
[32m+[m[32m, Object(InputEventMouseButton,"resource_local_to_scene":false,"resource_name":"","device":0,"alt":false,"shift":false,"control":false,"meta":false,"command":false,"button_mask":0,"position":Vector2( 0, 0 ),"global_position":Vector2( 0, 0 ),"factor":1.0,"button_index":2,"pressed":false,"doubleclick":false,"script":null)[m
[32m+[m[32m ][m
[32m+[m[32m}[m
[32m+[m
 [mono][m
 [m
 project/assembly_name="td game"[m
