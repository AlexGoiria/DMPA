#!/bin/bash
#SBATCH --job-name=memory_test
#SBATCH --output=/data/memory_test_%j.out
#SBATCH --ntasks=1
#SBATCH --mem=1000M
#SBATCH --time=00:02:00

# Memory allocation test
echo "Memory test job starting on $(hostname)"
echo "Job ID: $SLURM_JOB_ID"
echo "Requested memory: 1000M"

# Show available memory
free -h

# Allocate some memory (800MB array)
echo "Allocating memory..."
python3 -c "
import time
# Allocate approximately 800MB
data = bytearray(800 * 1024 * 1024)
print('Allocated 800MB of memory')
time.sleep(5)
print('Memory released')
"

echo "Memory test completed"