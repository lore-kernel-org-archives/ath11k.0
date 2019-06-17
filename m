Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcrJG-0003Oe-OX
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 13:04:32 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] mac80211: fix ieee80211_he_oper_size() comment
Date: Mon, 17 Jun 2019 15:04:25 +0200
Message-Id: <20190617130425.14014-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Johannes mentioned that the comment should not reference mac80211 as other
subsystems might call the helper.

Signed-off-by: John Crispin <john@phrozen.org>
---
 include/linux/ieee80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index e7d23a2cacd8..9b62c3744ed5 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -2062,8 +2062,8 @@ ieee80211_he_ppe_size(u8 ppe_thres_hdr, const u8 *phy_cap_info)
  * ieee80211_he_oper_size - calculate 802.11ax HE Operations IE size
  * @he_oper_ie: byte data of the He Operations IE, stating from the the byte
  *	after the ext ID byte. It is assumed that he_oper_ie has at least
- *	sizeof(struct ieee80211_he_operation) bytes, checked already in
- *	ieee802_11_parse_elems_crc()
+ *	sizeof(struct ieee80211_he_operation) bytes, the caller must have
+ *	validated this.
  * @return the actual size of the IE data (not including header), or 0 on error
  */
 static inline u8
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
