Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaaGd-00084a-U7
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 08:05:15 +0000
From: Lavanya Suresh <lavaks@codeaurora.org>
Subject: [PATCH] ath11k: Add new dfs region name for JP
Date: Thu,  5 Nov 2020 13:34:35 +0530
Message-Id: <1604563475-5782-1-git-send-email-lavaks@codeaurora.org>
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
Cc: Lavanya Suresh <lavaks@codeaurora.org>, linux-wireless@vger.kernel.org

Japan has new Radar types as per latest regulatory,
included under MKK_N in FW. So adding new enum in
ath11k to support it.

Tested-on: IPQ8074 hw2.0 PCI WLAN.HK.2.4.0.1-00041-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 1 +
 drivers/net/wireless/ath/ath11k/reg.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index f6a1f03..4f178d8 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -277,6 +277,7 @@ ath11k_map_fw_dfs_region(enum ath11k_dfs_region dfs_region)
 	case ATH11K_DFS_REG_KR:
 		return NL80211_DFS_ETSI;
 	case ATH11K_DFS_REG_MKK:
+	case ATH11K_DFS_REG_MKK_N:
 		return NL80211_DFS_JP;
 	default:
 		return NL80211_DFS_UNSET;
diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
index 39b7fc9..65d56d4 100644
--- a/drivers/net/wireless/ath/ath11k/reg.h
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -20,6 +20,7 @@ enum ath11k_dfs_region {
 	ATH11K_DFS_REG_MKK,
 	ATH11K_DFS_REG_CN,
 	ATH11K_DFS_REG_KR,
+	ATH11K_DFS_REG_MKK_N,
 	ATH11K_DFS_REG_UNDEF,
 };
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
