//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class add_environment  extends uvmf_environment_base #(
    .CONFIG_T( add_env_configuration 
  ));
  `uvm_component_utils( add_environment )



  uvm_analysis_port #(add_in_transaction) add_input_ap;
  uvm_analysis_port #(add_out_transaction) add_output_ap;


  typedef add_in_agent  add_input_t;
  add_input_t add_input;

  typedef add_out_agent  add_output_t;
  add_output_t add_output;




  typedef add_pre #(
                .CONFIG_T(CONFIG_T)
                ) add_p_t;
  add_p_t add_p;
  typedef add_sb #(
                .CONFIG_T(CONFIG_T)
                ) add_s_t;
  add_s_t add_s;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(add_env_configuration)) add_vsqr_t;
  add_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
 
// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    add_input_ap = new("add_input_ap",this);
    add_output_ap = new("add_output_ap",this);
    add_input = add_input_t::type_id::create("add_input",this);
    add_input.set_config(configuration.add_input_config);
    add_output = add_output_t::type_id::create("add_output",this);
    add_output.set_config(configuration.add_output_config);
    add_p = add_p_t::type_id::create("add_p",this);
    add_p.configuration = configuration;
    add_s = add_s_t::type_id::create("add_s",this);
    add_s.configuration = configuration;

    vsqr = add_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    add_input.monitored_ap.connect(add_p.add_in_ae);
    add_p.add_sb_ap.connect(add_s.sb_from_pre_ae);
    add_output.monitored_ap.connect(add_s.add_out_ae);
    add_input.monitored_ap.connect(add_input_ap);
    add_output.monitored_ap.connect(add_output_ap);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.add_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

