import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CheckboxState(actions: actions),
      child: MyApp(),
    ),
  );
}

final Map<String, List<String>> actions = {
  'Survey and Layout': [
    '1. Confirm benchmark and base lines are correct.',
    '2. Verify Surveyor is licensed, if required.',
    '3. Plan ahead to insure all layouts are protected during site work activities.',
  ],
  'Site Clearing': [
    '1. Have all permits handy - DEP, EPA, Burning, etc.',
    '2. Identify limits of clearing.',
    '3. Identify structures to remain.',
    '4. Identify trees to remain.',
    '5. Protect trees which are to remain and which are vulnerable to damage. Protect prior to mobilizing equipment.',
    '6. Are Environmental Controls in place and properly maintained (hay bales, silt fences, etc.).',
    '7. Protect streams from silt contamination.',
    '8. Check location of dump for debris.',
    '9. Review Construction Documents for onsite location of hazardous materials and wastes, land fills, trash and rubbish to be removed, structures and appurtenances to remain. etc. prior to starting work.',
  ],
  'Site Work': [
    '1. Obtain necessary permits, if any.',
    '2. Identify limits of work.',
    '3. Compare existing topography with contract documents (especially important if contract documents are based on aerial photo topography.',
    '4. As-builts for all new underground construction and structures.',
    '5. Compare actual soil to boring data as soon as possible.',
    '6. Have samples of proposed backfill or imported borrow material tested for conformance with specs prior to beginning backfill work.',
    '7. Retain inspector to check compaction of backfill or engineered fill. (If possible use same firm which performed soils investigations and prepared Geotechnical Report for use by Architect.',
    '8. Have pre-inspection meeting with testing inspector to review his duties.',
    '9. Do not place fill on frozen ground.',
    '10, Verify that all organic material is removed prior to placing new fill.',
    '11. Review specs for allowable depth of fill placement (lifts)',
    '12. Prior to backfilling against a retaining wall, make sure wall is braced and/or cured. Verify with structural engineer any backfill limitations.',
    '13. Backfill both sides of wall - balanced fashion.',
    '14. Notify utility companies, i.e., telephone, gas, water/domestic/fire protection, electric, other: use One Call.',
    '15. Locate all existing utilities; use One Call.',
    '16. Plan and locate all stockpile locations. Confirm locations will not interfere with future construction.',
    '17. If site has excess topsoil, check whether local municipality has ordinance prohibiting hauling topsoil away without approval.',
    '18. Keep topsoil stockpile neat and well drained.',
    '19. Provide temporary seeding of topsoil stockpile.',
    '20. Periodic check of elevations as site work progresses.',
    '21. Keep existing roads clean and clear. Keep public roads clean.',
    '22. Check bank slopes.',
    '23. Barricades around all excavation.',
    '24. Keep excavations drained and as dry as possible. Some municipalities require wheel wash stations and/or stone at exit.',
    '25. Check base after rain and before resuming fill operations.',
    '26. Visually inspect cut and fill areas for pumping and/or rolling prior to backfilling of additional fill. Observe ground behavior under equipment or truck load. If it "pumps" or "weaves" , problems exist.',
    '27. Maintain temporary soil erosion and storm water management systems required during construction.',
    '28. Establish site access/egress, truck wash, parking, staging, etc.',
  ],
  'Demolition': [
    '1. Obtain required permits, if any.',
    '2. Notify utility companies, i.e., telephone, gas, water/domestic/fire protection, electric, other; use One Call.',
    '3. Check rubbish chute (if required) for proper support.',
    '4. Establish a good working plan; review with the Subcontractor.',
    '5. Verify that existing floors will support demolition equipment.',
    '6. Check structural requirements prior to cutting openings.',
    '7. If the fire protection sprinkler system is to be shut down, notify Owner and his insurance underwriter and supplement with fire watch or fire department standby.',
    '8. Assure adequate lighting.',
    '9. Post signs indicating passageways, stairways and demolition area.',
    '10. Install necessary barricades.',
    '11. Have water available for dust control.',
    '12. Agree on salvage items with Owner; establish a program for Owner notification and removal.',
    '13. Follow all safety guidelines.',
    '14. Check for hazardous material or residue in existing pipes and ducts. This is critical in laboratory and hospital conditions.',
    '15. Verify that electrical power is disconnected prior to demolition.',
  ],
  'Blasting': [
    '1. Obtain required permits, if any.',
    '2. Special insurance is required,',
    '3. Use only licensed personnel.',
    '4. Fire protection available.',
    '5. Post signs - "no radio transmission".',
    '6. Erect necessary barricades.',
    '7. Store explosives in an authorized container.',
    '8. Notify local police to guard against theft of explosives.',
    '9. If necessary, use seismic equipment to monitor blastings.',
    '10. Inspect existing structures prior to blasting, including neighbors.',
    '11. Take photographs (video preferred) of existing structures before and after blasting, including neighbors.',
    '12. Protection - Heavy mats/other.',
    '13. Keep daily work logs (quantity of explosives, result of blast).',
  ],
  'Piling': [
    '1. Retain independent inspection agency FULL TIME on jobsite.',
    '2. Review type of pile furnished for conformance with approved data: review boring logs and subsurface reports for anticipated obstructions and driving depths.',
    '3. Verify location of piles before and after drilling.',
    '4. Orientation of special piling.',
    '5. Hammer adequacy -check ft. lbs. energy data.',
    '6. Test piles if required.',
    '7. Monitor any vibration from pile installation.',
    '8. Monitor driving of piles according to formula for adequate load. Blows per inch.',
    '9. Load test - check BOCA method and insure approval by authorities.',
    '10. Keep as-builts record of the depth of piles.',
    '11. Wood piles - check diameter, length, driving shoes, preservative certification and timber certification.',
    '12. Wood piles - cut off end of wood piles, preservative treat exposed butt.',
    '13. For hollow piles to be concrete filled, check pile before filling to ensure; shell has not collapsed, interior is clean and is free of mud and water.',
    '14. For cast-in-place piles, check that the reinforcing cage is in its proper location.'
  ],
  'Landscaping': [
    '1. Avoid contamination of topsoil with subsoil during topsoil stockpiling operations.',
    '2. Spread topsoil evenly to the correct depth.',
    '3. Check grade elevations to ensure proper drainage of surface water.',
    '4. Check for removal of stones and other objects prior to seeding and sodding.',
    '5. Check seed mixture versus specification requirements.',
    '6. Protect seeding (hydro seed or straw mulch).',
    '7. Inspect the moisture conditions of sod.',
    '8. Plant only within approved seasons.',
    '9. Check foliage for wilt or dryness.',
    '10. Check dimensions of tree and plant ball.',
    '11. Reject plants with balls broken, cracked or pliable.',
    '12. For bare root plants, obtain certification that plants were dug when fully dormant.',
    '13. Check for broken roots.',
    '14. Review method of handling during transit.',
    '15. Check depth, diameter and spacing of excavation.',
    '16. Review watering schedule and responsibility.',
    '17. Most common cause of plant or tree death is "drowning". Be sure design provides for adequate drainage at root level if soil is not naturally porous.',
  ],
  'Bituminous Paving': [
    '1. Design mix to be approved by Architect or engineer.',
    '2. Take periodic samples of the batch from trucks and have tested by testing agency. Compare results with design requirements.',
    '3. Have testing agency check batch plants periodically, if required.',
    '4. Verify depth of each paving layer (lift).',
    '5. Take cores for sample testing.',
    '6. Insure adequacy of tack coat (gallons/sy).',
    '7. Make sure sub grade is suitable to receive paving; excavate pumping and rolling areas if required.',
    '8. The sub grade elevation (by others) to be checked. Generally should be 2" +/- to design elevation.',
    '9. Discuss protection of curbs (chipping, staining) with roller operators prior to starting paving operations.',
    '10. Check castings for damage from equipment (manholes, gratings, etc.).',
  ],
  'Concrete Forming': [
    '1. Verify that footing excavation bottoms are solid.',
    '2. Pour schedule preparation.',
    '3. Check tie designs and spacing if concrete is to be exposed.',
    '4. Check all keyway requirements.',
    '5. Check location (layout) of forms.',
    '6. Check form supports for conformance with form drawings and basic soundness.',
    '7. Check forms for plumb.',
    '8. Check interior condition of forms for soundness and proper surface finish.',
    '9. Clean out area prior to pour.',
    '10. Check installation and number of form ties.',
    '11. Oil metal forms.',
    '12. Wet down forms prior to pour.',
    '13. Form supports must not be stripped prematurely. Check specifications for any surface applied curing materials.',
    '14. Check location and size of sleeves.',
    '15. Check for inverts and box outs.',
    '16. Sleeves in exterior walls should be non-ferrous (avoid rust stains).',
  ],
  'Concrete Reinforcing': [
    '1. Place reinforcing in accordance with rebar shop drawings.',
    '2. Support reinforcing with proper accessories.',
    '3. Reinforcing to be free of mud and dirt. Store rebar off of ground surface.',
    '4. Keep reinforcing at least 3" from bottom of footing or as indicated on drawings.',
    '5. Check rebar coverage for beams, girders and columns.',
    '6. Check number, size and configuration of rebar prior to pour.',
    '7. Check mill mark for Grade Type (E60), etc.',
    '8. Set up a foolproof system to ensure that the proper grade rebar is placed in the correct location.',
    '9. Reinforcing mesh in slabs within 1" to 2" of surface.',
  ],
  'Cast in place Concrete': [
    '1. Familiarize the labor and finisher foreman with the mix design, especially super plasticizer. Review restrictions on adding water to concrete at site.',
    '2. Review approved design mixes for all strengths.',
    '3. Check truck time form start of mixing of concrete. You do not want the initial set of concrete to begin in the truck.',
    '4. Check specifications for cylinder break requirements.',
    '5. Take slump tests.',
    '6. Check placement procedures.',
    '7. Do not over-vibrate concrete.',
    '8. If high or low temperature extremes are likely, make prior arrangements for cooling or heating concrete.',
    '9. Ensure that the wire mesh reinforcing is placed and maintained in the design location. Wire mesh should have proper support during placement.',
    '10. Arrange for temporary lighting if pouring and finishing is required after daylight hours.',
    '11. Do not allow surfaces of slabs to dry too quickly. Ensure curing is controlled. An excellent cure for slabs is water (moist curing)',
    '12. Arrange to saw cut slabs on grade as soon as possible after pour to avoid cracking.',
    '13. Monitor curing compound - make sure material used is compatible with tile, terrazzo and other finishes.',
    '14. Ensure that screeds for floor slabs and decks are set at the proper elevation prior to the concrete pour.',
    '15. During concrete floor pours, continually check the elevation to ensure a flat surface. Fully understand elevated slab engineering requirements since deflection will occur, understand tolerances and review with foreman.',
  ],
  'Architectural Precast Concrete': [
    '1. Keep approved samples in field office.',
    '2. Check for proper placements of inserts.',
    '3. Coordinate clips and brackets with structural steel fabricators and precaster.',
    '4. Coordinate all embedment between precast and other trades.',
    '5. Review horizontal and vertical alignment tolerances allowed for the precast elements. Check to be sure you obtain these tolerances.',
    '6. Visit plant periodically to ensure specifications are being followed.',
    "7. Arrange to obtain copies of precaster's concrete cylinder tests.",
    '8. Check for proper dimensions of forms and opening.',
    '9. Check for proper reinforcing.',
    '10. Compare approved sample with new panels. Color, texture etc.',
    '11. Determine sequence of installation for steel, spray fireproofing and precast.',
    '12. Keep precast on dunnage during storage. Insure that dunnage does not stain precast.',
    '13. Make sure lifting cables and slings are in first class condition.',
    '14. Be sure erection shims and wedges are permanent and non-corrosive.',
    '15. Mounting and adjusting nuts and bolts should be permanently anchored in place following final alignment. (usually by tack welding).',
    '16. Patch all holes and depressions in precast used for lifting and handling.',
    '17. Insure that qualified craftsman performs cosmetic patching and repair on exposed faces of precast.',
    '18. Exposed surfaces of precast must be free of all dirt stains and cracking from transportation and handling. Document any and all deficiencies immediately.',
  ],
  'Structural Precast Concrete': [
    '1. Be sure shop drawings include all required inserts and embedments.',
    '2. Obtain and retain approved sample of the precast to serve as a standard of the agreed finish and workmanship.',
    '3. Check bearing pads at support points for conformity with contract requirements.',
    '4. Patch concrete at lifting points and lifting inserts.',
    '5. Cosmetic patch at exposed surfaces (honeycomb, chips, erection damage, etc.)',
    '6. Visit plant periodically to ensure finish product is in accordance with approved sample.',
  ],
  'Masonry': [
    '1. All masonry samples are to be approved by the Architect.',
    '2. Approved samples to be stored in field office for comparison to material delivered.',
    '3. Prepare mock up panels when required and have approved by Architect and/or Owner. Keep safe on site during the masonry operation.',
    '4. Examine representative pallets of concrete masonry units when delivered to the jobsite. Reject deliveries which have significant quantities of block with chips, broken corners and voids.',
    '5. Continually inspect installed block for color, texture, size, ships, cracks, bond, etc.',
    '6. Store material off ground and keep covered.',
    '7. Check for proper reinforcing; Type, size and location.',
    '8. Check the parging material. (parging material is a coating often applied to the surface of masonry walls for protection and aesthetic purposes).',
    '9. Check mortar mix for conformance with design mix.',
    '10. Check color of mortar mix.',
    '11. Check wall anchors for proper material (galvanized, stainless steel, etc.)',
    '12. Check wall anchors or other embedments for proper location and spacing.',
    '13. Where backfill occurs on one side, unless reinforced, never backfill without consulting Structural Engineer. Do not allow operation to begin until wall is properly supported.',
    '14. Check horizontal and vertical coursing to eliminate fractional courses.',
    '15. Check openings. Maintain coursing through openings.',
    '16. Joint reinforcing should not pass through control joints.',
    '17. Check location and proper overlap of thru-wall flashing.',
    '18. Check type and location of weep holes and wall vents.',
    '19. Ensure that mortar joints are level, plumb and proper thickness.',
    '20. Ensure that tooled joints are the proper type (concave, convex or flush).',
    '21. Cover top of walls each night.',
    '22. Do not permit masons to slush excess mortar into the cavity space of a two-wythe wall. That will seriously impair functioning of the weep holes.',
    '23. Conduct periodic meetings with masonry subcontractor representative regarding Quality Control.',
    '24. Check ties and anchors for proper material thickness.',
    '25. Check if steel reinforcing is required.',
    '26. Check location and size of all sleeves.',
    '27. Sleeves in exterior walls should be non-ferrous (avoid rust stains).',
    '28. Ensure that expansion and control joint filler material is in accordance with approved samples.',
    '29. Check type of lintels required.',
    '30. Install pea gravel for weep system, if required.',
    '31. Review location and requirements for flashings.',
    '32. Review sealing of penetrations and dam conditions.',
    '33. Check if mortar net is specified.',
  ],
  'Structural Steel': [
    '1. Plant visitations.',
    '2. Mill certificates.',
    '3. If specifications call for approval of shop or field welding procedures, be sure the fabricator or erector submits them.',
    '4. If specifications require qualified welders in the shop or in the field, examine the papers of the persons proposed to be sure their qualifications are current and cover the type welding required for the project.',
    '5. Check that bolts used are in accordance with specifications. Especially important for high strength bolts.',
    '6. Check the bolt and nut containers in the field to be certain the specified fasteners are used.',
    '7. check shop painting for approved colors and coverage.',
    '8. Coordinate painting or non-painting of steel with spray fireproofing.',
    '9. Check all welds for location, size, etc.',
    '10. Testing results of X-rays, etc. to be kept on file.',
    '11. Check calibration of testing equipment.',
    '12. Check alignment of all members.',
    '13. Employ an independent inspection agency to examine the structural steel structure to include, but not be limited to, the following: \n• Plumbness, \n• Bolts torqued to proper design, \n• Type of bolts used are as specified, \n• Welds are as specified, \n• Steel members are correct size and length, \n• Moment connections are correct.',
    '14. Never allow holes or cutouts to be burned in rolled shapes in the field without first reviewing with the Structural Engineer.',
    '15. Check leveling plates for perfect level and flatness before steel columns are set on the plates.',
    '16. Perimeter safety cable may be required of the steel subcontractor. Cable will need to be installed prior to and after concrete slab placement. Make sure this is coordinated and also coordinate where material/equipment mobilization points will be located so that the cable installation is not affected.',
  ],
  'Open Web Steel Joists': [
    '1. Make certain proper quantity of end fasteners are used when joining joists to other building elements.',
    '2. Check for proper type and quantity of bridging between joists.',
    '3. Be sure lower chord extensions, when required, are properly secured to the intended adjacent construction,',
    '4. When other trades begin to support equipment form the steel joists, they must support only from panel points, if they choose to hang from the lower chord.',
    '5. Verify end conditions with bearing or connection conditions.'
  ],
  'Metal Deck': [
    '1. Check gauge, configuration and finish of deck upon delivery to jobsite. (galvanized, painted, phos-painted).',
    '2. If deck is to remain exposed, make sure it is handled and stored properly.',
    '3. If composite deck, check shear stud location and welds.',
    '4. Shear studs must be physically tested (beaten with sledge hammer).',
    '5. Check sump pan locations.',
    '6. Check spacing and size of puddle welds used to fasten deck to steel structure. Review if washers are required for this welding operation at roof decking.',
    '7. Check both floor and roof deck for proper type and spacing of side lap fastening.',
    '8. Require tough up on puddle welds on roof deck before applying insulation and membrane roofing.',
    '9. Clean metal deck prior to pour.',
    '10. Coordinate cleanliness (removal of oils) with any spray fireproofing or painting operations.',
    '11. Determine if temporary support is required for construction loading or concrete placement.',
    '12. Review penetrations and attachments with other trades.',
  ],
  'Miscellaneous Metal': [
    '1. Round pipe railings, where joined, must be neatly welded and carefully ground to provide a smooth and continuous profile.',
    '2. Steel members to be in permanent contact with masonry generally must be treated with a bitumastic coating on the sides or faces to be in contact with the masonry.',
    '3. When welding miscellaneous metal in semi-finished spaces, (i.e. toilet rooms) protect the existing finished surfaces from burning or scarring from weld spatter.',
    '4. Check for proper galvanizing on miscellaneous metal, where required.',
  ],
  'Rough Carpentry': [
    '1. Check wood species, hemlock, fir, pine, etc.',
    '2. Be sure wood meets dimensional requirements and is stamped with proper grade mark.',
    '3. Check drawings for wood blocking requirements.',
    '4. Certification of wood preservative treatment.',
    '5. Certification of fire treatment.',
    '6. Affidavits from lumber supplier for moisture content.',
    '7. Stack on site with proper ventilation and protection.',
    '8. Proper quality - straight, true, flat, etc.',
    '9. Confirm code requirements for fire treatment versus wood preservative treatment.',
    '10. Proper fasteners for use.',
    '11. Proper glue for intended use (if applicable - interior/exterior.',
    '12. Proper width/thickness for use. Review heights and clearances required for skylights.',
    '13. Allowance for shimming, if required.',
  ],
  'Finish Carpentry': [
    '1. Review hardware and built-in requirements.',
    '2. Coordinate opening dimensions with wall construction and millwork fabrication.',
    '3. Verify that blocking and backing is as required.',
    '4. Receive, unload, handle, store and distribute millwork, doors, hardware, etc.',
  ],
  'Millwork': [
    '1. All hardware as specified.',
    '2. No bubbles or failure in plastic laminate.',
    '3. Interiors to have finish or backer laminate as required.',
    '4. Doors and drawers function properly.',
    '5. Colors match approved samples.',
    '6. Cut-outs for work by others in proper locations and to proper dimensions.',
    '7. Check for construction methods as fabricated units are delivered to jobsite.',
  ],
  'Waterproofing': [
    '1. Compare material delivered with approved samples.',
    '2. Review plans and specs as to requirements.',
    '3. Surface to be clean, dry and free of foreign material.',
    '4. Check for proper curing of substrates, especially concrete walls.',
    '5. Check temperature - usually should be 40 degrees Fahrenheit and rising.',
    '6. If bituminous saturated felts are used, make sure plies are overlapped, a common joint does not occur and coating is checked for breaks.',
    '7. If backfill is required, ensure there is no debris, rocks, etc. used that may  damage the plies.',
    '8. If mixture of material is required, make sure the mixture is prepared properly.',
    "9. Review manufacture's recommendations.",
  ],
  'Building Insulation': [
    '1. Compare samples of approved material.',
    '2. Check that insulation is installed correctly, that it fits properly.',
    '3. Check method of attachment including use of pins and adhesives.',
    '4. Check if thickness is correct.',
    '5. Make sure the material is stored properly off the ground, covered and dry.',
    '6. Make sure the foil or other vapor barrier side is installed correctly (generally facing inward).',
    '7. Use of Kraft paper may not meet flame spread requirements. Review material used with specification.',
    '8. Confirm that "R" value meets contract requirements.',
  ],
  'Metal Siding': [
    '1. Request assurance that subsurface is prepared and is aligned properly.',
    '2. Check gauge/thickness or material.',
    '3. Check profile of siding.',
    '4. Check color.',
    '5. Check texture.',
    '6. Check flashing and accessories to be used in conjunction with the siding.',
    '7. Compare color of accessories and siding for compatibility.',
    '8. Check fastening requirements.',
    '9. Ensure that all connection clips are corrosion resistant.',
    '10. Separate aluminum siding from carbon steel support structure by a dielectric insulator',
    '11. Pay attention to the detailing and installation of corners, copings, penetrations and junctions with adjacent surfaces.',
  ],
  'Membrane Roofing': [
    "1. Check Owner's insurance company requirements versus contract documents.",
    '2. Make sure surface is clean and dry.',
    '3. If a vapor barrier is required, compare specification with material delivered.',
    '4. Make sure vapor barrier provides a complete seal.',
    '5. Check temperature requirements.',
    '6. Insulation to be kept dry during storage. If roof installation is phased, make sure stop and start joints are protected from the weather.',
    '7. Compare insulation delivered with material approved by Architect.',
    '8. Check if F.M. requires mechanical fastening of insulation a certain distance in from edge of roof.',
    '9. Stagger insulation joints.',
    '10. Make sure roof drains are protected and are in working condition before beginning roofing installation.',
    '11. All vents, equipment curbs, wood nailers, etc. should be in place prior to beginning roof installation.',
    '12. Review all temperature requirements.',
    '13. Check the color and size of aggregate required. compare with approved sample.',
    '14. Make sure excessive roof loading does not occur. May need temporary wood runways.',
    '15. Fire extinguishers must be located at the "kettle" and on the roof level.',
    '16. Review requirements for maximum asphalt temperature and spot check the kettle thermometer periodically.',
    '17. Review specifications for inspection requirements.',
  ],
  'Single Membrane Roofing': [
    "1. Subcontractor must be an approved installer of the roofing manufacturer's product.",
    '2. Ensure the type and quantity of stone ballast is in accordance with the contract documents.',
    '3. Check gluing or welding of the seams. Must be done neatly and thoroughly.',
    '4. Review specifications for inspection requirements.',
    '5. When near exiting buildings take precautions with regards to glue fumes entering air intakes.',
  ],
  'Flashing and Sheet Metal Work': [
    '1. Dissimilar metals should not be in contact with each other.',
    '2. Ensure proper fasteners are used.',
    '3. Avoid sharp cutting edges.',
    '4. Be alert for expansion requirements in material.',
    '5. Check all lapping and corner detail requirements.',
  ],
  'Skylights': [
    '1. Compare size of roof curb with approved manufacturer product data. Confirm exact roof opening requirements.',
    '2. Make sure curb is fastened to the structure in accordance with Contract Documents and manufacturer recommendations. Confirm curb height off of roof elevation.',
    '3. Inspect flashing around mounting device.',
    '4. Is there need for permanent protection at skylights (rails, etc.)?',
    '5. Compare glass with approved sample.',
  ],
  'Sealants': [
    '1. Compare all materials with approved samples.',
    '2. Check size of space provided for caulking.',
    '3. Inspect joints to ensure they are clean and dry.',
    '4. Filler material to be kept dry during storage.',
    '5. If applicable, check paint material to be applied over caulking. Make sure they are compatible.',
    '6. If caulking is a specified color, compare sample with caulking that is in place.',
    '7. Check appearance immediately after caulking has been applied Address quality control immediately if issues exist.',
    "8. Verify the 'backer rod' is the proper type and size for opening. Specifications will require closed cell or open cell. There is a difference.",
    '9. Check the applicability of the intended sealant for the actual width of joint to be filled.',
    '10. Some sealants require careful preparation of the joint before sealant application. In addition to being clean and dry, some sealants require priming of the surfaces to be sealed. check this for each application.',
  ],
  'Roof Curbs': [
    "1. Study each prefabricated curb's submittals data to ascertain whether it sits on the deck or on blocking fastened to the deck. This is essential if the curb is to be properly flashed.",
    '2. If the curb is field built, ensure its dimensions will be compatible with whatever sits on it.',
    '3. Field built curbs should be constructed of preservative treated wood.',
    '4. All curbs must be securely fastened to the roof deck.',
  ],
  'Spray Fireproofing': [
    '1. If a testing laboratory representative is to be present during fireproofing application, Ensure that he is present and provides reports on a daily basis.',
    '2. Ensure that the contractor or applicator is licensed by the fireproofing manufacturer.',
    '3. Provide field sample for approval prior to starting work.',
    "4. Observe manufacturer's temperature requirements.",
    '5. Continually verify thickness requirements. Thickness requirements may vary between steel members.',
    '6. Compare the following approved material items with material delivered: \n• Factory mixed mineral fibers, \n• Factory mixed cementitious material, \n• Primers, \n• Reinforcing.',
    '7. Check condition of structural steel before spray fireproofing application, If steel is to be sprayed, be sure it is not prime painted.',
    '8. Check cleaning of adjacent surfaces.',
    '9. Deck material may require de-oiling prior to spray application.',
    '10. Clips and hangers should be installed prior to application,',
    '11. Store material off ground and cover.',
    '12. Coordinate spray fireproofing with weather conditions.',
    '13. Review all protection of adjacent areas and finishes.',
    '14. Review clean-up procedure to avoid excessive mess and issues such as clogged drains.',
    '15. Require a through daily clean-up.',
    '16. Establish staging/mixing area.',
    '17. Review thickness requirements with foreman and inspector.',
    '18. Coordinate any prior installations, including piping, hangers, duct, partition framing, etc.',
    '19. Review need for heating.',
    '20. Discuss procedures for patching.',
  ],
  'Aluminum Doors and Frames': [
    '1. Ensure that adequate protection is provided during shipping from plant.',
    '2. Inspection when received.',
    '3. Store off ground with protection.',
    '4. Provide proper R/I opening. Double check with shop drawings.',
    '5. Check the following items immediately when received: \n• Color range, \n• Hardware cut-outs, \n• Size, \n• Opening for glass, \n• Swing, \n• Cut-outs for electrical devices and conduit, \n• Under cut.',
    '6. Protect back side of aluminum which may be in contact with masonry or mortar.',
    '7. Provide di-electric insulation between aluminum and support steel.',
  ],
  'Wood Doors': [
    '1. Store in dry controlled space.',
    '2. Check for proper grade, finish and materials.',
    '3. Undercut as required.',
    '4. Glass lites are proper size.',
  ],
  'Hollow Metal Doors and Frames': [
    '1. It is critical that inspection and inventorying occurs when material is received.',
    '2. Bottom of doors must be sealed upon receipt. Usually requirement of painting subcontractor.',
    '3. Check the following items immediately when received: \n• Tag numbers, \n• Prime paint, \n• Louver (if specified), \n• Opening for glass, \n• Swing, \n• Spreader bar on door frames, \n• Gauge, \n• Size, \n• Cut-outs for any electrical devices, i.e., security cut-out, card reader, electric latch, etc.\n• Reinforcing or backing plates, \n• Welds, if welded construction, \n• Silencer holes, \n• Undercut, \n• Hollow metal galvanized requirements.',
    '4. Ensure UL Label rating is stamped on edge of fire rated doors.',
    '5. Doors must be delivered in sufficient time before installation to allow them to "adjust" to the building environment.',
    '6. Store on any edge and uniformly supported to avoid warping.',
    '7. Store off ground with protection',
    '8. Pre-machining done properly, straight, and true.',
    '9. If installed in masonry walls or partitions, slush full with mortar the space between the masonry unit and the back side of the hollow metal frame. Advise the masonry foreman that he is responsible for the final product in masonry. Frame must be plumb and level.',
    '10. Frames to be adequately supported and braced during construction.',
    '11. Pre-fit and beveled, if specified.',
    '12. Check anchors for proper quantity and type for affixing to adjacent wall or partition.',
    '13. If doors are pre-finished, maintain protective wrapper on doors, even after unit is hung.',
  ],
  'Sliding Metal Fire Doors': [
    "1. Check for proper underwriter's classification.",
    '2. Check door for proper size, dimensions and hardware.',
    '3. Check for safety devices.',
    '4. Check for proper anchors and support.',
  ],
  'Overhead Doors': [
    '1. Ensure tracks, track supports and braces are commercial or industrial grade.',
    '2. Check door in open and closed position; inspect for proper closure and seals.',
    '3. Coordinate electrical rough-in.',
    '4. Refer to contract documents for "safety stops", type and size of motor, if automatic, and all accessories.',
    '5. Check for proper structural support.'
  ],
  'Impact Doors': [
    '1. Be certain the door frame is securely anchored. Check all fasteners and frame supports that are used.',
  ],
  'Metal and Aluminum Windows': [
    '1. Check for damage when received.',
    '2. Check color range.',
    '3. Check if windows are fabricated in accordance with specifications.',
    '4. Check dimensions.',
    '5. Store windows off ground',
    '6. Check shop primer. Touch-up if necessary.',
    '7. Insulate any dissimilar metals.',
    '8. Do not caulk weep holes. Weep hole locations vary between systems.',
    '9. Ensure that caulking backer rod will work between window and adjoining surface.',
    '10. Windows to be set level, plumb and in alignment.',
    '11. Coordinate adjoining cleaning operations with finishes on window units.',
    '12. If mortar or concrete splashes on aluminum members, clean them immediately. Aluminum can be stained by these products.',
    '13. Check the fastening materials, methods and spacing for securing the windows to the adjacent construction.',
    '14. If wood blocking is used to shim or level the rough opening, it must be preservative treated wood.',
    '15. The window installer must use permanent, non-corrosive shims and spacers.',
    '16. Protect the interior window stool form subsequent damage buy other interior trades.',
    '17. The stool must be continuously supported.',
  ],
  'Glass and Glazing': [
    '1. Inspect gasket material.',
    '2. check glass type with approved sample.',
    '3. Do not allow protective tape to remain on glass.',
    '4. Check for positive seal between glass and sash.',
    '5. Check setting points',
    '6. Check for protection rails.',
    '7. Do not store glass where exposed to elements. Water can etch glass in delivery crates.',
  ],
  'Curtain Wall Systems': [
    '1. Review need for mock-up.',
    '2. Check for damage when delivered.',
    '3. Check clips or hanger devices.',
    '4. Compare color with samples.',
    '5. Compare accessory colors with panels.',
    '6. Protection to curtain wall. During and after erection.',
    '7. Refer to items in "Metal and Aluminum Windows".',
    '8. Coordinate perimeter caulking with system.',
  ],
  'Hardware/Hollow Metal/Wood Doors': [
    '1. Ensure hardware templates have been sent by hardware supplier to hollow metal and/or other door manufactures.',
    '2. Designate one individual to receive and check each delivery of hardware.',
    '3. Designate a separate room on location to store and inventory all hardware.',
    '4. Have the hardware supplier identify all hardware and ensure that all parts are complete.',
    '5. If required by specifications, hardware supplier should set-up and deliver key cabinet with keys.',
    '6. Construction cylinders to be changed to permanent cylinders when Owner accepts building.',
    '7. Some hardware may be required to be sent to door manufacturer installation prior to delivery of doors.',
    '8. Compare hardware installed with hardware schedule.',
    '9. Are loose cylinders required to be furnished to other subcontractors for incorporation in their product? (Overhead doors, aluminum entrance doors, etc.)',
    '10 Review hollow metal installation procedure with carpenter foreman. Verify plumbness on a daily basis.',
    '11. Damaged frames should not be installed. Report damages to project engineer or manager.',
    '12. Review proper storage of wood doors.',
  ],
  'Lath and Plaster': [
    '1. Inspect type of studs required',
    '2. Check the gauge spacing and height of studs',
    '3. Check back-up accessories for wall-mounted devices',
    '4. Check type and size of lath along with all accessories.',
    '5. Check methods of attaching lath to studs.',
    '6. Review the type of plaster specified.',
    '7. Check the thickness and coats required.',
    '8. For high areas, discuss how to avoid staging marks.',
    '9. Review type of permanent lighting required. Temporary lighting to be installed to simulate permanent lighting.',
    '10. Check provisions to protect adjacent materials from plaster.',
    '11. Review type of finish.',
    '12. Provide control joints.',
    '13. Control curing time between application of subsequent coats. Sufficient time for controlled drying must be allowed.',
    '14. Do not allow temporary heat to be direct against freshly plastered surfaces. Too rapid drying will occur and produce surface crazing, which can compromise the integrity and appearance of the finished plaster surface.',
  ],
  'Gypsum Drywall': [
    '1. Check framing around duct openings.',
    '2. Check thickness, length and width of gypsum wall board.',
    '3. Check type of drywall required.',
    '4. Check if drywall is to be installed horizontal or vertical',
    '5. Check temperature requirements for spackle.',
    '6. Compare accessories with approved data.',
    '7. Include control joints as required by specifications or building standards.',
    '8. Install gypsum board approximately 1/2" above floor surface to preclude "wicking" of water from floor.',
    '9. Visually check alignment of tracks and studs in long partitions before gypsum board is installed to avoid "waves" in wall.',
    '10. Check for blocking in partition for support of railings, toilet accessories, wall hung cabinets, etc. before applying gypsum board surface.',
    '11. Ensure that walls and partitions to receive sound or thermal insulation and that it is a quality installation.',
    '12. Learn required spacing for fasteners, nails, or screws, and check for conformity to those requirements.',
    '13. If partition is to terminate at underside of a suspended ceiling, be sure termination line is neat and straight.',
    '14. Make initial quality check of drywall finishing.',
    '15. Review clearances around penetrations to ensure proper fire sealant and safing installations.',
    '16. Review quality control of drywall finishing where lighting will "wash" drywall surface. Imperfections in drywall will be highlighted with certain types of lighting.',
    '17. Drywall finishing at base of walls should be smooth in order to eliminate any waves in vinyl base.',
  ],
  'Ceramic Tile': [
    '1. Beware of environmental conditions, temperature, relative humidity, etc. prior to setting ceramic tile.',
    '2. Check all surfaces to be covered with tile to ensure they are square and plumb. They shall be clean, dry, firm and oil-free surfaces.',
    '3. Check it a leveling coat is to be applied to walls or ceilings prior to installing tile.',
    '4. Compare tile received with approved color charts and/or samples.',
    '5. Tile to be inspected for size, shape, texture, color and pattern. Cuts should be kept to a minimum. Review proposed layouts with foreman.',
    '6. Upon delivery, check quantity and check for damaged tile.',
    '7. Accessories on the tile work should be placed so they are evenly spaced, properly centered with tile joints, level, plumb and true to the correct location.',
    '8. Verify color of grout and type of grout.',
    '9. Inspect for all required expansion and control joints.',
    '10. Check sealant required in control or expansion joints.',
    '11. Setting the cove tile base in a room to receive ceramic tile wall and floor tile is a critical operation, The cove base must be absolutely level and set to the high point of the floor. If the floor is too uneven , solve that problem before proceeding further with wall or floor tile installation.',
    '12. Beware of ceramic wall tile to be installed beneath "wall washer" lighting. Every imperfection will be visible and emphasized. Review with project manager and architect.',
    '13. Check with the installing mechanic on his basic layout for the wall and floor. Avoid narrow "cuts," especially in highly visible areas, i.e., near door.',
    '14. Verify the opening for toilet accessories. Oversize openings will be a costly fix.',
    '15. Protect installed ceramic tile from welding spatter, if welding must be done subsequent to installation of the ceramic tile.',
    '16. If contract documents require waterproof setting mastic, verify by checking containers.',
    '17, Check if any type of waterproofing is required prior to setting floor tile.',
    '18. Verify if floor is to be depressed.',
    '19. Be sure floor drains are at a correct elevation.',
    '20. Verify that the floor elevations of adjacent areas at common openings are as designed.',
  ],
  'Quarry Tile': [
    '1. Same as for ceramic tile walls and floors.',
    '2. Verify if floor is to be depressed.',
    '3. Control joints must coincide with joints in slab.',
    '4. Some exotic grouts are sometimes specified for these floors, i.e., epoxy, furan, etc. Know what is specified and ensure that is what is installed.',
  ],
  'Terrazzo': [
    '1. Check if a depressed slab is required.',
    '2. Inspect concrete surface. Surface must be free from oil, dirt, curing compounds, hardeners, etc. If not, an acid wash may be required or roughing of surface may be necessary for bonding.',
    '3. Compare representative chips of marble with approved samples.',
    '4. Inspect mortar to be used.',
    '5. Inspect control strips and expansion joints.',
    '6. Check gauge of galvanized wire, if required.',
  ],
  'Epoxy Terrazzo': [
    '1. Same as Terrazzo.',
    '2. Compare the epoxy resins with approved data.',
    '3. Compare all accessories with approved data. Some alloys are not compatible with epoxy.',
    '4. Vapor barrier under slab is generally mandatory.',
    '5. Be absolutely certain the substrate is clean and free of any substances, including curing compounds and sealers. which could affect adhesion between it and the epoxy terrazzo. Do not proceed with installation of topping unless you are satisfied.',
    '6. Epoxy terrazzo cannot generally be installed on a slab below grade or a slab which may have moisture permanently in it.',
    '7. Epoxy terrazzo is installed as a very thin topping, be sure the initial application of epoxy mix is sufficiently thick so that subsequent grinding operations will not reduce it below the minimum required thickness.',
    '8. Timing between application of the prime coat on the substrate and the epoxy mix to the primer coat is critical. Be sure the mechanics working your job understand these limitations.',
    '9. Review all ventilation needs. Fully review the surrounding work force and occupied areas and the impact the odors may have.',
  ],
  'Precast Terrazzo': [
    '1. Inspect precast plant periodically to compare fabrication with approved samples.',
    '2. Inspect the type of material to be used to attach precast to walls etc.',
  ],
  'Acoustical Ceilings': [
    '1. Starting points for ceiling frid to be established in each area by the ceiling subcontractor prior to starting overhead mechanical and electrical work and other items, which need to be coordinated with ceiling.',
    '2. Establish the method of hanging ceiling grid. Eliminate interference with other trades early on.',
    '3. Compare all ceiling accessories with approved samples.',
    '4. Inspect type, gauge and spacing of hangers.',
    '5. Hanger wires must be secured to the building structure. not to pipe, duct or conduit. Do not penetrate roof deck.',
    '6. Compare ceiling molding and grid with approved samples.',
    '7. Compare ceiling panels with approved samples.',
    "8. Check manufacturer's recommendations regarding temperature requirements during installation. Tiles will droop or warp with excessive humidity.",
    '9. If you are entitled by contract to receive prefab exterior corners on edge trim, do not settle for field cuts and pop rivets.',
    '10. Check and re-level the ceiling after loading has been applied to the suspension system,i.e., lighting fixtures, diffusers, etc.',
    '11. avoid whenever possible, narrow silvers of ceiling tile at edges of the field. Endeavor to re-arrange the ceiling layout to eliminate this condition.'
  ],
  'Vinyl Composition Tile': [
    '1. Inspect flooring on which the resilient material is to be placed to ensure bonding. No oil, grease, dirt or curing compounds. Some may be deleterious to the adhesive. If there is question of excessive moisture being present in subsurface do not apply flooring without test.',
    '2. Check that all joints and cracks are filled with an approved material prior to installation.',
    '3. Check level of floor prior to installation, flash patching may be required. Any existing moisture may cause problems with patching material.',
    '4. Compare resilient flooring material with approved samples.',
    '5. Compare the adhesive material with approved data.',
    '6. Check the laying pattern to ensure that opposite borders are of equal width. Cut tiles only at base and outlets in floor.',
    '7. Check that adhesive is being applied in a proper manner and at a proper rate.',
    "8. Check manufacturer's recommendations for proper drying time for adhesive.",
    '9. Check for tight joints, straight lines and smooth level surface.',
    '10. Protect floor from damage with an approved material.'
  ],
  'Resilient Sheet Flooring': [
    '1. Sheet flooring to be rolled with approved equipment.',
    '2. Check for air bubbles and wrinkles.',
    '3. Check the adhesive to be sure for compatibility with the substrate and with the flooring.',
    '4. Subsurface conditions and requirements are the same as vinyl composition tile.',
  ],
  'Painting': [
    '1. Compare paint with approved color schedules.',
    '2. Inspect surface to be painted prior to paint application. Fill in voids, joints, cracks, etc. with an approved material.',
    '3. Check moisture content of surface to be painted.',
    "4. Check manufacture's recommendation regarding temperature requirements for application.",
    '5. Inspect the application for thickness and coverage for each coat.',
    '6. Check type of application, i.e., brush, roller or spray.',
    '7. Prior to painting caulked joints, check if caulk material is compatible with paint.',
    '8. Make sure the bottoms of wood doors are sealed immediately upon delivery.',
    '9. Assure proper preparation of the surface to be painted, and assure the required numbers of coats are applied.',
    '10. If a wall covering is to be applied, be sure sizing is applied to the wall surface prior to application of the wall covering.'
  ],
  'Carpet': [
    '1. Review subsurface conditions prior to installation.',
    '2. Discuss method of delivering and route to be taken into building.',
    '3. Compare carpet delivered with approved samples.',
    '4. Clean surfaces of floor that carpet is to be placed.',
    '5. Compare mastic to be used with approved samples or data.',
    '6. Compare base material and mastic with approved samples.',
    '7. Discuss cut-outs with participating trades. Ensure that sizes are agreed upon by all parties.',
    '8. Review attic stock quantities and storage locations.',
    '9. Check specifications if carpet is to be cleaned prior to Owner use.',
  ],
  'Wall Coverings': [
    '1. Inspect surface to be covered. Any bumps may show up in wall covering.',
    '2. Compare material delivered with approved samples.',
    '3. Compare mastic with approved samples or data.',
    "4. Check manufacturer's recommendation regarding temperature requirements and other data.",
    '5. Make sure pattern matches.',
    '6. Ensure joints butt, no overlap and no space between sheets.',
    '7. Remove all air bubbles.',
    '8. Check plumbness and all cuts for neatness.',
    '9. Review sizing requirements.'
  ],
  'Toilet Partitions and Urinal Screens': [
    '1. Verify if partitions are ceiling or floor mounted.',
    '2. If ceiling mounted, check dimension of holes in miscellaneous iron.',
    '3. Compare partition colors with approved color charts.',
    '4. Verify toilet accessories that are part of toilet partition contract.',
    '5. Verify type of partition and screen material. i.e., stainless steel, porcelain, metal, etc.',
    '6. Verify size of any cut-outs.',
    '7. Check hardware and door swing.',
    '8. Where screens and partitions are to be anchored to a wall, be sure provisions have been made for secure and permanent anchorage.',
    '9. Where such anchorages are made through ceramic tile, check the tile after installation of the partitions for cracks and spalls. These are the responsibility of the toilet partition contractor.',
    '10. If touch-up painting is needed to correct minor scratches and abrasions, be sure it is done properly.',
    '11. Verify gauges of doors, panels and pilasters.',
    '12. Review quality of installation prior to installer leaving the project. Pay attention to spacing between doors and jambs.',
  ],
  'Lockers': [
    '1. Check the gauge of lockers, doors and door frames.',
    '2. Check size of lockers.',
    '3. Check hardware, locks, numbers hook and shelves, etc.',
    '4. Compare color of lockers to approved color chart.',
    '5. Check filler material and sloping tops if required.',
    '6. Check alignment, and if lockers are well secured.',
  ],
  'Fire Extinguishers': [
    '1. Check if cabinet is required. Is it recessed or wall mounted.',
    '2. Verify size of cabinets.',
    '3. Check type(s) of extinguishers required.',
    '4. May have Fire Marshal check extinguishers after they are placed.',
    '5. Protect the cabinet against damage by other finishing trades.',
    '6. Verify that rough openings are the correct dimensions.',
  ],
  'Toilet Accessories': [
    '1. Check for blocking required in walls to receive and fasten toilet accessories.',
    '2. Verify opening dimensions in walls to receive toilet accessories.',
    '3. Verify that all toilet accessories are in accordance with approved data, i.e., manufacturer, material, etc.',
    '4. Inventory the material as it arrives on the job. Do not wait until installation begins.',
  ],
  'Kitchen Equipment': [
    '1. Shop drawings indication service stub-ups to allow the installation of underground service piping.',
    '2. Coordinate the approved kitchen shop drawings with the mechanical/electrical contractors.',
    '3. Verify gauges, type of material and size of all counters, benches, sinks, etc.',
    '4. Verify the exhaust system required, coordinate with the mechanical exhaust system.',
    '5. Check fire protection requirement.',
    '6. Is there sufficient support for the hood exhaust?',
    '7. Check wall, reinforcing requirements for shelving equipment.',
    '8. Is floor and ceiling installed prior to installation of kitchen equipment?',
    '9. Compare all equipment with approved data.',
    '10. Compare all plumbing and electrical devices with approved data.',
    '11. Determine floor elevation and ceiling heights prior to installing equipment.',
  ],
  'Laboratory Furniture': [
    '1. Check color and finish of furniture.',
    '2. Check quality of jointing work for lab tops. Sealer colors to match tops.',
    '3. Prior to installation of unistruts, determine the floor elevation in relation to window, door, fume hoods, and ceiling heights. The furniture can be adjusted up but not down.',
    '4. Verify size, height, and location of unistruts.',
    '5. Confirm that the electrical and mechanical contractors will utilize the lab unistrut for attaching mechanical and electrical service pipe. If not, coordination must be done between the three contractors.',
    '6. Ensure the service ledges are in accordance with approved contract documents. There are different types.',
    '7. All rough-in piping and conduit should be installed on the unistrut prior to installation of furniture (base cabinets). Piping should also be tested and insulated. This eliminates damage to furniture.',
    '8. Prior to wall installation, make sure wall will have proper blocking or support to receive wall cabinets.',
    '9. When base cabinet tops are delivered, compare the following approved samples: \n• Type of top, \n• Thickness of top, \n• Cut-out dimensions, \n• Shape of top, \n• Check for damage.',
    '10. Fume hoods - check the following: \n• Height of completed hood, \n• Will hood fit thru all openings from dock to final resting place? (check as early as possible), \n• Does manufacturer pre-wire hood? if so has this work been done? \n• Are light fixtures included in the lab furniture contract? if so, have these been received or installed?',
    '11. All component parts - Mechanical and electrical usually supplied by lab furniture supplier. Then given to the mechanical and electrical contractors for installation after furniture is in place.',
    '12. Compare color of wire mold with approved sample.',
    '13. Review temperature requirements by manufacturer when sealing and joint material is being used.',
  ],
  'Elevators': [
    '1. Check and recheck the location of the shaft cylinder, if a hydraulic elevator.',
    '2. Ladder to pit for each elevator.',
    '3. Coordinate underground work for hydraulic oil lines.',
    '4. All access doors to machine rooms to be fire rated.',
    '5. Inserts for guide rails to be installed during construction af walls.',
    '6. Ensure the electrical power designated for the elevators compare to the electrical requirements of the chosen elevator company.',
    '7. Ensure there is adequate power, temporary or permanent, available for testing of elevator and in construction phase.',
    '8. Prior to installation of elevator shaft walls, compare size with elevator manufacturer.',
    '9. Check dimension of all openings.',
    '10. Generally, no equipment other than elevator equipment is allowed in elevator machine room. Check spacing requirements of electrical equipment allowed in machine room.',
    '11. Check that any permanent structural beams traversing the top of the hoist way do not violate code requirements for over travel and top of cab clearance.',
    '12. Check if all accessories are complete as follows: \n• Lights, \n• Telephone, \n• Call system (Hospital codes), \n• Fire system, \n• Signaling device, \n• Operation and leveling, \n• Door operation, \n• Door size, \n• Intercommunicating system, \n• Floor covering, \n• Handrails, \n• Ceiling, \n• Elevator and wall finishes.',
    '13. Protect cab with blankets, etc. while being used prior to Owner move-in.',
    '14. Check ventilation requirements of elevator shaft.',
    '15. Review available storage area for hydraulic fluids.',
  ],
  'Piping - General': [
    '1. Check all delivered pipe for size (diameter), schedule (wall thickness), and fabrication specification (for steel pipe, an ASTM number).',
    '2. When project involves manual filed welding, check specifications for requirements such as: \n• Current welder certification papers, \n• Welding Procedures, \n• Weld identification (mark of each certified welder), \n• Required electrodes, \n• Daily check of welding machine output, \n• Chill rings (back-up rings with spacer studs), \n• Weld sampling procedures and frequency.',
    '3. When project involves special and exotic machine field welding, i.e., inert gas welding, check specifications for requirements such as: \n• Special inspections, \n• Periodic machine validation, \n• Sampling program, \n• Pipe cleaning and purging.',
    '4. All copper pipes look similar. Drawings and specifications may call for Type M, L or K. Ensure proper type is used. Review medical gas section for special piping requirements.',
    '5. Reinforced concrete pipe comes in various "weights". Check documents for special requirements.',
    '6. Storm and sanitary drainage pipe comes with a variety of fittings, i.e., non-hub, tyseal, etc. Check specifications vs. delivered pipe.',
    '7. Check bolts used with flanged pipe. Substandard imported bolts and nuts may be mistakenly shipped to the job. Check the bolt container for the proper ASTM designation.',
    '8. Plastic pipe is generally joined by a solvent welding process. Be sure the solvent or "glue" meets the manufacturer recommendations.',
    '9. Check quality control for all stored piping.',
    "10. Pipe system testing may be required by the local municipality, by the contract documents, or by the Owner's insurance underwriter. Know and understand the testing requirements for the project. Record test information in Daily Report. If testing agency is not on-site, then Barclay White Skanska Inc. Superintendent should verify test.",
  ],
  'Below Ground Piping': [
    '1. Ensure that the contractor has obtained required permits.',
    '2. Check road opening for safety, permits, flag person, etc.',
    '3. Prior to starting work, determine locations and elevations of all existing piping, conduit, etc. This will decrease the possibility of interferences. Public utility services are available for locating existing installations.',
    '4. Verify inverts of all existing pipe especially pipe to be tied-into.',
    '5. The trench must be at correct elevation and proper pitch, if gravity flow piping is involved. Review safety issues as they relate to trenching.',
    '6. Check trench bottom for firmness. The bedding must be of proper material and proper thickness. No rocks or sharp objects can be left in the trench which could damage or puncture the installed pipe.',
    '7. The pipe must be supported uniformly along its length. This may require depressions at the jointing locations.',
    '8. Ensure required concrete thrust blocks, supports and encasements are provided.',
    '9. Check for proper insulation type, thickness and installation procedure.',
    '10. Underground pipe must be tested and inspected, when required, before the joints and fittings are covered by insulation or backfill.',
    '11. If joints are to remain exposed during a high pressure test, ensure that proper backfill is done over other portions of pipe to eliminate a blow out.',
    '12. Check specifications for backfill material.',
    '13. Underground pipe backfill must be compacted. Review requirements with related foreman and, where applicable, the testing agency.',
  ],
  'Above Ground Piping': [
    '1. Hangers and supports must be of proper type, proper size and proper spacing.',
    '2. Hangers and supports must be fastened to a solid stable element of the building, not hung form another pipe, conduit duct or ceiling suspension element.',
    '3. Review special requirements for all high temperature piping support.',
    '4. Review specifications for support of pipe at hanger locations. Review insulation requirements at these points.',
    '5. Plastic piping may sometimes require continuous support.',
    '6. Review all standard requirements for quality control of specialty piping which includes keeping piping clean, properly stored (off floor) and ends capped.',
    '7. Review sleeving through walls as specified by engineers. Review UL requirements as they relate to proper sleeve/piping clearances. Review all sealants including fire safing.',
    '8. If piping is to be supported from open web steel joists. it must be hung from panel points, not the chords. Review and questionable installation with project manager and engineer.',
    '9. If the specifications contain general statements regarding valve locations, obtain a clear agreement between engineer, Owner and mechanical contractor regarding precise locations. Proper access and clearances must be maintained.',
    '10. Review piping insulation requirements at roof drain horizontal piping.',
  ],
  'Medical Gas Installation': [
    "1. All work to be in accordance with NFPA 99 (National Fire Protection Association Health Care Facilities Code). Review foreman's understanding of the requirements.",
    '2. Check pipe and fitting storage for organization, cleanliness and end caps.',
    '3. Verify certification agency.',
    '4. Certification agency initial review during installation.',
    '5. Check testing and certification procedures.',
    '6. No flux is to be used during soldering.',
    '7. Piping should be cleaned with nitrogen purge.',
    '8. Nitrogen purge should be active during brazing operations.',
    '9. Check hanger material (compatible with pipe) and spacing (per NFPA 99).',
    '10. Piping should be installed to eliminate contact with dissimilar material. Through stud work plastic inserts or tape can be used.',
    '11. Piping should be cleaned prior to close up of walls.',
    '12. Open end of pipe should be capped or taped closed during installation.',
    '13. Piping should be labeled as soon as possible.',
    '14. Have pre-installation meeting with installing contractor.',
  ],
  'Equipment': [
    "1. You must refer to the specifications and the manufacturer's data for specific requirements for each item of equipment.",
    '2. Review all rigging and handling of equipment. Confirm that proper clearances are maintained during construction.',
    '3. Equipment is generally set on roof curbs, steel dunnage, and concrete pads or fabricated steel frames. Be sure the support is proper and correct for the equipment and its intended use. Pay attention to potential transmission of noise and vibration. Be sure proper vibration isolation equipment is provided where required.',
    '4. Review flashing requirements for roof mounted equipment.',
    '5. Review all anchoring requirements.',
    '6. External connections, especially pipe, must be suitably and independently supported so as not to put additional unexpected stresses on the equipment.',
    '7. Do not allow cutting and reworking of the prefabricated components unless reviewed with equipment manufacturer.',
    '8. Be sure belt and drive guards are furnished and installed for all locations where these drive elements are exposed. Do not allow equipment to operate without proper guards.',
    '9. Protect sensitive equipment from the hazards and inevitable conditions of a construction project. Temporary enclosures, protection against water may be needed.',
    "10. Check specifications and manufacturer's literature for services which are required before start-up, i.e., alignment, lubrication, inspection by manufacturer's representative.",
  ],
  'Plumbing Fixtures and Equipment': [
    '1. If plumbing fixtures are delivered to jobsite for storage, inventory them for proper quantities and check for damage.',
    '2. Request the foreman to ensure cut-outs are done with a template if lavatories are to be mounted in vanities furnished by others.',
    '3. Be sure roof drains are on job and ready for installation when roofing contractor is ready to begin his work.',
    '4. Water closets and urinals should be installed before toilet partition.',
    '5. Generally, a good installation requires wall-mounted plumbing fixtures to be caulked against the adjacent ceramic tile.',
    '6. Check the ceramic tile installation after installation of plumbing fixtures; repair or replace damaged, cracked and missing tile.',
  ],
  'Sheet Metal Ductwork': [
    '1. Prior to any overhead rough-in proper coordination is required between: \n• Ductwork, \n• Overhead piping, \n• Fire protection piping, \n• Conduit, buss duct and cable trays, \n• Lighting fixtures, \n• Ceiling grid (where applicable) \netc.',
    '2. Review the need for an on-site ductwork sketcher.',
    '3. Spot check delivered sheet metal fabrications for: \n• Gauge of metal, \n• Reinforcing, \n• Longitudinal seams,\n• Transverse joint system, \n• Proper size, \n• Type, i.e. stainless steel, galvanized and other, \n• Turning vanes, deflectors and scoops, \n• Internal lining, where required, \n etc.',
    '4. Ensure that foreman is prepared for early duct testing which will catch any upfront quality control problems.',
    '5. Duct sealants used to meet the requirements described above can, themselves, produce problems, especially in pharmaceutical installations. Be sure the sealant used meets all specification requirements.',
    '6. Internal lining must be adequately fastened and adhered to the sheet metal to avoid flaking, peeling and delaminating due to the action of the moving air inside the duct.',
    '7. Frequently the specifications make general statements regarding access door locations. Be sure there is a good agreement between Owner, engineer and sheet metal contractor. RE: Number of doors.',
    '8. Duct hangers must be adequately sized, spaced and supported. Also, check gauge of hangers. Duct must be independently supported.',
    '9. Check specification requirements for protection requirements of duct when delivered and when installed. Have foreman maintain quality control for duct cleanliness.',
    '10. Ensure that flexible duct is securely fastened with approved devices to the rigid duct and to the diffuser or other terminal device. Review specifications for allowable length of flexible duct.',
    '11. Process duct, dust collection duct, fume hood exhaust duct and kitchen exhaust duct often require special fabrication, installation and testing techniques. Read the specifications carefully.',
    '12. Review all duct penetration and enclosure requirements.',
  ],
  'Insulation': [
    '1. Check the delivered materials against the approved submittals.',
    '2. Review quality control of work during early stages of installation.',
    '3. Check adhesives, fasteners and fastener spacing for insulation applied to sheet metal.',
    '4. Piping and duct work should be tested prior to applying insulation.',
    '5. Check pipe insulation at supports. See "Above Ground Piping.',
    '6. If duct has been damaged or partially collapsed for whatever reason, fix the duct before insulation. Do not allow trades to walk on duct, including the insulators.',
    '7. Insulation exposed to the elements must have a weatherproof shield or jacket.',
    '8. Check specifications to determine if any pipe or duct must be painted, coated or heat traces in the field prior to insulating.',
  ],
  'Temperature Controls': [
    '1. Be sure both the mechanical and the electrical contractors (foreman) receive copies of the approved temperature control drawings.',
    '2. Be sure all trades adequately respect the delicate and sensitive control tubing and instruments.',
    '3. Ensure that rough-in boxes for temperature control devices are installed reasonably neat and are not subsequently abused. Teh finished instrument, when mounted, should be plumb and level.',
    '4. check thickness of recessed panels proposed by the temperature control contractor. Coordinate recesses with equipment.',
    '5. Verify location of all exposed stats and sensors prior to installation.',
    '6. Compare control panels with approved data.',
    '7. Verify location of all control panels. Invariably panels are placed in an area that interferes with air handling access doors, etc.',
    '8. Make sure the control personnel embed the tubing or wiring in partitions during construction.',
    '9. Ensure all automatic control services are connected. Review this in a consistent manner with the on-site foreman.',
  ],
  'Fire Protection': [
    '1. Verify location of incoming services.',
    '2. Sprinkler pipe, when hung form open web steel joists, must be supported at panel points.',
    '3. Check gauge and spacing of hangers.',
    '4. Check method of attaching hangers to overhead.',
    '5. Verify that sprinkler pipe has been coordinated with other trades.',
    '6. Compare type of heads with approved data, i.e., upright, semi-recessed, pendent, concealed, etc.',
    '7. Review any centering of head requirements with foreman.',
    "8. This contractor's calculations and drawings have to be reviewed by several parties. Ensure with foreman that all applicable reviews have occurred.",
    '9. Review all escutcheon requirements.',
  ],
  'Site Electrical': [
    '1. Be familiar with the electrical incoming power requirements.',
    '2. Review with the project manager that the utility service has been ordered, and that the contractor understands the service characteristics and connection point.',
    '3. Review the documentation relative to the order for the telephone service and be sure that adequate facilities are provided by the contractor to receive this service.',
    '4. Check location of poles, if required, under conduit, etc.',
    '5. Review the proposed temporary service with the electrical contractor foreman to be sure that it is adequate for the use of all trades.',
    '6. Ensure that the location of all underground conduit has been coordinated with other underground utilities. Check for conflict with other trades with excavation and check to see if utilities can be combined within a single excavation.',
    '7. Check size of conduits.',
    '8. Check size, type and insulation of cable.',
    '9. Photograph major underground installations. Coordinate with project engineer and manager.',
    '10. Be sure contractor is constantly updating the as-built drawings to show accurate dimensions for underground utility locations.',
    '11. Check if conduit is to be encased in concrete, and if reinforcing is required.',
  ],
  'Interior Electrical': [
    '1. Inspect all equipment deliveries for damage.',
    '2. Compare equipment with approved data.',
    '3. Observe the contractors handling and storage of the materials to be sure it is proper.',
    '4. Check for adequate protection of equipment which includes humidity and dust control.',
    '5. Check type and gauge of hangers.',
    '6. Check method of hanger connections to overhead.',
    '7. On major switchgear, be sure temporary heaters are wired and energized.',
    '8. Verify that the overhead work has been coordinated with other trades.',
    '9. Review the temporary electrical requirements and distribution.',
    '10. Review the height requirements of all electrical outlets and devices.',
    '11. Compare catalog number with approved shop drawings for light fixtures.',
    '12. Fixture type/appropriate for ceiling lay-in, plaster, concrete, etc.',
    '13. Check that ballasts are correct voltage and specified type.',
    '14. Confirm lamp type and catalog number (special lamps required for some ballasts for light fixtures).',
    '15. Panel sized depths in partitions. Ensure electrical foreman coordinates properly.',
    '16. Ensure that in-slab-conduit is suitable (no aluminum or EMT) expansion fittings as required - ends capped. Special conduit and fittings are required in embedded installations.',
    '17. Verify that stub-up locations are correctly placed and supported prior to pour.',
    '18. Through-slab sleeves in place for risers. Confirm with foreman that all firesafing is being coordinated.',
    '19. Equipment grounding conductors in place and correctly sized.',
    '20. Check stub-outs for connection to exterior grounding grid.',
    '21. Color identification for conduits of different building systems. Junction boxes identified.',
    '22. Wire identification markers.',
    '23. Check feeder cables for correct size and type.',
    '24. Ensure that code required clearances are maintained for electrical equipment.',
    '25. Rough-in: \n• Check contractors stub-up locations, \n• Check tie down of conduits in slabs to protect them from floating and moving, \n• Check pads against approved shop drawings, \n• Coordinate equipment locations to maintain proper door swing and working clearances, \n• Grounding system conductors placed before pour, \n• Empty conduits to be capped and protected, \n• Ensure electrical foreman provides panel schedules in a timely manner.',
  ],
  'Testing and Balancing': [
    '1. Review all balancing schedule issues with testing mechanic. Request meeting of mechanical/electrical foreman with testing personnel for proper coordination.',
    '2. Complete testing and balancing reports are required by the state agencies prior to the certificate of occupancy being issued.',
    '3. Periodically witness the testing and balancing procedures.',
    '4. Prior to testing and balancing, ceiling, doors, etc. should be in place.',
  ],
};

