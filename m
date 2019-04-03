Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([63.128.21.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBhBl-0003yI-0N
 for ath11k@lists.infradead.org; Wed, 03 Apr 2019 14:48:31 +0000
Received: by mail-pg1-f198.google.com with SMTP id x2so9319377pge.16
 for <ath11k@lists.infradead.org>; Wed, 03 Apr 2019 07:48:24 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: ath11k: Meshpoint interfaces with fw 0x30804a5
Date: Wed, 03 Apr 2019 16:47:58 +0200
Message-ID: <2316812.VCKJvWO5mf@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4144168379828805117=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Simon Wunderlich <swunderlich@datto.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>

--===============4144168379828805117==
Content-Type: multipart/signed; boundary="nextPart2320249.TaoVLJRsoN"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2320249.TaoVLJRsoN
Content-Type: multipart/mixed; boundary="nextPart4277361.24nD7heDEj"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart4277361.24nD7heDEj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I just wanted to try out meshpoint interfaces with firmware 0x30804a5. The 
change seemed to be a straight forward port from ath10k. But it turned out 
that the firmware seems to behave significantly different. I saw three 
unexpected things:

0. firmware dies immediately when using subtype 6 (MESH_11S) during vdev
   create

    [   28.663988] Fatal error received from wcss software!:
    [   28.663988] QC Image Version: QC_IMAGE_VERSION_STRING=WLAN.HK.1.1-01967-QCAHKSWPL_SILICONZ-1
    [   28.663988] Image Variant : IMAGE_VARIANT_STRING=8074.wlanfw.evalQ
    [   28.663988]
    [   28.663988] ar_wal_peer.c:7223 Assertion !WAL_IS_TID_QOS_DATA(tidno) failedparam0 :zero, param1 :zero, param2 :zero.
    [   28.663988] Thread ID      : 0x00000069  Thread name    : WLAN RT0  Process ID     : 0
    [   28.663988] Register:
    [   28.663988] SP : 0x4c5a1510
    [   28.663988] FP : 0x4c5a1518
    [   28.663988] PC : 0x4b0ba260
    [   28.663988] SSR : 0x00000008
    [   28.663988] BADVA : 0x00020000
    [   28.663988] LR : 0x4b0b9678
    [   28.663988]
    [   28.663988] Stack Dump
    [   28.663988] from : 0x4c5a1510
    [   28.663988] to   : 0x4c5a1df8
    [   28.663988]
    [   28.710734] subsys-restart: subsystem_restart_dev(): Restart sequence requested for q6v5-wcss, restart_level = RELATED.
    [   28.733017] subsys-restart: subsystem_shutdown(): [kworker/3:1:125]: Shutting down q6v5-m3
    [   28.743654]  remoteproc0: stopped remote processor q6v5-m3
    [   28.752024] subsys-restart: subsystem_shutdown(): [kworker/3:1:125]: Shutting down q6v5-wcss
    [   28.783038]  remoteproc1: stopped remote processor q6v5-wcss
    [   28.783252] glink_core_link_down glink is down
    [   28.787759] <SSR>: glink SUBSYS_AFTER_SHUTDOWN cleanup done
    [   28.842155] glink_xprt_close_event
    [   30.532142] br-lan: port 2(wlan0-1) entered forwarding state
    [   31.582164] ath11k c000000.wifi: failed to vdev 1 create peer for AP: -110
    [   33.802144] open time Out: Q6 crash dump collection failed
    [   33.802370] subsys-restart: subsystem_ramdump(): q6v5-wcss[kworker/3:1:125]: Ramdump failed.
    [   33.806617] <SSR>: glink SUBSYS_BEFOER_POWERUP reinit done
    [   33.815142] ------------[ cut here ]------------
    [   33.820394] kernel BUG at backports-next-ath11k-20190402/drivers/net/wireless/ath/ath11k/ahb.c:997!
    [   33.825179] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP

1. WMI commands just timeout (and system is rebooted automatically after a 
   while) when the meshpoint interface (with subtype 5 during vdev create)
   is the only existing interface

    [  514.378873] ath11k c000000.wifi: Unknown eventid: 0x3e001
    [  514.378934] ath11k c000000.wifi: Unknown eventid: 0x3e001
    [  514.383259] ath11k c000000.wifi: Unknown eventid: 0x3e001
    [  514.390426] ath11k c000000.wifi: Set slottime: 1 for VDEV: 0
    [  514.394045] ath11k c000000.wifi: Set preamble: 1 for VDEV: 0
    [  514.400778] IPv6: ADDRCONF(NETDEV_UP): mesh0: link is not ready
    [  514.767922] ath11k c000000.wifi: Beacon interval: 100 set for VDEV: 0
    [  514.768002] ath11k c000000.wifi: Set staggered beacon mode for VDEV: 0
    [  514.774225] IPv6: ADDRCONF(NETDEV_CHANGE): mesh0: link becomes ready
    [  514.780195] ath11k c000000.wifi: Added peer: ac:86:74:61:6c:30 for VDEV: 0
    [  514.787351] ath11k c000000.wifi: Station ac:86:74:61:6c:30 moved to assoc state
    [  514.793344] ath11k c000000.wifi: Set staggered beacon mode for VDEV: 0
    [  517.792161] ath11k c000000.wifi: wmi command 16387 timeout
    [  517.792184] ath11k c000000.wifi: failed to send WMI_PDEV_SET_PARAM cmd
    [  517.796530] ath11k c000000.wifi: Failed to set beacon mode for VDEV: 0
    [  520.802153] ath11k c000000.wifi: wmi command 28675 timeout
    [  520.802175] ath11k c000000.wifi: failed to send WMI_BCN_TMPL_CMDID
    ....
    [  531.830735] Fatal error received from wcss software!:
    [  531.830735] QC Image Version: QC_IMAGE_VERSION_STRING=WLAN.HK.1.1-01967-QCAHKSWPL_SILICONZ-1
    [  531.830735] Image Variant : IMAGE_VARIANT_STRING=8074.wlanfw.evalQ
    [  531.830735]
    [  531.830735] dog_hb.c:209 DOG_HB detects starvation of task "WLAN RT0", triage with its owner(d.dump 0x4b554b50)

2. if I enable an AP device then I see HWMP path discovery Action frames for
   each outgoing packet. So it looks to me like the response is not coming
   in correctly (which is the answer from the remote device)

The device is able to receive packets (broadcast/unicast) from two OM5P-ACv2
when I enable an AP (02:03:7f:12:8b:67) at the same time (see option 2.) as
the meshpoint interface (00:03:7f:12:8b:67). But sending out is not working 
at all (no packets in the air but visible in a monitor dump of the ath11k).
Also not when fixing the path (so no action frames for path discovery are
required anymore).

1. Where is is the requirement coming from the firmware to have an AP running 
   at the same time and how to avoid that?
2. How can I tell the firmware that it should forward the path reply action
   frame for the path discovery up to us. I can see this frame on a third
   (capture) device but not when capturing using a monitor interface on the
   ath11k device.

   * The only action frames I can see are the ones we sent (so which the
     Linux wifi layer gave back to the monitor interface). All other management
     frames (send from some remote device) seem to be missing. This became
     especially obvious when I wanted to check for beacons on the monitor
     interface.

3. Why does the firmware filter my outgoing unicast/broadcast frames for
   meshpoint interfaces? (btw. AP is also not working here for me - might be
   related)

   * I can see them in the monitor dump but not in the air

Just for reference: The meshpoint interfaces were created using following 
/etc/config/wireless OpenWrt-config:

    config wifi-iface 'wmesh'
        option device 'radio0'
        option ifname 'mesh0'
        option network 'bat0_hardif_mesh0'
        option mode 'mesh'
        option mesh_id 'mesh'
        option mesh_fwding '0'
        option mesh_ttl '1'
        option 'mcast_rate' '24000'

Kind regards,
	Sven
--nextPart4277361.24nD7heDEj
Content-Disposition: attachment; filename="0001-ath11k-Enable-meshpoint-mode.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-ath11k-Enable-meshpoint-mode.patch"

From 2ad92425c1676f80929f1e2000159dea28d98419 Mon Sep 17 00:00:00 2001
From: Sven Eckelmann <seckelmann@datto.com>
Date: Fri, 29 Mar 2019 12:38:52 +0100
Subject: [PATCH] ath11k: Enable meshpoint interfaces

Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 23 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h |  1 +
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ad75269174dc..305b7ffb8cee 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1640,6 +1640,13 @@ static void ath11k_bss_info_changed(struct ieee80211_hw *hw,
 		if (ret)
 			ath11k_warn(ar->ab, "failed to update bcn template: %d\n",
 				    ret);
+
+		if (ieee80211_vif_is_mesh(vif)) {
+			/* mesh doesn't use SSID but firmware needs it */
+			strncpy(arvif->u.ap.ssid, "mesh",
+				sizeof(arvif->u.ap.ssid));
+			arvif->u.ap.ssid_len = 4;
+		}
 	}
 
 	if (changed & BSS_CHANGED_AP_PROBE_RESP) {
@@ -2150,7 +2157,8 @@ static int ath11k_install_peer_wep_keys(struct ath11k_vif *arvif,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	if (WARN_ON(arvif->vif->type != NL80211_IFTYPE_AP))
+	if (WARN_ON(arvif->vif->type != NL80211_IFTYPE_AP &&
+		    arvif->vif->type != NL80211_IFTYPE_MESH_POINT))
 		return -EINVAL;
 
 	spin_lock_bh(&ar->data_lock);
@@ -2744,6 +2752,7 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
 		ret = ath11k_station_assoc(ar, vif, sta, false);
 		if (ret)
@@ -2756,6 +2765,7 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		   new_state == IEEE80211_STA_AUTH &&
 		   (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_MESH_POINT ||
 		    vif->type == NL80211_IFTYPE_ADHOC)) {
 		ret = ath11k_station_disassoc(ar, vif, sta);
 		if (ret)
@@ -3590,6 +3600,10 @@ static int ath11k_add_interface(struct ieee80211_hw *hw,
 	case NL80211_IFTYPE_STATION:
 		arvif->vdev_type = WMI_VDEV_TYPE_STA;
 		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		arvif->vdev_type = WMI_VDEV_TYPE_AP;
+		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
+		break;
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
 		break;
@@ -4841,6 +4855,9 @@ static const struct ieee80211_iface_limit ath11k_if_limits[] = {
 	{
 		.max    = 16,
 		.types  = BIT(NL80211_IFTYPE_AP)
+#ifdef CPTCFG_MAC80211_MESH
+			| BIT(NL80211_IFTYPE_MESH_POINT)
+#endif
 	},
 };
 
@@ -4957,6 +4974,10 @@ static int ath11k_mac_register(struct ath11k *ar)
 	ar->hw->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					 BIT(NL80211_IFTYPE_AP);
 
+	if (test_bit(WMI_SERVICE_MESH_11S, ar->ab->wmi_sc.svc_map))
+		ar->hw->wiphy->interface_modes |=
+			BIT(NL80211_IFTYPE_MESH_POINT);
+
 	ieee80211_hw_set(ar->hw, SIGNAL_DBM);
 	ieee80211_hw_set(ar->hw, SUPPORTS_PS);
 	ieee80211_hw_set(ar->hw, SUPPORTS_DYNAMIC_PS);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 55634b1d5ec2..dba42a3cf9ea 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4713,6 +4713,7 @@ enum wmi_vdev_subtype {
 	WMI_VDEV_SUBTYPE_P2P_DEVICE = 1,
 	WMI_VDEV_SUBTYPE_P2P_CLIENT = 2,
 	WMI_VDEV_SUBTYPE_P2P_GO     = 3,
+	WMI_VDEV_SUBTYPE_MESH_11S   = 5,
 };
 
 enum wmi_sta_powersave_param {
-- 
2.20.1


--nextPart4277361.24nD7heDEj--

--nextPart2320249.TaoVLJRsoN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlykx54ACgkQXYcKB8Em
e0b3fxAAw1ijk7dclvcZh0hL977u6Fdo3xAZa97HKYlrcZmYVhUQ5Ty/FH+23PQa
kTf2kOB5WKAWy07asOkBQ3ewRqIQmZlaltLP8naWM7+ZTJiuCarzbwzfcIWcJjrM
5+tCDq810BzH6y6A7ObHT0DzpLNF/dVoFUkwKMDXeU2O/t6paPMo+sgvG4S1ntDu
MWV8ltuTEXKiUTwe+dF3a2p3KtuEq7cdJzeoWb5OtpnJHLulN1Mei8zkdLOyJkpz
/cNGVCdznKUbnzkxzWJbQPbzb86nRAijhc9gqDtoonxbbpHscdb/Gg6mvTdS9Jic
S8tmdNZt42nTp6Cz6YVkc23C8S59UNPwizHhS8SLlX4s+miupohYIvdY0cwr+LO9
ULa1QXQbNKRqwPvIQUg+j9xMmZyYn3ido9yQG/Lo16fB1RKEWwQH21+Af9fpQBzi
cxnqZ9VWZBjDz80UmS+S5JP0s+JDHVQbRaC+2ssnvQfy41WNtvZO+dNsxvl40zEQ
P9JFhrDe3J50HDmpbRh51YhVM+RgJCvST6DvfDhQlMAhKQkfKsytssknKAWSEL3V
7xCLUohdvDcfSB0iW6UquBo4D5LMUgkPrH+w3MM4pqqywwsX/D8tq1hB/otsiCmO
+pWyIn8FCt07PbUfEkqKRNMLO0eteBg8W9yViUhJMPOL35uC3MM=
=p5o/
-----END PGP SIGNATURE-----

--nextPart2320249.TaoVLJRsoN--





--===============4144168379828805117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============4144168379828805117==--
