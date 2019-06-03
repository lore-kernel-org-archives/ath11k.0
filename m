Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXsDe-0002sh-2M
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 19:02:07 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V7 2/8] ath11k: fix some whitespace errors
Date: Mon,  3 Jun 2019 21:01:51 +0200
Message-Id: <20190603190157.25165-3-john@phrozen.org>
In-Reply-To: <20190603190157.25165-1-john@phrozen.org>
References: <20190603190157.25165-1-john@phrozen.org>
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
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Minor space vs tabs formatting error.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index eb3723e16f87..6641433ca64d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4190,28 +4190,28 @@ struct wmi_unit_test_cmd {
 
 #define MAX_SUPPORTED_RATES 128
 
-#define WMI_PEER_AUTH           0x00000001
-#define WMI_PEER_QOS            0x00000002
-#define WMI_PEER_NEED_PTK_4_WAY 0x00000004
-#define WMI_PEER_NEED_GTK_2_WAY 0x00000010
-#define WMI_PEER_HE             0x00000400
-#define WMI_PEER_APSD           0x00000800
-#define WMI_PEER_HT             0x00001000
-#define WMI_PEER_40MHZ          0x00002000
-#define WMI_PEER_STBC           0x00008000
-#define WMI_PEER_LDPC           0x00010000
-#define WMI_PEER_DYN_MIMOPS     0x00020000
-#define WMI_PEER_STATIC_MIMOPS  0x00040000
-#define WMI_PEER_SPATIAL_MUX    0x00200000
-#define WMI_PEER_VHT            0x02000000
-#define WMI_PEER_80MHZ          0x04000000
-#define WMI_PEER_PMF            0x08000000
+#define WMI_PEER_AUTH		0x00000001
+#define WMI_PEER_QOS		0x00000002
+#define WMI_PEER_NEED_PTK_4_WAY	0x00000004
+#define WMI_PEER_NEED_GTK_2_WAY	0x00000010
+#define WMI_PEER_HE		0x00000400
+#define WMI_PEER_APSD		0x00000800
+#define WMI_PEER_HT		0x00001000
+#define WMI_PEER_40MHZ		0x00002000
+#define WMI_PEER_STBC		0x00008000
+#define WMI_PEER_LDPC		0x00010000
+#define WMI_PEER_DYN_MIMOPS	0x00020000
+#define WMI_PEER_STATIC_MIMOPS	0x00040000
+#define WMI_PEER_SPATIAL_MUX	0x00200000
+#define WMI_PEER_VHT		0x02000000
+#define WMI_PEER_80MHZ		0x04000000
+#define WMI_PEER_PMF		0x08000000
 /* TODO: Place holder for WLAN_PEER_F_PS_PRESEND_REQUIRED = 0x10000000.
  * Need to be cleaned up
  */
-#define WMI_PEER_IS_P2P_CAPABLE 0x20000000
-#define WMI_PEER_160MHZ         0x40000000
-#define WMI_PEER_SAFEMODE_EN    0x80000000
+#define WMI_PEER_IS_P2P_CAPABLE	0x20000000
+#define WMI_PEER_160MHZ		0x40000000
+#define WMI_PEER_SAFEMODE_EN	0x80000000
 
 struct beacon_tmpl_params {
 	u8 vdev_id;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