final Map<String, List<String>> subItems = {
  'Interior Finishes': [
    'Lath and Plaster',
    'Gypsum Drywall',
    'Ceramic Tile',
    'Quarry Tile',
    'Terrazzo',
    'Epoxy Terrazzo',
    'Acoustical Ceilings',
    'Vinyl Composition Tile',
    'Resilient Sheet Flooring',
    'Painting',
    'Carpet',
    'Wall Coverings', /* Add more sub-items */
  ],
  'Utilities and Plumbing': [
    'Elevators',
    'Piping - General',
    'Below Ground Piping',
    'Above Ground Piping',
    'Medical Gas Installation',
    'Equipment',
    'Plumbing Fixtures and Equipment',
    'Sheet Metal Ductwork',
    'Insulation',
    'Temperature Controls',
    'Fire Protection',
    'Testing and Balancing', /* Add more sub-items */
  ],
  'Site Preparation': [
    'Survey and Layout',
    'Site Clearing',
    'Site Work',
    'Demolition',
    'Blasting',
    'Piling',
    'Landscaping',
  ],
  'Concrete Work': [
    'Concrete Forming',
    'Concrete Reinforcing',
    'Cast in place Concrete',
    'Architectural Precast Concrete',
    'Structural Precast Concrete',
    'Precast Terrazzo',
  ],
  'Structural Elements': [
    'Structural Steel',
    'Open Web Steel Joists',
    'Metal Deck',
    'Miscellaneous Metal',
  ],
  'Carpentry and Millwork': ['Rough Carpentry', 'Finish Carpentry', 'Millwork'],
  'Waterproofing and Roofing': [
    'Waterproofing',
    'Membrane Roofing',
    'Single Membrane Roofing',
    'Flashing and Sheet Metal Work',
    'Roof Curbs',
    'Spray Fireproofing',
  ],
  'Doors and Windows': [
    'Hollow Metal Doors and Frames',
    'Aluminum Doors and Frames',
    'Wood Doors',
    'Hardware/Hollow Metal/Wood Doors',
    'Sliding Metal Fire Doors',
    'Overhead Doors',
    'Impact Doors',
    'Metal and Aluminum Windows',
    'Glass and Glazing',
    'Curtain Wall Systems',
    'Skylights',
    'Sealants',
  ],
  'Electrical Work': [
    'Site Electrical',
    'Interior Electrical',
  ],
  'Miscellaneous Items': [
    'Metal Siding',
    'Bituminous Paving',
    'Fire Extinguishers',
    'Toilet Accessories',
    'Kitchen Equipment',
    'Laboratory Furniture',
    'Masonry',
    'Building Insulation',
  ]
  // Add more categories and sub-items here
};

