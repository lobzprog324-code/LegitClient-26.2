package dev.lobzik.legitclient;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public final class ModuleManager {
    private final Map<String, ClientModule> modules = new LinkedHashMap<>();

    public ModuleManager() {
        add("hud", "HUD", true);
        add("fps", "FPS counter", true);
        add("coordinates", "Coordinates", true);
        add("keystrokes", "Keystrokes (planned)", false);
        add("notifications", "Notifications (planned)", false);
    }
    private void add(String id, String title, boolean enabled) {
        modules.put(id, new ClientModule(id, title, enabled));
    }
    public Collection<ClientModule> all() { return modules.values(); }
    public ClientModule get(String id) { return modules.get(id); }
    public boolean isEnabled(String id) {
        ClientModule module = modules.get(id);
        return module != null && module.enabled();
    }
    public void toggle(String id) {
        ClientModule module = modules.get(id);
        if (module != null) module.toggle();
    }
}
