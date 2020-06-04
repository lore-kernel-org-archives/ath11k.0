Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgk0p-0000GO-LK
 for ath11k@lists.infradead.org; Thu, 04 Jun 2020 07:10:06 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 05/12] mac80211: add multiple bssid IE parsing
Date: Thu,  4 Jun 2020 09:09:45 +0200
Message-Id: <20200604070952.15481-6-john@phrozen.org>
In-Reply-To: <20200604070952.15481-1-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
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
index bb2edace71a9..1a98b3907aa7 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4717,12 +4717,17 @@ void ieee80211_report_low_ack(struct ieee80211_sta *sta, u32 num_packets);
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
index 2502726d0a58..abe488424287 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1520,6 +1520,7 @@ struct ieee802_11_elems {
 	u8 dtim_count;
 	u8 dtim_period;
 	const struct ieee80211_addba_ext_ie *addba_ext_ie;
+	u16 multiple_bssid_offset;
 
 	/* length of them, respectively */
 	u8 ext_capab_len;
@@ -1540,6 +1541,7 @@ struct ieee802_11_elems {
 	u8 perr_len;
 	u8 country_elem_len;
 	u8 bssid_index_len;
+	u8 multiple_bssid_len;
 
 	/* whether a parse error occurred while retrieving these elements */
 	bool parse_error;
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 49d35936cc9d..5e2879cd24b0 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4747,11 +4747,21 @@ __ieee80211_beacon_get(struct ieee80211_hw *hw,
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
index a7c4d6a44e21..bbe2f1d9166c 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1311,6 +1311,10 @@ _ieee802_11_parse_elems_crc(const u8 *start, size_t len, bool action,
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
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