final List<String> categories = [
  'Site Preparation',
  'Concrete Work',
  'Structural Elements',
  'Carpentry and Millwork',
  'Waterproofing and Roofing',
  'Doors and Windows',
  'Interior Finishes',
  'Utilities and Plumbing',
  'Electrical Work',
  'Miscellaneous Items'
  // Add more categories here
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quality Control App',
      theme: ThemeData(colorSchemeSeed: Colors.orange
          // primarySwatch: Colors.blueGrey,
          ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> quotes = [
    'Quality is never an accident; it is always the result of high intention, sincere effort, intelligent direction and skilled execution; It represents the wise choice of many alternatives.',
    'Construction quality is the cornerstone of enduring excellence, where precision meets permanence, and every detail is a testament to craftsmanship- a legacy built to withstand the tests of time.',
    'In the realm of construction, quality is not just a measure of materials and precision; it is the silent symphony of structural integrity, attention to detail, and the unwavering commitment to building not just structures, but legacies that stand tall through the ages.',
    'Quality is the silent architect of distinction, the unwritten signature of craftsmanship that transcends mere excellence. In every endeavor, it is the timeless essence that elevates the ordinary to the extraordinary, forging a legacy that echoes in the hearts of those touched by its refined presence.',
    'Quality speaks louder than words, turning the ordinary into something extraordinary, one detail at a time.',
    'Quality is the ingredient that turns the ordinary into exceptional, making every moment, every creation, and every experience, simply outstanding.',
    'Embrace the pursuit of quality in all you do; for it is the unwavering commitment to excellence that propels dreams into reality and transforms aspirations into achievements. In the journey of life, let quality be your guiding star, lighting the path to success with each deliberate step forward.',
    'Embark on the journey of life with unwavering courage, for in every challenge, you discover the strength within. May your path be adorned with wisdom, your endeavors enriched with purpose, and your days colored with the vibrancy of your unique story. Shine on, for you are the author of your extraordinary tale.'
    // Add more quotes here
  ];

  final Random random = Random();

  String getRandomQuote() {
    return quotes[random.nextInt(quotes.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quality Management Checklist'),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
        color: Colors.black87,
        child: Center(
          child: Text(
            getRandomQuote(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Marcellus',
              color: Colors.white70,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(
        color: Colors.black87, // Set the desired background color
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black38,
              elevation: 3,
              child: ListTile(
                title: Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 22, fontFamily: 'Lato', color: Colors.white70),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ThirdPage(category: categories[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  final String category;

  ThirdPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Container(
        color: Colors.black87,
        child: ListView.builder(
          itemCount: subItems[category]?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black38,
              elevation: 4,
              child: ListTile(
                title: Text(
                  subItems[category]![index],
                  style: TextStyle(
                      fontSize: 22, fontFamily: 'Lato', color: Colors.white70),
                ),
                onTap: () {
                  // Navigate to the final page with a list of actions related to the sub-item.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FinalPage(subItem: subItems[category]![index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class CheckboxState extends ChangeNotifier {
  final Map<String, List<String>> actions;

  CheckboxState({required this.actions});

  Map<String, List<bool>> checkboxValues = {};

  void initializeValues(List<String> subItems) {
    for (var subItem in subItems) {
      checkboxValues[subItem] = List<bool>.generate(
        actions[subItem]?.length ?? 0,
        (index) => false,
      );
    }
  }
}

class FinalPage extends StatelessWidget {
  final String subItem;

  FinalPage({required this.subItem});

  @override
  Widget build(BuildContext context) {
    var checkboxState = Provider.of<CheckboxState>(context);
    // final player = AudioPlayer();

    return Scaffold(
      appBar: AppBar(
        title: Text(subItem),
      ),
      body: Container(
        color: Colors.black54, // Set the desired background color
        child: Consumer<CheckboxState>(
          builder: (context, checkboxState, _) {
            //Check if the values are already initialized for the current subItem
            if (checkboxState.checkboxValues[subItem] == null) {
// If not initialized, initialize the values for the current subItem
              checkboxState.initializeValues([subItem]);
            }
            return ListView.builder(
              itemCount: actions[subItem]?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  color:
                      Colors.grey[300], // Set the desired card background color
                  child: ListTile(
                    title: Text(
                      actions[subItem]![index],
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Lato',
                          color: Colors.black),
                    ),
                    trailing: Checkbox(
                      value: checkboxState.checkboxValues[subItem]![index],
                      onChanged: (bool? value) {
                        checkboxState.checkboxValues[subItem]![index] =
                            value ?? false;

                        // if (value != null && value) {
                        //   player.play(AssetSource('assets/note4.wav'));
                        // }
                        checkboxState.notifyListeners();
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
