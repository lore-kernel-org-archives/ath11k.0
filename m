Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsPfl-000335-35
 for ath11k@lists.infradead.org; Mon, 06 Jul 2020 11:52:35 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 04/10] mac80211: add multiple bssid IE parsing
Date: Mon,  6 Jul 2020 13:52:13 +0200
Message-Id: <20200706115219.663650-4-john@phrozen.org>
In-Reply-To: <20200706115219.663650-1-john@phrozen.org>
References: <20200706115219.663650-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Drivers might need to know the offset and length of the IE. Add parsing
code and propagate the values to the driver using the mutable struct.

Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/mac80211.h     |  5 +++++
 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/tx.c          | 10 ++++++++++
 net/mac80211/util.c        |  4 ++++
 4 files changed, 21 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 3617a2742c4d..67729b8fcdb2 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4744,12 +4744,17 @@ void ieee80211_report_low_ack(struct ieee80211_sta *sta, u32 num_packets);
  * @csa_counter_offs: array of IEEE80211_MAX_CSA_COUNTERS_NUM offsets
  *	to CSA counters.  This array can contain zero values which
  *	should be ignored.
+ * @mbssid_offset: position of mbssid_offset
+ * @mbssid_length: position of mbssid_offset
  */
 struct ieee80211_mutable_offsets {
 	u16 tim_offset;
 	u16 tim_length;
 
 	u16 csa_counter_offs[IEEE80211_MAX_CSA_COUNTERS_NUM];
+
+	u16 multiple_bssid_offset;
+	u16 multiple_bssid_length;
 };
 
 /**
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index ec1a71ac65f2..e1cae41a2ea4 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1523,6 +1523,7 @@ struct ieee802_11_elems {
 	u8 dtim_count;
 	u8 dtim_period;
 	const struct ieee80211_addba_ext_ie *addba_ext_ie;
+	u16 multiple_bssid_offset;
 
 	/* length of them, respectively */
 	u8 ext_capab_len;
@@ -1543,6 +1544,7 @@ struct ieee802_11_elems {
 	u8 perr_len;
 	u8 country_elem_len;
 	u8 bssid_index_len;
+	u8 multiple_bssid_len;
 
 	/* whether a parse error occurred while retrieving these elements */
 	bool parse_error;
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index e9ce658141f5..1e7a71d6853d 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4785,11 +4785,21 @@ __ieee80211_beacon_get(struct ieee80211_hw *hw,
 						 is_template);
 
 			if (offs) {
+				struct ieee802_11_elems elems;
+
 				offs->tim_offset = beacon->head_len;
 				offs->tim_length = skb->len - beacon->head_len;
 
 				/* for AP the csa offsets are from tail */
 				csa_off_base = skb->len;
+
+				ieee802_11_parse_elems(skb->head, skb->len, true, &elems,
+						       sdata->wdev.address, NULL);
+				if (!elems.parse_error)
+					goto out;
+
+				offs->multiple_bssid_offset = elems.multiple_bssid_offset;
+				offs->multiple_bssid_length = elems.multiple_bssid_len;
 			}
 
 			if (beacon->tail)
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 3e4308c8f690..af6d685cea63 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1315,6 +1315,10 @@ _ieee802_11_parse_elems_crc(const u8 *start, size_t len, bool action,
 								&crc : NULL,
 							  elem, elems);
 			break;
+		case WLAN_EID_MULTIPLE_BSSID:
+			elems->multiple_bssid_offset = pos - start;
+			elems->multiple_bssid_len = elen;
+			break;
 		default:
 			break;
 		}
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
