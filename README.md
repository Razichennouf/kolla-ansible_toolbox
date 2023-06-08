# kolla-ansible_toolbox
<h1 style="color: #0366d6;">Docker Cleanup Script for Kolla-Ansible Deployment</h1>

<h2 style="color: #0366d6;">Description</h2>

<p>
    This script provides a convenient way to clean up Docker containers, images, volumes, and temporary files in a Kolla-Ansible deployment. It helps to ensure a clean and efficient Docker environment by removing unused resources and temporary files.
</p>

<h2 style="color: #0366d6;">Features</h2>

<ul>
    <li>
        <strong>Stopping and removing containers:</strong> The script checks for running containers and stops them gracefully before removing them using the <code>docker stop</code> and <code>docker rm</code> commands. This prevents any potential issues with active containers during cleanup.
    </li>
    <li>
        <strong>Removing images:</strong> It checks for available Docker images and removes them using the <code>docker rmi</code> command. This helps to free up disk space by removing unused or outdated images.
    </li>
    <li>
        <strong>Removing volumes:</strong> The script checks for existing Docker volumes and removes them using the <code>docker volume rm</code> command. This ensures that any leftover volumes from previous deployments are properly cleaned up.
    </li>
    <li>
        <strong>Cleaning directories:</strong> It removes the contents of directories under <code>/var/lib/docker</code>, which might contain temporary files or artifacts from previous Docker operations.
    </li>
    <li>
        <strong>Handling no resources to remove:</strong> The script includes checks for the presence of containers, images, and volumes. If there are no resources to remove, it displays a message indicating that there are no containers, images, or volumes to remove.
    </li>
    <li>
        <strong>Removing temporary files:</strong> It cleans up temporary files in the <code>/tmp</code> directory, ensuring a clean environment for subsequent operations.
    </li>
</ul>

<h2 style="color: #0366d6;">Usage</h2>

<p>
    This script is useful in a Kolla-Ansible deployment when you want to perform routine cleanup of Docker resources. It helps to keep the Docker environment clean, minimize disk usage, and prevent any conflicts or issues that may arise from leftover containers, images, or volumes.
</p>

<p>
    By running this script before deploying or redeploying Kolla-Ansible, you can ensure a fresh and optimized Docker environment for your deployment. It provides a convenient and automated way to clean up Docker resources, eliminating the need for manual cleanup and reducing the risk of resource conflicts or inconsistencies.
</p>
