Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnOeE-0003YD-Al
 for ath11k@lists.infradead.org; Tue, 16 Jul 2019 14:41:43 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Fix warnings that trigger during peer assoc when
 fixed rate is set
Date: Tue, 16 Jul 2019 20:11:28 +0530
Message-Id: <1563288088-2821-1-git-send-email-srirrama@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: Sriram R <srirrama@codeaurora.org>

When VHT fixed rate is set to MCS < 7, warnings are seen when a new sta
gets associated while peer_assoc command is sent to firmware. This is
seen since we expect tx_mcs_set sent to firmware as values corresponding
to range 0-7, 0-8 or 0-9. Since the intersection of STA's VHT MCS support
and current bitrate mask after fixed rate is set has MCS < 7 warning is
thrown currently.
Remove these warning for these cases as it's a valid scenario.
For these cases, 0-7 MCS can be sent during peer assoc to firmware as
this is followed by peer fixed rate setting.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3dc0615..b8217e9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1007,12 +1007,6 @@ ath11k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 		case 4: /* fall through */
 		case 5: /* fall through */
 		case 6: /* fall through */
-		default:
-			WARN_ON(1);
-			/* fall through */
-		case -1:
-			mcs = IEEE80211_VHT_MCS_NOT_SUPPORTED;
-			break;
 		case 7:
 			mcs = IEEE80211_VHT_MCS_SUPPORT_0_7;
 			break;
@@ -1022,6 +1016,12 @@ ath11k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 		case 9:
 			mcs = IEEE80211_VHT_MCS_SUPPORT_0_9;
 			break;
+		default:
+			WARN_ON(1);
+			/* fall through */
+		case -1:
+			mcs = IEEE80211_VHT_MCS_NOT_SUPPORTED;
+			break;
 		}
 
 		tx_mcs_set &= ~(0x3 << (nss * 2));
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
