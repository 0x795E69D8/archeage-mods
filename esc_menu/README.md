# Plugin based esc_menu (aka Main Menu) extender

Allows you to add menu entries to the games main menu through plugin.lua files.

Modifying the [esc_menu.alb](game/scriptsbin/x2ui/esc_menu/esc_menu.alb) allows you to easily configure the following:

    local autodetect = false
    local pluginPath = "mods\\esc_menu\\plugins"
setting `autodetect` to `true` will run a `dir` command through `cmd` to detect every plugin in your plugins folder and enable all of them, if this is set to `false` the plugin list will get read from [`plugins.txt`](plugins/plugins.txt) instead  
`pluginPath` allows you to set the path from which plugins are read  
**Install this with [aapatcher by Ingramz](https://github.com/Ingramz/archeage/tree/master/aapatcher)**  
![Modded main menu](https://drive.usercontent.google.com/download?id=16G9eXWDCw7ihP6KL7oNU0Oa1G1yaivgP)  
**This mod ships with the following plugins**  
[aggro_meter](plugins/aggro_meter.lua) - toggles an aggro meter (or any window bound to UIC 1330) aggro meter mod not included  
[bank](plugins/bank.lua) - allows you to open the warehouse from the main menu  
[google](plugins/google.lua) - find more information [here](../../../tree/main/google_sheets_exporter)  
[hidden_buffs](plugins/hidden_buffs.lua) - allows you to toggle the display of hidden_buffs from the main menu after installing [the appropriate mod](../../../tree/main/hidden_buffs)  
[mail](plugins/mail.lua) - allows you to open the mailbox from the main menu, only lets you read mail and take attachments one-by-one  
[portal](plugins/portal.lua) - allows you to save a teleport to your teleport book (almost) anywhere in the world, open the plugin file for minor configuration options (thanks [Nidoran](https://discord.com/users/168501425909792768))  
[settings](plugins/settings.lua) - adds an advanced settings menu to the main menu that allows you to modify any CryEngine3 variable (that's available in AA and not hard-locked) directly in-game, comes with a Bookmark tab that lets you bookmark commonly used variables and a Console tab that lets you directly query and input variables, similarly to the engine terminal. You can find a bunch of variables at the bottom of this page.  
![Bookmarks tab](https://drive.usercontent.google.com/download?id=1u2tAb4fLF_z75URYiWb56pnjMGjMrPo1)  
![Console tab](https://drive.usercontent.google.com/download?id=109nBKhR6yIMQkEyWrJ9PEwR8lLDaSUl6)  
Default X2:GetEscMenuCategories() table structure:  

    {
      [1] = {
        ["iconKey"] = character,
        ["name"] = Characters,
        ["menus"] = {
          [1] = {
            ["hotkey"] = toggle_character,
            ["badgeColorKey"] = situation_03,
            ["uiContentType"] = 21,
            ["iconKey"] = info,
          },
          [2] = {
            ["hotkey"] = toggle_bag,
            ["badgeColorKey"] = situation_03,
            ["uiContentType"] = 22,
            ["iconKey"] = bag,
          },
          [3] = {
            ["hotkey"] = toggle_spellbook,
            ["badgeColorKey"] = situation_01,
            ["uiContentType"] = 26,
            ["iconKey"] = skill,
          },
          [4] = {
            ["hotkey"] = toggle_quest,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 23,
            ["iconKey"] = quest,
          },
          [5] = {
            ["iconKey"] = chronicle,
            ["featureSet"] = {
              [1] = chronicle_info,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 114,
            ["hotkey"] = toggle_chronicle_book,
          },
          [6] = {
            ["hotkey"] = toggle_achievement,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 25,
            ["iconKey"] = achievement,
          },
          [7] = {
            ["hotkey"] = toggle_community,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 120,
            ["iconKey"] = community,
          },
          [8] = {
            ["featureSet"] = {
              [1] = bless_uthstin,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 66,
            ["iconKey"] = uthtin,
          },
        },
      },
      [2] = {
        ["iconKey"] = combat,
        ["name"] = Combat,
        ["menus"] = {
          [1] = {
            ["iconKey"] = ranking,
            ["featureSet"] = {
              [1] = ranking,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 4,
            ["hotkey"] = toggle_ranking,
          },
          [2] = {
            ["hotkey"] = toggle_raid_team_manager,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 33,
            ["iconKey"] = raid,
          },
          [3] = {
            ["iconKey"] = hero,
            ["featureSet"] = {
              [1] = hero,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 48,
            ["hotkey"] = toggle_hero,
          },
        },
      },
      [3] = {
        ["iconKey"] = shop,
        ["name"] = Shop/Quality of Life,
        ["menus"] = {
          [1] = {
            ["hotkey"] = toggle_auction,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 58,
            ["iconKey"] = auction,
          },
          [2] = {
            ["badgeColorKey"] = ,
            ["uiContentType"] = 94,
            ["iconKey"] = price,
          },
          [3] = {
            ["hotkey"] = toggle_commercial_mail,
            ["badgeColorKey"] = situation_01,
            ["uiContentType"] = 78,
            ["iconKey"] = purchase,
          },
          [4] = {
            ["badgeColorKey"] = ,
            ["uiContentType"] = 51,
            ["iconKey"] = item_encyclopedia,
          },
          [5] = {
            ["iconKey"] = butler,
            ["featureSet"] = {
              [1] = butler,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 115,
            ["hotkey"] = toggle_butler_info,
          },
          [6] = {
            ["iconKey"] = mail,
            ["featureSet"] = {
              [1] = hud_mail_box_button,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 79,
            ["hotkey"] = toggle_mail,
          },
        },
      },
      [4] = {
        ["iconKey"] = convenience,
        ["name"] = Vocation,
        ["menus"] = {
          [1] = {
            ["hotkey"] = toggle_worldmap,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 27,
            ["iconKey"] = map,
          },
          [2] = {
            ["hotkey"] = toggle_craft_book,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 28,
            ["iconKey"] = folio,
          },
          [3] = {
            ["hotkey"] = toggle_common_farm_info,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 31,
            ["iconKey"] = public_farm,
          },
          [4] = {
            ["iconKey"] = trade,
            ["featureSet"] = {
              [1] = specialty_trade_info_ui,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 41,
            ["hotkey"] = toggle_specialty_info,
          },
        },
      },
      [5] = {
        ["iconKey"] = system,
        ["name"] = System,
        ["menus"] = {
          [1] = {
            ["featureSet"] = {
              [1] = ui_avi,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 49,
            ["iconKey"] = guide,
          },
          [2] = {
            ["hotkey"] = toggle_optimization,
            ["badgeColorKey"] = ,
            ["uiContentType"] = 121,
            ["iconKey"] = optimizer,
          },
          [3] = {
            ["iconKey"] = message,
            ["featureSet"] = {
              [1] = use_web_messenger,
            },
            ["badgeColorKey"] = situation_03,
            ["uiContentType"] = 37,
            ["hotkey"] = toggle_web_messenger,
          },
          [4] = {
            ["iconKey"] = dairy,
            ["featureSet"] = {
              [1] = use_web_diary,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 38,
            ["hotkey"] = toggle_web_play_diary,
          },
          [5] = {
            ["iconKey"] = wiki,
            ["featureSet"] = {
              [1] = use_web_wiki,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 39,
            ["hotkey"] = toggle_web_wiki,
          },
          [6] = {
            ["featureSet"] = {
              [1] = use_web_help,
            },
            ["badgeColorKey"] = situation_03,
            ["uiContentType"] = 40,
            ["iconKey"] = faq,
          },
          [7] = {
            ["featureSet"] = {
              [1] = secondpass,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 122,
            ["iconKey"] = lock,
          },
          [8] = {
            ["featureSet"] = {
              [1] = use_tgos,
            },
            ["badgeColorKey"] = ,
            ["uiContentType"] = 42,
            ["iconKey"] = tgos,
          },
        },
      },
    }

Here are a bunch of CryEngine3 variables I pulled from the game, a lot of them are probably wrong or don't work but you can try them yourself. If you are looking for more general variables you can look [here](https://web.archive.org/web/20210511130806/https://docs.cryengine.com/display/CRYAUTOGEN/)  
By using any variable with a `?` parameter you can query an explanation on what it's supposed to do (`command ?`)

    # console settings
    con_char_scale
    con_char_size
    con_debug
    con_display_last_messages
    con_line_buffer_size
    con_restricted
    con_scroll_max
    con_showonload
    
    # engine settings
    e_AllowFP16Terrain
    e_AutoPrecacheCgf
    e_AutoPrecacheCgfMaxTasks
    e_CacheNearestCubePicking
    e_CameraFreeze
    e_CoarseShadowMask
    e_CoarseShadowMgrDebug
    e_CoverCgfDebug
    e_CoverageBufferAABBExpand
    e_CoverageBufferAccurateOBBTest
    e_CoverageBufferCullIndividualBrushesMaxNodeSize
    e_CoverageBufferRotationSafeCheck
    e_CoverageBufferTolerance
    e_DebugDraw
    e_DecalsDefferedDynamicDepthScale
    e_DecalsPlacementTestAreaSize
    e_DeferredPhysicsEvents
    e_DissolveDist
    e_DissolveDistFactor
    e_DissolveDistMax
    e_DissolveDistMin
    e_DissolveDistband
    e_DissolveTime
    e_EntitySuppressionLevel
    e_GIAmount
    e_GIBlendRatio
    e_GICache
    e_GICache
    e_GICascadesRatio
    e_GIGlossyReflections
    e_GIIterations
    e_GIMaxDistance
    e_GINumCascades
    e_GIOffset
    e_GIPropagationAmp
    e_GIPropagationAmp
    e_GIRSMSize
    e_GISecondaryOcclusion
    e_GsmCastFromTerrain
    e_GsmExtendLastLodUseAdditiveBlending
    e_GsmExtendLastLodUseVariance
    e_GsmViewSpace
    e_GsmViewSpace
    e_HwOcclusionCullingObjects
    e_MtTest
    e_ObjectLayersActivationPhysics
    e_ObjectsTreeBBoxes
    e_Params
    e_ParticlesCoarseShadowMask
    e_ParticlesEmitterPoolSize
    e_ParticlesPoolSize
    e_ProcVegetationMaxObjectsInChunk
    e_ProcVegetationMaxSectorsInCache
    e_RNTmpDataPoolMaxFrames
    e_ShadowsDebug
    e_ShadowsDebug
    e_ShadowsLodBiasFixed
    e_ShadowsLodBiasInvis
    e_ShadowsOcclusionCullingCaster
    e_ShadowsTessellateCascades
    e_ShadowsTessellateDLights
    e_StatObjBufferRenderTasks
    e_StatObjTestOBB
    e_StreamCgfDebug
    e_StreamCgfDebugFilter
    e_StreamCgfDebugHeatMap
    e_StreamCgfDebugMinObjSize
    e_StreamCgfFastUpdateMaxDistance
    e_StreamCgfGridUpdateDistance
    e_StreamCgfMaxTasksInProgress
    e_StreamCgfPoolSize
    e_StreamCgfUpdatePerNodeDistance
    e_StreamCgfVisObjPriority
    e_StreamPredictionAhead
    e_StreamPredictionAheadDebug
    e_StreamPredictionDistanceFar
    e_StreamPredictionDistanceNear
    e_StreamPredictionMaxVisAreaRecursion
    e_StreamPredictionMinFarZoneDistance
    e_StreamPredictionMinReportDistance
    e_StreamPredictionTexelDensity
    e_StreamPredictionUpdateTimeSlice
    e_Tessellation
    e_TessellationMaxDistance
    e_VegetationSpritesBatching
    e_ViewDistRatioPortals
    e_VisareaFogFadingTime
    e_VoxTer
    e_VoxTerHeightmapEditing
    e_VoxTerHeightmapEditingCustomLayerInfo
    e_VoxTerHideIntegrated
    e_VoxTerMixMask
    e_VoxTerOnTheFlyIntegration
    e_VoxTerPlanarProjection
    e_VoxTerRelaxation
    e_VoxTerShadows
    e_VoxTerShapeCheck
    e_VoxTerTexBuildOnCPU
    e_VoxTerTexFormat
    e_VoxTerTexRangeScale
    e_allow_cvars_serialization
    e_ambient_boost_no_point_lights_b
    e_ambient_boost_no_point_lights_g
    e_ambient_boost_no_point_lights_r
    e_ambient_multiplier_no_point_lights
    e_ambient_occlusion
    e_bboxes
    e_brush_streaming_dist_ratio
    e_brushes
    e_cbuffer
    e_cbuffer_bias
    e_cbuffer_clip_planes_num
    e_cbuffer_debug
    e_cbuffer_debug_draw_scale
    e_cbuffer_debug_freeze
    e_cbuffer_draw_occluders
    e_cbuffer_hw
    e_cbuffer_lazy_test
    e_cbuffer_lc
    e_cbuffer_lights_debug_side
    e_cbuffer_max_add_render_mesh_time
    e_cbuffer_occluders_lod_ratio
    e_cbuffer_occluders_test_min_tris_num
    e_cbuffer_occluders_view_dist_ratio
    e_cbuffer_resolution
    e_cbuffer_terrain
    e_cbuffer_terrain_distance
    e_cbuffer_terrain_distance_near
    e_cbuffer_terrain_lod_ratio
    e_cbuffer_terrain_shift
    e_cbuffer_terrain_shift_near
    e_cbuffer_terrain_z_offset
    e_cbuffer_test_mode
    e_cbuffer_tree_debug
    e_cbuffer_tree_depth
    e_cbuffer_version
    e_cgf_loading_profile
    e_cgf_verify
    e_char_debug_draw
    e_character_back_light
    e_character_light
    e_character_light_color_b
    e_character_light_color_g
    e_character_light_color_r
    e_character_light_max_dist
    e_character_light_min_dist
    e_character_light_offset_x
    e_character_light_offset_y
    e_character_light_offset_z
    e_character_light_radius
    e_character_light_specualr_multy
    e_character_no_merge_render_chunks
    e_clouds
    e_control_tip
    e_cull_veg_activation
    e_custom_build_extramaps_fromshaderquality
    e_custom_clone_mode
    e_custom_dressing_time_max
    e_custom_dynamic_lod
    e_custom_dynamic_lod_debug
    e_custom_max_clone_model
    e_custom_max_clone_model_1
    e_custom_max_clone_model_2
    e_custom_max_clone_model_3
    e_custom_max_clone_model_4
    e_custom_max_clone_model_5
    e_custom_max_model
    e_custom_max_model_high
    e_custom_max_model_low
    e_custom_max_model_mid
    e_custom_texture_lod
    e_custom_texture_lod
    e_custom_texture_share
    e_custom_texture_share
    e_custom_thread_cut_mesh
    e_custom_thread_cut_mesh
    e_debug_draw
    e_debug_drawShowOnlyCompound
    e_debug_drawShowOnlyLod
    e_debug_draw_filter
    e_debug_draw_lod_error_min_reduce_ratio
    e_debug_draw_lod_error_no_lod_tris
    e_debug_draw_lod_warning_default_lod_ratio
    e_debug_draw_objstats_warning_tris
    e_debug_lights
    e_debug_mask
    e_decals
    e_decals_allow_game_decals
    e_decals_clip
    e_decals_deffered_dynamic
    e_decals_deffered_dynamic_min_size
    e_decals_deffered_static
    e_decals_force_deferred
    e_decals_hit_cache
    e_decals_life_time_scale
    e_decals_max_static_mesh_tris
    e_decals_merge
    e_decals_neighbor_max_life_time
    e_decals_overlapping
    e_decals_precreate
    e_decals_scissor
    e_decals_update_silhouette_scope
    e_decals_wrap_debug
    e_default_material
    e_deferred_cell_loader_log
    e_deferred_loader_stats
    e_deformable_objects
    e_detail_materials
    e_detail_materials_debug
    e_detail_materials_highlight
    e_detail_materials_view_dist_xy
    e_detail_materials_view_dist_z
    e_detail_materials_zpass_normal_draw_dist
    e_detail_objects
    e_dissolve
    e_dissolve_transition_threshold
    e_dissolve_transition_time
    e_dist_for_wsbbox_update
    e_dynamic_light
    e_dynamic_light_consistent_sort_order
    e_dynamic_light_force_deferred
    e_dynamic_light_frame_id_vis_test
    e_dynamic_light_max_count
    e_dynamic_light_max_shadow_count
    e_entities
    e_face_reset_debug
    e_flocks
    e_flocks_hunt
    e_fog
    e_fogvolumes
    e_foliage_branches_damping
    e_foliage_branches_stiffness
    e_foliage_branches_timeout
    e_foliage_broken_branches_damping
    e_foliage_stiffness
    e_foliage_wind_activation_dist
    e_force_detail_level_for_resolution
    e_format
    e_format_teximage
    e_gsm_cache
    e_gsm_cache_lod_offset
    e_gsm_combined
    e_gsm_depth_bounds_debug
    e_gsm_extra_range_shadow
    e_gsm_extra_range_shadow_texture_size
    e_gsm_extra_range_sun_update_ratio
    e_gsm_extra_range_sun_update_time
    e_gsm_extra_range_sun_update_type
    e_gsm_focus_on_unit
    e_gsm_force_extra_range_include_objects
    e_gsm_force_terrain_include_objects
    e_gsm_lods_num
    e_gsm_range_rate
    e_gsm_range_start
    e_gsm_range_step
    e_gsm_range_step_object
    e_gsm_range_step_terrain
    e_gsm_scatter_lod_dist
    e_gsm_stats
    e_gsm_terrain_include_objects
    e_gsm_terrain_sun_update_time
    e_hw_occlusion_culling_objects
    e_hw_occlusion_culling_water
    e_joint_strength_scale
    e_level_auto_precache_terrain_and_proc_veget
    e_level_auto_precache_textures_and_shaders
    e_list_particles
    e_load_only_sub_zone_shape
    e_lod_max
    e_lod_min
    e_lod_min_tris
    e_lod_ratio
    e_lod_skin_ratio
    e_lod_sync_view_dist
    e_lods
    e_lowspec_mode
    e_material_loading_profile
    e_material_no_load
    e_material_refcount_check_logging
    e_material_stats
    e_materials
    e_max_entity_lights
    e_max_view_dst
    e_max_view_dst_full_dist_cam_height
    e_max_view_dst_spec_lerp
    e_mesh_simplify
    e_mipmap_show
    e_mixed_normals_report
    e_model_decals
    e_modelview_Prefab_add_scale_ratio
    e_modelview_Prefab_cam_dist
    e_modelview_Prefab_camera_offset_x
    e_modelview_Prefab_camera_offset_y
    e_modelview_Prefab_camera_offset_z
    e_modelview_Prefab_init_rot_x_for_flat_objects
    e_modelview_Prefab_light_color_rgb
    e_modelview_Prefab_light_number
    e_modelview_Prefab_light_offset_from_center
    e_modelview_Prefab_light_offset_x
    e_modelview_Prefab_light_offset_y
    e_modelview_Prefab_light_offset_z
    e_modelview_Prefab_light_radius
    e_modelview_Prefab_light_specualr_multy
    e_modelview_Prefab_offset_x
    e_modelview_Prefab_offset_y
    e_modelview_Prefab_offset_z
    e_modelview_Prefab_rot_x
    e_modelview_Prefab_rot_z
    e_modelview_Prefab_scale
    e_modelview_Prefab_sunlight_color_x
    e_modelview_Prefab_sunlight_color_y
    e_modelview_Prefab_sunlight_color_z
    e_modelview_Prefab_sunlight_dir_x
    e_modelview_Prefab_sunlight_dir_y
    e_modelview_Prefab_sunlight_dir_z
    e_modelview_Prefab_sunlight_multiple
    e_no_lod_chr_tris
    e_obj
    e_obj_fast_register
    e_obj_quality
    e_obj_stats
    e_obj_tree_max_node_size
    e_obj_tree_min_node_size
    e_obj_tree_shadow_debug
    e_object_streaming_log
    e_object_streaming_stats
    e_occlusion_culling_view_dist_ratio
    e_occlusion_volumes
    e_occlusion_volumes_view_dist_ratio
    e_on_demand_maxsize
    e_on_demand_physics
    e_owlbear
    e_particles
    e_particles_debug
    e_particles_decals
    e_particles_decals_force_deferred
    e_particles_disable_equipments
    e_particles_dynamic_particle_count
    e_particles_dynamic_particle_life
    e_particles_dynamic_quality
    e_particles_filter
    e_particles_gc_period
    e_particles_high
    e_particles_landmark
    e_particles_lean_lifetime_test
    e_particles_lights
    e_particles_lights_view_dist_ratio
    e_particles_lod
    e_particles_lod_onoff
    e_particles_low
    e_particles_low_update_dist
    e_particles_max_draw_screen
    e_particles_max_screen_fill
    e_particles_middle
    e_particles_min_draw_alpha
    e_particles_min_draw_pixels
    e_particles_normal_update_dist
    e_particles_object_collisions
    e_particles_preload
    e_particles_quality
    e_particles_receive_shadows
    e_particles_source_filter
    e_particles_stats
    e_particles_stream
    e_particles_thread
    e_particles_trail_debug
    e_particles_trail_min_seg_size
    e_particles_veryhigh
    e_phys_bullet_coll_dist
    e_phys_foliage
    e_phys_ocean_cell
    e_portals
    e_portals_big_entities_fix
    e_precache_level
    e_proc_vegetation
    e_proc_vegetation_max_view_distance
    e_proc_vegetation_min_density
    e_profile_level_loading
    e_ram_maps
    e_raycasting_debug
    e_recursion
    e_recursion_occlusion_culling
    e_recursion_view_dist_ratio
    e_render
    e_roads
    e_ropes
    e_scissor_debug
    e_screenshot
    e_screenshot_debug
    e_screenshot_file_format
    e_screenshot_height
    e_screenshot_map_camheight
    e_screenshot_map_center_x
    e_screenshot_map_center_y
    e_screenshot_map_far_plane_offset
    e_screenshot_map_near_plane_offset
    e_screenshot_map_size_x
    e_screenshot_map_size_y
    e_screenshot_min_slices
    e_screenshot_quality
    e_screenshot_save_path
    e_screenshot_width
    e_selected_color_b
    e_selected_color_g
    e_selected_color_r
    e_shader_constant_metrics
    e_shadows
    e_shadows_adapt_scale
    e_shadows_arrange_deferred_texture_size
    e_shadows_cast_view_dist_ratio
    e_shadows_cast_view_dist_ratio_character
    e_shadows_cast_view_dist_ratio_lights
    e_shadows_clouds
    e_shadows_const_bias
    e_shadows_cull_terrain_accurately
    e_shadows_frustums
    e_shadows_max_texture_size
    e_shadows_omni_max_texture_size
    e_shadows_omni_min_texture_size
    e_shadows_on_alpha_blended
    e_shadows_on_water
    e_shadows_optimised_object_culling
    e_shadows_optimize
    e_shadows_res_scale
    e_shadows_slope_bias
    e_shadows_softer_distant_lods
    e_shadows_terrain
    e_shadows_terrain_texture_size
    e_shadows_unit_cube_clip
    e_shadows_update_view_dist_ratio
    e_shadows_water
    e_shadowsdebug
    e_show_modelview_commands
    e_sketch_mode
    e_skip_precache
    e_sky_box
    e_sky_box_debug
    e_sky_quality
    e_sky_type
    e_sky_update_rate
    e_sleep
    e_soft_particles
    e_stat_obj_merge
    e_stat_obj_merge_max_tris_per_drawcall
    e_statobj_log
    e_statobj_stats
    e_statobj_use_lod_ready_cache
    e_statobj_verify
    e_stream_areas
    e_stream_cgf
    e_stream_for_physics
    e_stream_for_visuals
    e_sun
    e_sun_angle_snap_dot
    e_sun_angle_snap_sec
    e_sun_clipplane_range
    e_surface_list
    e_surface_reload
    e_target_decals_deffered
    e_temp_pool_size
    e_terrain
    e_terrain_ao
    e_terrain_bboxes
    e_terrain_crater_depth
    e_terrain_crater_depth_max
    e_terrain_deformations
    e_terrain_deformations_obstruct_object_size_ratio
    e_terrain_draw_this_sector_only
    e_terrain_ib_stats
    e_terrain_layer_test
    e_terrain_lm_gen_threshold
    e_terrain_loading_log
    e_terrain_lod_ratio
    e_terrain_log
    e_terrain_normal_map
    e_terrain_occlusion_culling
    e_terrain_occlusion_culling_debug
    e_terrain_occlusion_culling_max_dist
    e_terrain_occlusion_culling_max_steps
    e_terrain_occlusion_culling_precision
    e_terrain_occlusion_culling_precision_dist_ratio
    e_terrain_occlusion_culling_step_size
    e_terrain_occlusion_culling_step_size_delta
    e_terrain_occlusion_culling_version
    e_terrain_optimised_ib
    e_terrain_render_profile
    e_terrain_texture_buffers
    e_terrain_texture_debug
    e_terrain_texture_lod_ratio
    e_terrain_texture_streaming_debug
    e_terrain_texture_sync_load
    e_text
    e_time_of_day
    e_time_of_day_debug
    e_time_of_day_engine_update
    e_time_of_day_speed
    e_timedemo_frames
    e_type
    e_under_wear_debug
    e_use_enhanced_effect
    e_use_gem_effect
    e_vegetation
    e_vegetation_alpha_blend
    e_vegetation_bending
    e_vegetation_create_collision_only
    e_vegetation_cull_test_bound_offset
    e_vegetation_cull_test_max_dist
    e_vegetation_disable_bending_distance
    e_vegetation_disable_distant_bending
    e_vegetation_mem_sort_test
    e_vegetation_min_size
    e_vegetation_node_level
    e_vegetation_sprite_max_pixel
    e_vegetation_sprites
    e_vegetation_sprites_cast_shadow
    e_vegetation_sprites_distance_custom_ratio_min
    e_vegetation_sprites_distance_ratio
    e_vegetation_sprites_min_distance
    e_vegetation_use_list
    e_vegetation_use_terrain_color
    e_vegetation_wind
    e_view_dist_custom_ratio
    e_view_dist_doodad_min
    e_view_dist_min
    e_view_dist_ratio
    e_view_dist_ratio_detail
    e_view_dist_ratio_light
    e_view_dist_ratio_vegetation
    e_visarea_include_radius
    e_visarea_test_mode
    e_volobj_shadow_strength
    e_volobj_stats
    e_voxel
    e_voxel_ao_radius
    e_voxel_ao_scale
    e_voxel_build
    e_voxel_debug
    e_voxel_fill_mode
    e_voxel_lods_num
    e_voxel_make_physics
    e_voxel_make_shadows
    e_water_ocean
    e_water_ocean_bottom
    e_water_ocean_fft
    e_water_ocean_simulate_on_zone
    e_water_ocean_soft_particles
    e_water_tesselation_amount
    e_water_tesselation_amountX
    e_water_tesselation_amountY
    e_water_tesselation_swath_width
    e_water_volumes
    e_water_waves
    e_water_waves_tesselation_amount
    e_wind
    e_wind_areas
    e_xml_cache_gc
    e_zoneWeatherEffect
    
    # game settings
    g_AddtionalParam
    g_AddtionalParam2
    g_AiSuitArmorModeHealthRegenTime
    g_AiSuitHealthRechargeTime
    g_CloudColorScale
    g_EmissiveColor
    g_FrustomRightBottom
    g_GeneralParams
    g_LightDiffuse
    g_LightPos
    g_LightProjParams
    g_LightSpec
    g_NightVisionParams0
    g_NightVisionParams1
    g_NightVisionParams2
    g_NightVisionParams3
    g_PropagationAmp_Iteration
    g_RainColorMultipliers
    g_RainDropColor
    g_RainOcc_TransMat
    g_RainPuddleParams
    g_RainVolumeParams
    g_ScreenScale
    g_SunDir
    g_VS_WorldViewPos
    g_VisibilityTimeout
    g_VisibilityTimeoutTime
    g_actor_stance_use_queue
    g_aimdebug
    g_bit_depth
    g_blood
    g_breakImpulseScale
    g_breakage_particles_limit
    g_breakagelog
    g_breaktimeoutframes
    g_buddyMessagesIngame
    g_cAmbGround
    g_cDeferredAmbient
    g_custom_texture_mipmap_min_size
    g_customizer_enable_cutscene
    g_customizer_stream_cutscene
    g_decalSize
    g_detachCamera
    g_die_anim_Degree
    g_die_anim_force
    g_difficultyLevel
    g_dirToLight
    g_dirToLightGridSpace
    g_displayIgnoreList
    g_dump_stats
    g_emp_style
    g_enableFriendlyFallAndPlay
    g_enableIdleCheck
    g_enableitems
    g_enableloadingscreen
    g_fake
    g_friendlyfireratio
    g_frostDecay
    g_goForceFastUpdate
    g_godMode
    g_grabLog
    g_groundeffectsdebug
    g_h
    g_hide_tutorial
    g_hunterIK
    g_ignore_chat_filter
    g_ignore_duel_invite
    g_ignore_expedition_invite
    g_ignore_family_invite
    g_ignore_jury_invite
    g_ignore_party_invite
    g_ignore_raid_invite
    g_ignore_raid_joint
    g_ignore_squad_invite
    g_ignore_trade_invite
    g_ignore_whisper_invite
    g_injectionMatrix
    g_input_bit_depth
    g_interceptions
    g_invRSMMatrix
    g_joint_breaking
    g_lag_in_frames
    g_lightColor
    g_lightDir
    g_lightPosition
    g_localActor
    g_localActorId
    g_localPacketRate
    g_mCamera
    g_mDecalTS
    g_mInvLightProj
    g_mLightProj
    g_mLightShadowProj
    g_mViewProj
    g_mViewProjPrev
    g_originals
    g_palette
    g_pass
    g_play_die_anim
    g_playerInteractorRadius
    g_playerSuitHealthRechargeTime
    g_playerSuitHealthRechargeTimeMoving
    g_preroundtime
    g_procedural_breaking
    g_profile
    g_quickGame_map
    g_quickGame_min_players
    g_quickGame_mode
    g_quickGame_ping1_level
    g_quickGame_ping2_level
    g_quickGame_prefer_favorites
    g_quickGame_prefer_lan
    g_quickGame_prefer_mycountry
    g_ragdoll_BlendAnim
    g_ragdoll_damping_max
    g_ragdoll_damping_time
    g_ragdoll_minE_max
    g_ragdoll_minE_time
    g_roundlimit
    g_roundtime
    g_showUpdateState
    g_show_loot_window
    g_skip_tutorial
    g_smInvPixelSize
    g_smSize
    g_spectatorcollisions
    g_suddendeathtime
    g_teamlock
    g_threads
    g_threshold
    g_timebase
    g_tree_cut_reuse_dist
    g_unit_collide_bottom_box_height_size_rate
    g_unit_collide_bottom_box_max_size_gap
    g_unit_collide_bottom_box_min_height_size_gap
    g_unit_collide_bottom_box_size_rate
    g_unit_collide_front_bound_rate
    g_unit_collide_process_frequency
    g_unit_collide_rear_bound_rate
    g_unit_collide_side_bound_rate
    g_useLastKeyInput
    g_use_chat_time_stamp
    g_use_physicalize_rigid
    g_vAmbHeightParams
    g_vDestRSMSize
    g_vFrustrumLB
    g_vFrustrumLT
    g_vFrustrumRB
    g_vFrustrumRT
    g_vRSMRatio
    g_vSrcRSMSize
    g_w
    g_walkMultiplier
    g_worldToDecal
    
    # name tag settings
    name_tag_appellation_show
    name_tag_custom_gauge_offset_hpbar
    name_tag_custom_gauge_offset_normal
    name_tag_custom_gauge_size_ratio
    name_tag_expedition_show
    name_tag_faction_selection
    name_tag_faction_show
    name_tag_friendly_mate_show
    name_tag_friendly_show
    name_tag_hostile_mate_show
    name_tag_hostile_show
    name_tag_hp_offset
    name_tag_hp_show
    name_tag_mode
    name_tag_my_mate_show
    name_tag_npc_show
    name_tag_offset
    name_tag_party_show
    name_tag_self_enable
    
    # renderer settings
    r_AllowFP16Meshes
    r_AllowHardwareSRGBWrite
    r_ArmourPulseSpeedMultiplier
    r_Batching
    r_Beams
    r_BeamsDistFactor
    r_BeamsHelpers
    r_BeamsMaxSlices
    r_BeamsSoftClip
    r_Brightness
    r_BufferUpload_Enable
    r_BufferUpload_WriteMode
    r_CBStatic
    r_CBStaticDebug
    r_CSTest
    r_Character_NoDeform
    r_CloudsDebug
    r_CloudsUpdateAlways
    r_ColorBits
    r_ColorGrading
    r_ColorGradingCharts
    r_ColorGradingChartsCache
    r_ColorGradingDof
    r_ColorGradingFilters
    r_ColorGradingLevels
    r_ColorGradingSelectiveColor
    r_ConditionalRendering
    r_Contrast
    r_CoronaColorScale
    r_CoronaFade
    r_CoronaSizeScale
    r_Coronas
    r_CreateZBufferTexture
    r_CullGeometryForLights
    r_DebugLightVolumes
    r_DebugLights
    r_DebugRefraction
    r_DebugRenderMode
    r_DebugScreenEffects
    r_DeferredDecals
    r_DeferredDecalsLowSpec
    r_DeferredShadingCubeMaps
    r_DeferredShadingDBTstencil
    r_DeferredShadingDebug
    r_DeferredShadingDepthBoundsTest
    r_DeferredShadingHeightBasedAmbient
    r_DeferredShadingLightLodRatio
    r_DeferredShadingLightStencilRatio
    r_DeferredShadingLightVolumes
    r_DeferredShadingScissor
    r_DeferredShadingSortLights
    r_DeferredShadingStencilPrepass
    r_DeferredShadingTiled
    r_DeferredShadingTiledRatio
    r_DeferredShadingTilesX
    r_DeferredShadingTilesY
    r_DepthBits
    r_DetailDistance
    r_DetailNumLayers
    r_DetailScale
    r_DetailTextures
    r_DisplacementFactor
    r_DisplayInfo
    r_DisplayInfoGraph
    r_DrawNearFarPlane
    r_DrawNearFoV
    r_DrawNearZRange
    r_DrawValidation
    r_Driver
    r_DumpFontNames
    r_DumpFontTexture
    r_DynTexAtlasCloudsMaxSize
    r_DynTexAtlasSpritesMaxSize
    r_DynTexMaxSize
    r_EnableErrorCheck
    r_EnvCMResolution
    r_EnvCMWrite
    r_EnvCMupdateInterval
    r_EnvLCMupdateInterval
    r_EnvTexResolution
    r_EnvTexUpdateInterval
    r_ErrorString
    r_ExcludeMesh
    r_ExcludeShader
    r_EyeAdaptationBase
    r_EyeAdaptationFactor
    r_EyeAdaptationLocal
    r_EyeAdaptationSpeed
    r_FastFullScreenQuad
    r_Flares
    r_Flush
    r_FogDensityScale
    r_FogGlassBackbufferResolveDebug
    r_FogRampScale
    r_ForceDiffuseSpecClear
    r_ForceZClearWithColor
    r_Fullscreen
    r_GPUProfiler
    r_Gamma
    r_GeomInstancing
    r_GeomInstancingThreshold
    r_GeominstancingDebug
    r_GetScreenShot
    r_GlitterAmount
    r_GlitterSize
    r_GlitterSpecularPow
    r_GlitterVariation
    r_Glow
    r_GraphStyle
    r_HDRBloomMul
    r_HDRBlueShift
    r_HDRBrightLevel
    r_HDRBrightOffset
    r_HDRBrightThreshold
    r_HDRBrightness
    r_HDRDebug
    r_HDREyeAdaptionCache
    r_HDRFilmicToe
    r_HDRGrainAmount
    r_HDRLevel
    r_HDROffset
    r_HDRPresets
    r_HDRRangeAdaptLBufferMax
    r_HDRRangeAdaptLBufferMaxRange
    r_HDRRangeAdaptMax
    r_HDRRangeAdaptMaxRange
    r_HDRRangeAdaptationSpeed
    r_HDRRendering
    r_HDRSCurveMax
    r_HDRSCurveMin
    r_HDRSaturation
    r_HDRTexFormat
    r_HDRVignetting
    r_Height
    r_ImposterRatio
    r_ImpostersDraw
    r_ImpostersUpdatePerFrame
    r_IrradianceVolumes
    r_LightBufferOptimized
    r_LightsSinglePass
    r_Log
    r_LogShaders
    r_LogTexStreaming
    r_MSAA
    r_MSAA_amd_resolvessubresource_workaround
    r_MSAA_debug
    r_MSAA_quality
    r_MSAA_samples
    r_MaxDualMtlDepth
    r_MaxSuitPulseSpeedMultiplier
    r_MeasureOverdraw
    r_MeasureOverdrawScale
    r_MergeRenderChunks
    r_MergeShaders
    r_MeshPoolSize
    r_MeshPrecache
    r_MeshVolatilePoolSize
    r_MotionBlur
    r_MultiGPU
    r_MultiThreadFlush
    r_MultiThreaded
    r_NightVision
    r_NightVisionAmbientMul
    r_NightVisionBrightLevel
    r_NightVisionCamMovNoiseAmount
    r_NightVisionCamMovNoiseBlendSpeed
    r_NightVisionFinalMul
    r_NightVisionSonarLifetime
    r_NightVisionSonarMultiplier
    r_NightVisionSonarRadius
    r_NightVisionViewDist
    r_NoDrawNear
    r_NoDrawShaders
    r_NoHWGamma
    r_NoLoadTextures
    r_NoPreprocess
    r_NormalsLength
    r_OcclusionQueriesMGPU
    r_OceanHeightScale
    r_OceanLodDist
    r_OceanMaxSplashes
    r_OceanRendType
    r_OceanSectorSize
    r_OceanTexUpdate
    r_OptimiseShaders
    r_OptimisedLightSetup
    r_ParticleIndHeapSize
    r_ParticleVertHeapSize
    r_PixelSync
    r_PostProcessEffects
    r_PostProcessEffectsFilters
    r_PostProcessEffectsGameFx
    r_PostProcessEffectsParamsBlending
    r_PostProcessEffectsReset
    r_PostProcessHUD3D
    r_PostProcessMinimal
    r_PostProcessOptimize
    r_PrecacheShaderList
    r_PrecacheShaderStat
    r_PreloadUserShaderCache
    r_ProfileChar
    r_ProfileDIPs
    r_ProfileShaders
    r_ProfileShadersSmooth
    r_Quality_BumpMapping
    r_RC_AutoInvoke
    r_ReduceRtChange
    r_Reflections
    r_ReflectionsOffset
    r_ReflectionsQuality
    r_RefractionPartialResolves
    r_ReloadShaders
    r_RenderMeshHashGridUnitSize
    r_RenderMeshLockLog
    r_ResetScreenFx
    r_Resource_Report
    r_SSAO
    r_SSAODebug
    r_SSAOTemporalConvergence
    r_SSAO_amount
    r_SSAO_amount_multipler
    r_SSAO_contrast
    r_SSAO_depth_range
    r_SSAO_downscale
    r_SSAO_quality
    r_SSAO_radius
    r_SSAO_radius_multipler
    r_SSDOOptimized
    r_SSGI
    r_SSGIAmount
    r_SSGIBlur
    r_SSGIQuality
    r_SSGIRadius
    r_ScatteringMaxDist
    r_Scissor
    r_ShaderCompilerDontCache
    r_ShaderCompilerPort
    r_ShaderCompilerServer
    r_ShaderEmailTags
    r_ShaderUsageDelay
    r_ShadersAddListRT
    r_ShadersAddListRTAndRT
    r_ShadersAlwaysUseColors
    r_ShadersAsyncActivation
    r_ShadersAsyncCompiling
    r_ShadersAsyncMaxThreads
    r_ShadersAsyncReading
    r_ShadersBlackListGL
    r_ShadersBlackListRT
    r_ShadersCacheOptimiseLog
    r_ShadersDebug
    r_ShadersDelayFlush
    r_ShadersDirectory
    r_ShadersEditing
    r_ShadersFlushCache
    r_ShadersIgnoreIncludesChanging
    r_ShadersIntCompiler
    r_ShadersInterfaceVersion
    r_ShadersLazyUnload
    r_ShadersLogCacheMisses
    r_ShadersNoCompile
    r_ShadersPreactivate
    r_ShadersPrecacheAllLights
    r_ShadersRemoteCompiler
    r_ShadersSaveList
    r_ShadersSubmitRequestline
    r_ShadersUseInstanceLookUpTable
    r_ShadersUseScriptCache
    r_ShadowBlur
    r_ShadowBluriness
    r_ShadowGen
    r_ShadowGenGS
    r_ShadowGenMode
    r_ShadowJittering
    r_ShadowPass
    r_ShadowPoolMaxFrames
    r_ShadowPoolMaxTimeslicedUpdatesPerFrame
    r_ShadowTexFormat
    r_ShadowsAdaptionMin
    r_ShadowsAdaptionRangeClamp
    r_ShadowsAdaptionSize
    r_ShadowsBias
    r_ShadowsDeferOmniLightLimit
    r_ShadowsDeferredMode
    r_ShadowsDepthBoundNV
    r_ShadowsForwardPass
    r_ShadowsGridAligned
    r_ShadowsMaskDownScale
    r_ShadowsMaskResolution
    r_ShadowsOmniLightLimit
    r_ShadowsOrthogonal
    r_ShadowsPCFiltering
    r_ShadowsParticleAnimJitterAmount
    r_ShadowsParticleJitterAmount
    r_ShadowsParticleKernelSize
    r_ShadowsParticleNormalEffect
    r_ShadowsSlopeScaleBias
    r_ShadowsStencilPrePass
    r_ShadowsSunMaskBlurriness
    r_ShadowsUseClipVolume
    r_ShadowsX2CustomBias
    r_ShowDynTextureFilter
    r_ShowDynTextures
    r_ShowGammaReference
    r_ShowLight
    r_ShowLightBounds
    r_ShowLines
    r_ShowNormals
    r_ShowRenderTarget
    r_ShowRenderTarget_FullScreen
    r_ShowTangents
    r_ShowTexTimeGraph
    r_ShowTexture
    r_ShowTimeGraph
    r_ShowVideoMemoryStats
    r_SonarVision
    r_SplitScreenActive
    r_Stats
    r_StencilBits
    r_StencilFlushShaderReset
    r_StereoDevice
    r_StereoEyeDist
    r_StereoFlipEyes
    r_StereoGammaAdjustment
    r_StereoHudScreenDist
    r_StereoMode
    r_StereoNearGeoScale
    r_StereoOutput
    r_StereoScreenDist
    r_StereoStrength
    r_TXAA
    r_TXAA_DebugMode
    r_TerrainAO
    r_TerrainAO_FadeDist
    r_TerrainSpecular_AccurateFresnel
    r_TerrainSpecular_ColorB
    r_TerrainSpecular_ColorG
    r_TerrainSpecular_ColorR
    r_TerrainSpecular_IndexOfRefraction
    r_TerrainSpecular_Metallicness
    r_TerrainSpecular_Model
    r_TerrainSpecular_Roughness
    r_TerrainSpecular_Strength
    r_TessellationDebug
    r_TessellationTriangleSize
    r_TexAtlasSize
    r_TexBindMode
    r_TexBumpResolution
    r_TexGrid
    r_TexHWMipsGeneration
    r_TexLog
    r_TexLogNonStream
    r_TexMaxAnisotropy
    r_TexMaxSize
    r_TexMinAnisotropy
    r_TexMinSize
    r_TexNoAniso
    r_TexNoLoad
    r_TexNormalMapType
    r_TexPostponeLoading
    r_TexResolution
    r_TexResolution_Conditional
    r_TexSkyQuality
    r_TextureCompressor
    r_TextureLodDistanceRatio
    r_TextureLodMaxLod
    r_Texture_Anisotropic_Level
    r_TexturesFilteringQuality
    r_TexturesStreamAdaptiveMargin
    r_TexturesStreamPoolIdealRatio
    r_TexturesStreamPoolLimitRatio
    r_TexturesStreamPoolSize
    r_TexturesStreamSystemLimitCheckTime
    r_TexturesStreamSystemPoolSize
    r_TexturesStreaming
    r_TexturesStreamingDebug
    r_TexturesStreamingDebugDumpIntoLog
    r_TexturesStreamingDebugMinMip
    r_TexturesStreamingDebugMinSize
    r_TexturesStreamingDebugfilter
    r_TexturesStreamingDontKeepSystemMode
    r_TexturesStreamingIgnore
    r_TexturesStreamingMaxRequestedJobs
    r_TexturesStreamingMaxRequestedMB
    r_TexturesStreamingMipBias
    r_TexturesStreamingMipClampDVD
    r_TexturesStreamingNoUpload
    r_TexturesStreamingOnlyVideo
    r_TexturesStreamingSync
    r_ThermalVision
    r_ThermalVisionViewCloakFrequencyPrimary
    r_ThermalVisionViewCloakFrequencySecondary
    r_UseCompactHDRFormat
    r_UseGSParticles
    r_UseSRGB
    r_UseShadowsPool
    r_VSync
    r_VSync
    r_ValidateDraw
    r_VarianceShadowMapBlurAmount
    r_VegetationAlphaTestOnly
    r_VegetationSpritesGenAlways
    r_VegetationSpritesGenDebug
    r_VegetationSpritesMaxUpdate
    r_VegetationSpritesNoBend
    r_VegetationSpritesNoGen
    r_VegetationSpritesTexRes
    r_VerifyShaders
    r_WaterCaustics
    r_WaterCausticsDeferred
    r_WaterCausticsDistance
    r_WaterGodRays
    r_WaterGodRays
    r_WaterReflections
    r_WaterReflectionsMGPU
    r_WaterReflectionsMinVisUpdateDistanceMul
    r_WaterReflectionsMinVisUpdateFactorMul
    r_WaterReflectionsMinVisiblePixelsUpdate
    r_WaterReflectionsQuality
    r_WaterReflectionsUseMinOffset
    r_WaterRipple
    r_WaterRippleResolution
    r_WaterTessellationHW
    r_WaterUpdateChange
    r_WaterUpdateDistance
    r_WaterUpdateFactor
    r_WaterUpdateTimeMax
    r_WaterUpdateTimeMin
    r_Width
    r_WindowX
    r_WindowY
    r_ZFightingDepthScale
    r_ZFightingExtrude
    r_ZPassDepthSorting
    r_ZPassOnly
    r_auxGeom
    r_binaryShaderAutoGen
    r_cubemapgenerating
    r_debugPatchwork
    r_deferredDecalsDebug
    r_deferredDecalsMSAA
    r_desireHeight
    r_desireWidth
    r_distant_rain
    r_dyntexatlasdyntexsrcsize
    r_dyntexatlasvoxterrainsize
    r_enableAuxGeom
    r_fullscreen
    r_geforce7
    r_glowanamorphicflares
    r_height
    r_meshHoldMemDuration
    r_meshUseSummedArea
    r_meshlog
    r_moon_reflection_boost
    r_multithreadFlush
    r_noinfo_noreturn
    r_nvssao
    r_particles_lights_limit
    r_particles_lights_merge_range
    r_particles_lights_no_merge_size
    r_pointslightshafts
    r_profileTerrainDetail
    r_rc_autoinvoke
    r_refraction
    r_shadersAsyncReading
    r_shadersSaveListRemote
    r_shadersUnLoadBinCaches
    r_shadersdontflush
    r_shallow_horse
    r_shootingstar
    r_shootingstar_length
    r_shootingstar_lifetime
    r_shootingstar_respawnnow
    r_shootingstar_respawntime
    r_shootingstar_width
    r_silhouetteColorAmount
    r_silhouetteQuality
    r_silhouetteSize
    r_solidWireframe
    r_ssdo
    r_stars_rotate
    r_stars_sharpness
    r_stars_size
    r_sunshafts
    r_testSplitScreen
    r_texResolution
    r_texStagingGCTime
    r_texStagingMaxCount
    r_texture_db_streaming
    r_texture_db_streaming_check_integrity
    r_texture_precache_limit
    r_texturesStreamUseMipOffset
    r_texturesStreamingUploadPerFrame
    r_texturesstreamingMinMipmap
    r_texturesstreamingMinReadSizeKB
    r_texturesstreamingPostponeMips
    r_texturesstreamingPostponeThresholdKB
    r_texturesstreamingPostponeThresholdMip
    r_texturesstreamingResidencyEnabled
    r_texturesstreamingResidencyThrottle
    r_texturesstreamingResidencyTime
    r_texturesstreamingResidencyTimeTestLimit
    r_texturesstreamingmipfading
    r_usefurpass
    r_usesilhouette
    r_usezpass
    r_visareaDebug
    r_visareavolumeoversize
    r_waitRenderThreadAtDeviceLost
    r_width
    r_wireframe
    
    # sound settings
    s_ADPCMDecoders
    s_AllowNotCachedAccess
    s_AllowSoundBankPatching
    s_AudioPreloadsFile
    s_BlockAlignSize
    s_CacheFillRatio
    s_CacheSize
    s_CacheStatic
    s_CinemaVolume
    s_CompressedDialog
    s_Compression
    s_CullingByCache
    s_DebugMusic
    s_DebugSound
    s_DialogVolume
    s_Doppler
    s_DopplerScale
    s_DrawObstruction
    s_DrawSounds
    s_DummySound
    s_DumpEventStructure
    s_ErrorSound
    s_FileAccess
    s_FileCacheManagerEnable
    s_FileCacheManagerSize
    s_FileOpenHandleMax
    s_FindLostEvents
    s_FormatResampler
    s_FormatSampleRate
    s_FormatType
    s_GameCinemaVolume
    s_GameDialogVolume
    s_GameMIDIVolume
    s_GameMasterVolume
    s_GameMusicVolume
    s_GameReverbManagerPause
    s_GameSFXVolume
    s_GameVehicleMusicVolume
    s_HDR
    s_HDRDebug
    s_HDRFade
    s_HDRFalloff
    s_HDRLoudnessFalloff
    s_HDRLoudnessMaxFalloff
    s_HDRRange
    s_HRTF_DSP
    s_HWChannels
    s_InactiveSoundIterationTimeout
    s_LanguagesConversion
    s_LoadNonBlocking
    s_MIDIVolume
    s_MPEGDecoders
    s_MaxActiveSounds
    s_MaxChannels
    s_MaxEventCount
    s_MaxMIDIChannels
    s_MemoryPoolSoundPrimary
    s_MemoryPoolSoundPrimaryRatio
    s_MemoryPoolSoundSecondary
    s_MemoryPoolSoundSecondaryRatio
    s_MemoryPoolSystem
    s_MidiFile
    s_MinRepeatSoundTimeout
    s_MusicCategory
    s_MusicEnable
    s_MusicFormat
    s_MusicInfoDebugFilter
    s_MusicMaxPatterns
    s_MusicProfiling
    s_MusicSpeakerBackVolume
    s_MusicSpeakerCenterVolume
    s_MusicSpeakerFrontVolume
    s_MusicSpeakerLFEVolume
    s_MusicSpeakerSideVolume
    s_MusicStreaming
    s_MusicVolume
    s_NetworkAudition
    s_NoFocusVolume
    s_NumLoadingThreadsToUse
    s_Obstruction
    s_ObstructionAccuracy
    s_ObstructionMaxPierecability
    s_ObstructionMaxRadius
    s_ObstructionMaxValue
    s_ObstructionUpdate
    s_ObstructionVisArea
    s_OffscreenEnable
    s_OutputConfig
    s_PlaybackFilter
    s_PrecacheData
    s_PrecacheDuration
    s_PreloadWeaponProjects
    s_PriorityThereshold
    s_PriorityThreshold
    s_Profiling
    s_RecordConfig
    s_ReverbDebugDraw
    s_ReverbDelay
    s_ReverbDynamic
    s_ReverbEchoDSP
    s_ReverbReflectionDelay
    s_ReverbType
    s_SFXVolume
    s_SoftwareChannels
    s_SoundEnable
    s_SoundInfo
    s_SoundInfoLogFile
    s_SoundMoods
    s_SoundMoodsDSP
    s_SpamFilterTimeout
    s_SpeakerConfig
    s_StopSoundsImmediately
    s_StreamBufferSize
    s_StreamDialogIntoMemory
    s_StreamProjectFiles
    s_UnloadData
    s_UnloadProjects
    s_UnusedSoundCount
    s_VUMeter
    s_VariationLimiter
    s_VehcleMusicVolume
    s_VisAreasPropagation
    s_Vol0TurnsVirtual
    s_X2CullingByDistance
    s_X2CullingByMaxChannel
    s_X2CullingDistance
    s_X2CullingDistanceRatio
    s_X2CullingMaxChannelRatio
    s_XMADecoders
    s_gameVehicleMusicVolume
    s_vehicleMusicVolume
    
    # UI settings
    ui_RepeatDelay
    ui_avi
    ui_avi_subs
    ui_avis
    ui_check_gfile
    ui_check_icon_atlas
    ui_check_texture
    ui_content_info_feature_sets
    ui_content_infos
    ui_disable_caption
    ui_double_click_interval
    ui_draw_level
    ui_dump_textures
    ui_esc_menu_categories
    ui_esc_menus
    ui_event
    ui_eventProfile
    ui_fader
    ui_gender_transfer
    ui_hud_right_icon_menus
    ui_localized_text_debug
    ui_modelview_enable
    ui_modelview_update_times
    ui_options
    ui_output_font_full_texture
    ui_picking_color
    ui_reload
    ui_scale
    ui_scale_change
    ui_skill_accessor_update_interval
    ui_stamp
    ui_stats
    ui_texts
    ui_toggle_beautyshop
    ui_toggle_ranking