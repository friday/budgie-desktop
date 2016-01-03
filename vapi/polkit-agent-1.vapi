/* polkit-agent-1.vapi generated by vapigen, do not modify. */
                                    
[CCode (cprefix = "PolkitAgent", gir_namespace = "PolkitAgent", gir_version = "1.0", lower_case_cprefix = "polkit_agent_")]
namespace PolkitAgent {
	[CCode (cheader_filename = "polkitagent/polkitagent.h", type_id = "polkit_agent_listener_get_type ()")]
	public abstract class Listener : GLib.Object {
		[CCode (has_construct_function = false)]
		protected Listener ();
        public virtual async bool initiate_authentication(string action_id, string message, string icon_name, Polkit.Details details, string cookie, GLib.List<Polkit.Identity?>? identities, GLib.Cancellable cancellable);
        /*
        public virtual void initiate_authentication(string action_id, string message, string icon_name, Polkit.Details details, string cookie, GLib.List<Polkit.Identity?>? identities, GLib.Cancellable cancellable, GLib.AsyncReadyCallback @callback);
		public virtual bool initiate_authentication_finish (GLib.AsyncResult res) throws GLib.Error;*/
		public void* register (PolkitAgent.RegisterFlags flags, Polkit.Subject subject, string? object_path, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public void* register_with_options (PolkitAgent.RegisterFlags flags, Polkit.Subject subject, string object_path, GLib.Variant? options, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public static void unregister (void* registration_handle);
	}
	[CCode (cheader_filename = "polkitagent/polkitagent.h", type_id = "polkit_agent_session_get_type ()")]
	public class Session : GLib.Object {
		[CCode (has_construct_function = false)]
		public Session (Polkit.Identity identity, string cookie);
		public void cancel ();
		public void initiate ();
		public void response (string response);
		[NoAccessorMethod]
		public string cookie { owned get; construct; }
		[NoAccessorMethod]
		public Polkit.Identity identity { owned get; construct; }
		public signal void completed (bool gained_authorization);
		public signal void request (string request, bool echo_on);
		public signal void show_error (string text);
		public signal void show_info (string text);
	}
	[CCode (cheader_filename = "polkitagent/polkitagent.h", type_id = "polkit_agent_text_listener_get_type ()")]
	public class TextListener : PolkitAgent.Listener, GLib.Initable {
		[CCode (has_construct_function = false, type = "PolkitAgentListener*")]
		public TextListener (GLib.Cancellable? cancellable = null) throws GLib.Error;
	}
	[CCode (cheader_filename = "polkitagent/polkitagent.h", cprefix = "POLKIT_AGENT_REGISTER_FLAGS_", type_id = "polkit_agent_register_flags_get_type ()")]
	[Flags]
	public enum RegisterFlags {
		NONE,
		RUN_IN_THREAD
	}
	[CCode (cheader_filename = "polkitagent/polkitagent.h")]
	public static bool register_listener (PolkitAgent.Listener listener, Polkit.Subject subject, string object_path) throws GLib.Error;
}
