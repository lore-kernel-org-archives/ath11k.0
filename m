Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUwQ9-0003nG-HN
 for ath11k@lists.infradead.org; Tue, 20 Oct 2020 18:31:45 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v2 1/4] mac80211: save HE oper info in BSS config for mesh
Date: Tue, 20 Oct 2020 11:31:08 -0700
Message-Id: <20201020183111.25458-2-pradeepc@codeaurora.org>
In-Reply-To: <20201020183111.25458-1-pradeepc@codeaurora.org>
References: <20201020183111.25458-1-pradeepc@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

Currently he_support is set only for AP mode. Storing this
information for mesh BSS as well helps driver to determine
HE support. Also save HE operation element params in BSS
conf so that drivers can access this for any configurations
instead of having to parse the beacon to fetch that info.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 include/net/mac80211.h |  3 ++-
 net/mac80211/mesh.c    | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index e8e295dae744..ee72ea5ec861 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -621,7 +621,8 @@ struct ieee80211_fils_discovery {
  *	nontransmitted BSSIDs
  * @profile_periodicity: the least number of beacon frames need to be received
  *	in order to discover all the nontransmitted BSSIDs in the set.
- * @he_oper: HE operation information of the AP we are connected to
+ * @he_oper: HE operation information of the BSS (AP/Mesh) or of the AP we are
+ *	connected to (STA)
  * @he_obss_pd: OBSS Packet Detection parameters.
  * @he_bss_color: BSS coloring settings, if BSS supports HE
  * @fils_discovery: FILS discovery configuration
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index ce5825d6f1d1..97095b7c9c64 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -667,6 +667,35 @@ void ieee80211_mesh_root_setup(struct ieee80211_if_mesh *ifmsh)
 	}
 }
 
+static void
+ieee80211_mesh_update_bss_params(struct ieee80211_sub_if_data *sdata,
+				 u8 *ie, u8 ie_len)
+{
+	struct ieee80211_supported_band *sband;
+	const u8 *cap;
+	const struct ieee80211_he_operation *he_oper = NULL;
+
+	sband = ieee80211_get_sband(sdata);
+	if (!sband)
+		return;
+
+	if (!ieee80211_get_he_iftype_cap(sband, NL80211_IFTYPE_MESH_POINT) ||
+	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_20_NOHT ||
+	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_5 ||
+	    sdata->vif.bss_conf.chandef.width == NL80211_CHAN_WIDTH_10)
+		return;
+
+	sdata->vif.bss_conf.he_support = true;
+
+	cap = cfg80211_find_ext_ie(WLAN_EID_EXT_HE_OPERATION, ie, ie_len);
+	if (cap && cap[1] >= ieee80211_he_oper_size(&cap[3]))
+		he_oper = (void *)(cap + 3);
+
+	if (he_oper)
+		sdata->vif.bss_conf.he_oper.params =
+			__le32_to_cpu(he_oper->he_oper_params);
+}
+
 /**
  * ieee80211_fill_mesh_addresses - fill addresses of a locally originated mesh frame
  * @hdr:	802.11 frame header
@@ -943,6 +972,7 @@ ieee80211_mesh_build_beacon(struct ieee80211_if_mesh *ifmsh)
 
 	bcn->tail_len = skb->len;
 	memcpy(bcn->tail, skb->data, bcn->tail_len);
+	ieee80211_mesh_update_bss_params(sdata, bcn->tail, bcn->tail_len);
 	bcn->meshconf = (struct ieee80211_meshconf_ie *)
 					(bcn->tail + ifmsh->meshconf_offset);
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
