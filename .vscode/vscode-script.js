(function() {
    const BLUR_ID = "command-blur";
    let workbenchObserver = null;

    function showOverlay(targetDiv) {
        if (document.getElementById(BLUR_ID)) return;

        const overlay = document.createElement("div");
        overlay.setAttribute("id", BLUR_ID);

        // PRODUCTIVITY: Clicking the blur closes the palette
        overlay.addEventListener("click", () => {
            // This simulates hitting Escape to close the palette
            const escEvent = new KeyboardEvent('keydown', { key: 'Escape', keyCode: 27, bubbles: true });
            document.dispatchEvent(escEvent);
            overlay.remove();
        });

        targetDiv.appendChild(overlay);
    }

    function hideOverlay() {
        const overlay = document.getElementById(BLUR_ID);
        if (overlay) overlay.remove();
    }

    function init() {
        const workbench = document.querySelector(".monaco-workbench");
        if (!workbench) {
            setTimeout(init, 500);
            return;
        }

        // PERFORMANCE: Use MutationObserver to watch for the Palette appearing
        workbenchObserver = new MutationObserver((mutations) => {
            const palette = document.querySelector(".quick-input-widget");

            // If palette exists and is not hidden
            if (palette && palette.style.display !== "none") {
                showOverlay(workbench);
            } else {
                hideOverlay();
            }
        });

        // FIXED: subtree: true is necessary because VS Code nests the palette deeply
        workbenchObserver.observe(workbench, {
            childList: true,
            subtree: true,
            attributes: true,
            attributeFilter: ['style']
        });
    }

    // Start initialization
    if (document.readyState === "complete" || document.readyState === "interactive") {
        init();
    } else {
        document.addEventListener("DOMContentLoaded", init);
    }
})();
