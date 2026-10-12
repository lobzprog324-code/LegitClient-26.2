package dev.lobzik.legitclient;

public final class ClientModule {
    private final String id;
    private final String title;
    private boolean enabled;

    public ClientModule(String id, String title, boolean enabled) {
        this.id = id;
        this.title = title;
        this.enabled = enabled;
    }
    public String id() { return id; }
    public String title() { return title; }
    public boolean enabled() { return enabled; }
    public void setEnabled(boolean enabled) { this.enabled = enabled; }
    public void toggle() { enabled = !enabled; }
}
