/*
 * main.h
 *
 *  Created on: Oct 19, 2021
 *      Author: crdar
 */

#ifndef MAIN_H_
#define MAIN_H_

#define CLOCK 					0x16000000U
#define SYSTICK_FREQ			0x1000U

#define SRAM_MEMORY_START 		0x20000000U
#define SRAM_MEMORY_SIZE 		((1024)*(96))
#define SRAM_MEMORY_END 		SRAM_MEMORY_START+SRAM_MEMORY_SIZE

#define TASK_STACK_SIZE 		1024U
#define SCHEDULER_STACK_SIZE 	1024U

#define START_STACK_IDLE		SRAM_MEMORY_END
#define START_STACK_TASK1 		((SRAM_MEMORY_END) - (1 * (TASK_STACK_SIZE)))
#define START_STACK_TASK2 		((SRAM_MEMORY_END) - (2 * (TASK_STACK_SIZE)))
#define START_STACK_TASK3 		((SRAM_MEMORY_END) - (3 * (TASK_STACK_SIZE)))
#define START_STACK_TASK4 		((SRAM_MEMORY_END) - (4 * (TASK_STACK_SIZE)))

#define START_STACK_SCHEDULER 	((SRAM_MEMORY_END) - (5 * (TASK_STACK_SIZE)))

#define NO_TASKS 				5

#define TASK_READY_STATE		0xFF
#define TASK_BLOCK_STATE		0x00

typedef struct{
	uint32_t p_psp_task_pointer;
	void (*p_task_handler) (void);
	uint32_t task_local_tick_count;
	uint8_t task_state;
}task_t;

void enable_handlers(void);

void Task_Idle(void);
void Task_1_Handler(void);
void Task_2_Handler(void);
void Task_3_Handler(void);
void Task_4_Handler(void);

void Init_SysTick_Timer(void);
__attribute__ ((naked))void init_scheduler_stack(uint32_t);
void init_tasks_psp(void);
void init_tasks(void);
__attribute__ ((naked))void change_sp_to_psp(void);
void switch_task(void);
void task_delay(task_t *, uint32_t);



#endif /* MAIN_H_ */
