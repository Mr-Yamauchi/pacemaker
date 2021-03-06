/*
 * Copyright 2004-2019 the Pacemaker project contributors
 *
 * The version control history for this file may have further details.
 *
 * This source code is licensed under the GNU Lesser General Public License
 * version 2.1 or later (LGPLv2.1+) WITHOUT ANY WARRANTY.
 */

#ifndef PENGINE_AUTILS__H
#  define PENGINE_AUTILS__H

/* Constraint helper functions */
extern rsc_colocation_t *invert_constraint(rsc_colocation_t * constraint);

pe__location_t *copy_constraint(pe__location_t *constraint);

pe__location_t *rsc2node_new(const char *id, pe_resource_t *rsc, int weight,
                             const char *discovery_mode, pe_node_t *node,
                             pe_working_set_t *data_set);

extern gboolean rsc_colocation_new(const char *id, const char *node_attr, int score,
                                   resource_t * rsc_lh, resource_t * rsc_rh,
                                   const char *state_lh, const char *state_rh,
                                   pe_working_set_t * data_set);

extern gboolean rsc_ticket_new(const char *id, resource_t * rsc_lh, ticket_t * ticket,
                               const char *state_lh, const char *loss_policy,
                               pe_working_set_t * data_set);

GList *sort_nodes_by_weight(GList *nodes, pe_node_t *active_node,
                            pe_working_set_t *data_set);

extern gboolean can_run_resources(const node_t * node);
extern gboolean native_assign_node(resource_t * rsc, GListPtr candidates, node_t * chosen,
                                   gboolean force);
void native_deallocate(resource_t * rsc);

extern void log_action(unsigned int log_level, const char *pre_text,
                       action_t * action, gboolean details);

gboolean can_run_any(GHashTable * nodes);
pe_resource_t *find_compatible_child(pe_resource_t *local_child,
                                     pe_resource_t *rsc, enum rsc_role_e filter,
                                     gboolean current,
                                     pe_working_set_t *data_set);
resource_t *find_compatible_child_by_node(resource_t * local_child, node_t * local_node, resource_t * rsc,
                                          enum rsc_role_e filter, gboolean current);
gboolean is_child_compatible(resource_t *child_rsc, node_t * local_node, enum rsc_role_e filter, gboolean current);
bool assign_node(resource_t * rsc, node_t * node, gboolean force);
enum pe_action_flags summary_action_flags(action_t * action, GListPtr children, node_t * node);
enum action_tasks clone_child_action(action_t * action);
int copies_per_node(resource_t * rsc);

enum filter_colocation_res {
    influence_nothing = 0,
    influence_rsc_location,
    influence_rsc_priority,
};

extern enum filter_colocation_res
filter_colocation_constraint(resource_t * rsc_lh, resource_t * rsc_rh,
                             rsc_colocation_t * constraint, gboolean preview);

extern int compare_capacity(const node_t * node1, const node_t * node2);
extern void calculate_utilization(GHashTable * current_utilization,
                                  GHashTable * utilization, gboolean plus);

extern void process_utilization(resource_t * rsc, node_t ** prefer, pe_working_set_t * data_set);
pe_action_t *create_pseudo_resource_op(resource_t * rsc, const char *task, bool optional, bool runnable, pe_working_set_t *data_set);
pe_action_t *pe_cancel_op(pe_resource_t *rsc, const char *name,
                          guint interval_ms, pe_node_t *node,
                          pe_working_set_t *data_set);
pe_action_t *sched_shutdown_op(pe_node_t *node, pe_working_set_t *data_set);

#  define LOAD_STOPPED "load_stopped"

#endif
