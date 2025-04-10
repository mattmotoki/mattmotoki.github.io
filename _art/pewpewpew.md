---
title: "Pew Pew Pew"
image: "/assets/files/pewpewpew.html"
display_image: "/assets/files/pewpewpew.html"
tagline: "Neon lines shooting through the void"
priority: 6
description: ""
---


## Technical Implementation

The animation uses an HTML5 canvas to track particles that appear, fade, and bounce off the walls. The particles leave trails that fade and glow.




```js
const canvas = document.getElementById('screensaver');
const ctx = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

// Reference size for velocity scaling
const referenceWidth = 1000;
const referenceHeight = 600;

ctx.fillStyle = 'black';
ctx.fillRect(0, 0, canvas.width, canvas.height);

const streaks = [];

// Base directions with variety
const baseDirections = [
    [1, 0], [0, 1], [-1, 0], [0, -1],
    [0.7, 0.7], [0.7, -0.7], [-0.7, 0.7], [-0.7, -0.7],
    [0.9, 0.4], [0.4, 0.9], [-0.9, 0.4], [0.4, -0.9],
    [0.95, 0.3], [0.3, 0.95], [-0.8, 0.6], [0.6, -0.8],
    [0.5, 0.86], [0.86, 0.5], [-0.5, 0.86], [0.86, -0.5]
];

function getRandomDirection() {
    if (Math.random() < 0.7) {
        // Use a base direction with some random variation
        const base = baseDirections[Math.floor(Math.random() * baseDirections.length)];
        const variation = 0.2;
        let dx = base[0] + (Math.random() * 2 - 1) * variation;
        let dy = base[1] + (Math.random() * 2 - 1) * variation;
        
        // Normalize the direction vector
        const magnitude = Math.sqrt(dx * dx + dy * dy);
        return [dx / magnitude, dy / magnitude];
    } else {
        // Use a completely random direction
        const angle = Math.random() * Math.PI * 2;
        return [Math.cos(angle), Math.sin(angle)];
    }
}

// Scale velocity based on container size
function getSpeedScaleFactor() {
    const currentDiagonal = Math.sqrt(canvas.width * canvas.width + canvas.height * canvas.height);
    const referenceDiagonal = Math.sqrt(referenceWidth * referenceWidth + referenceHeight * referenceHeight);
    return currentDiagonal / referenceDiagonal;
}

for (let i = 0; i < 15; i++) {
    createStreak();
}

function createStreak() {
    const colors = ['#00FFFF', '#FF00FF', '#00FF00', '#FF3366', '#3366FF', '#FFFF00', '#FF6600'];
    
    const baseSpeed = (1 + Math.random() * 4) * 5;
    const speedScale = getSpeedScaleFactor();
    const adjustedSpeed = baseSpeed * speedScale;
    
    const direction = getRandomDirection();
    const vx = direction[0] * adjustedSpeed;
    const vy = direction[1] * adjustedSpeed;
    
    // Scale particle width based on container size
    const baseWidth = 1 + Math.random() * 5;
    const widthScale = getSpeedScaleFactor();
    const adjustedWidth = baseWidth * widthScale;
    
    streaks.push({
        x: Math.random() * canvas.width,
        y: Math.random() * canvas.height,
        width: adjustedWidth,
        vx: vx,
        vy: vy,
        color: colors[Math.floor(Math.random() * colors.length)],
        trail: [],
        maxTrail: 150 + Math.floor(Math.random() * 100),
        z: Math.random() * 5 + 1,            // Z-depth for 3D effect
        vz: (Math.random() - 0.5) * 0.2,     // Z velocity
        glowIntensity: 5 + Math.random() * 25
    });
}

function animate() {
    // Apply semi-transparent black for trail fade effect
    ctx.fillStyle = 'rgba(0, 0, 0, 0.02)';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    streaks.forEach((streak, index) => {
        // Update positions
        streak.x += streak.vx;
        streak.y += streak.vy;
        streak.z += streak.vz;
        
        // Keep Z in visible range
        if (streak.z < 0.5 || streak.z > 8) {
            streak.vz *= -1;
        }
        
        // Adjust glow intensity
        streak.glowIntensity = Math.max(5, Math.min(30, streak.glowIntensity + (Math.random() - 0.48) * 0.8));
        
        // Add current position to trail
        streak.trail.push({ x: streak.x, y: streak.y });
        
        if (streak.trail.length > streak.maxTrail) {
            streak.trail.shift();
        }
        
        // Draw trail
        if (streak.trail.length > 1) {
            ctx.beginPath();
            ctx.moveTo(streak.trail[0].x, streak.trail[0].y);
            
            for (let i = 1; i < streak.trail.length; i++) {
                ctx.lineTo(streak.trail[i].x, streak.trail[i].y);
            }
            
            // Apply 3D effect with depth scaling
            const depthScale = 3 / (streak.z + 0.5);
            
            ctx.strokeStyle = streak.color;
            ctx.lineWidth = streak.width * depthScale;
            ctx.lineCap = 'round';
            ctx.lineJoin = 'round';
            
            // Glow effect
            ctx.shadowBlur = streak.glowIntensity * depthScale;
            ctx.shadowColor = streak.color;
            
            ctx.globalAlpha = Math.min(1, 0.4 + (3 / streak.z));
            
            ctx.stroke();
            ctx.shadowBlur = 0;
            ctx.globalAlpha = 1.0;
        }
        
        // Handle boundary collisions
        if (streak.x < 0 || streak.x > canvas.width) {
            streak.vx *= -1;
            streak.trail = [];
            
            // Occasionally change direction on bounce
            if (Math.random() < 0.3) {
                const newDirection = getRandomDirection();
                const magnitude = Math.sqrt(streak.vx * streak.vx + streak.vy * streak.vy);
                streak.vx = newDirection[0] * magnitude;
                streak.vy = newDirection[1] * magnitude;
            }
        }
        if (streak.y < 0 || streak.y > canvas.height) {
            streak.vy *= -1;
            streak.trail = [];
            
            // Occasionally change direction on bounce
            if (Math.random() < 0.3) {
                const newDirection = getRandomDirection();
                const magnitude = Math.sqrt(streak.vx * streak.vx + streak.vy * streak.vy);
                streak.vx = newDirection[0] * magnitude;
                streak.vy = newDirection[1] * magnitude;
            }
        }
        
        // Periodic changes to add variety
        if (Math.random() < 0.01) {
            streak.vz = (Math.random() - 0.5) * 0.3;
        }
        
        if (Math.random() < 0.003 && streaks.length < 25) {
            createStreak();
        }
        
        if (Math.random() < 0.001 && streaks.length > 10) {
            streaks.splice(index, 1);
        }
    });
    
    requestAnimationFrame(animate);
}

animate();

// Handle window resize
const handleResize = () => {
    const existingStreaks = [...streaks];
    
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    ctx.fillStyle = 'black';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    streaks.length = 0;
    
    const speedScale = getSpeedScaleFactor();
    const widthScale = speedScale;
    
    // Rescale existing streaks for the new container size
    existingStreaks.forEach(streak => {
        const originalMagnitude = Math.sqrt(streak.vx * streak.vx + streak.vy * streak.vy);
        
        const dx = streak.vx / originalMagnitude;
        const dy = streak.vy / originalMagnitude;
        
        const newMagnitude = originalMagnitude * speedScale;
        const originalWidth = streak.width / widthScale;
        const newWidth = originalWidth * widthScale;
        
        streaks.push({
            ...streak,
            x: streak.x % canvas.width,
            y: streak.y % canvas.height,
            vx: dx * newMagnitude,
            vy: dy * newMagnitude,
            width: newWidth,
            trail: []
        });
    });
    
    // Maintain minimum streak count
    while (streaks.length < 15) {
        createStreak();
    }
};
```
