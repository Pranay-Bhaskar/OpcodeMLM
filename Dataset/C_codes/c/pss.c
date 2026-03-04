#include <stdio.h>
#include <stdlib.h>

#define MAX 20

typedef struct {
    int pid;
    int burst;
    int arrival;
    int priority;
    int waiting;
    int turnaround;
    int remaining;
} Process;

Process procs[MAX];
int n;

// Input processes
void input() {
    printf("Enter number of processes: ");
    scanf("%d",&n);
    for(int i=0;i<n;i++) {
        procs[i].pid=i+1;
        printf("Process %d burst time: ",i+1);
        scanf("%d",&procs[i].burst);
        printf("Process %d arrival time: ",i+1);
        scanf("%d",&procs[i].arrival);
        printf("Process %d priority: ",i+1);
        scanf("%d",&procs[i].priority);
        procs[i].remaining=procs[i].burst;
    }
}

// FCFS Scheduling
void fcfs() {
    int time=0;
    printf("\n--- FCFS Scheduling ---\n");
    for(int i=0;i<n;i++) {
        if(time<procs[i].arrival) time=procs[i].arrival;
        procs[i].waiting=time-procs[i].arrival;
        time+=procs[i].burst;
        procs[i].turnaround=procs[i].waiting+procs[i].burst;
    }
    printf("PID\tWT\tTAT\n");
    for(int i=0;i<n;i++) printf("%d\t%d\t%d\n",procs[i].pid,procs[i].waiting,procs[i].turnaround);
}

// Priority Scheduling
void priority_sched() {
    int done=0,time=0;
    printf("\n--- Priority Scheduling ---\n");
    while(done<n) {
        int idx=-1;
        for(int i=0;i<n;i++) {
            if(procs[i].remaining>0 && procs[i].arrival<=time) {
                if(idx==-1 || procs[i].priority<procs[idx].priority) idx=i;
            }
        }
        if(idx==-1) { time++; continue; }
        procs[idx].waiting=time-procs[idx].arrival;
        time+=procs[idx].burst;
        procs[idx].turnaround=procs[idx].waiting+procs[idx].burst;
        procs[idx].remaining=0;
        done++;
    }
    printf("PID\tWT\tTAT\n");
    for(int i=0;i<n;i++) printf("%d\t%d\t%d\n",procs[i].pid,procs[i].waiting,procs[i].turnaround);
}

// Round Robin Scheduling
void round_robin(int quantum) {
    int time=0,done=0;
    for(int i=0;i<n;i++) procs[i].remaining=procs[i].burst;
    printf("\n--- Round Robin (q=%d) ---\n",quantum);
    while(done<n) {
        int flag=0;
        for(int i=0;i<n;i++) {
            if(procs[i].remaining>0 && procs[i].arrival<=time) {
                flag=1;
                if(procs[i].remaining>quantum) {
                    time+=quantum;
                    procs[i].remaining-=quantum;
                } else {
                    time+=procs[i].remaining;
                    procs[i].waiting=time-procs[i].arrival-procs[i].burst;
                    procs[i].turnaround=procs[i].waiting+procs[i].burst;
                    procs[i].remaining=0;
                    done++;
                }
            }
        }
        if(!flag) time++;
    }
    printf("PID\tWT\tTAT\n");
    for(int i=0;i<n;i++) printf("%d\t%d\t%d\n",procs[i].pid,procs[i].waiting,procs[i].turnaround);
}

int main() {
    input();
    fcfs();
    priority_sched();
    round_robin(2);
    return 0;
}