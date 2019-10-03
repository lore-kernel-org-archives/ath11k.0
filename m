Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFsML-0007he-3H
 for ath11k@lists.infradead.org; Thu, 03 Oct 2019 04:04:59 +0000
From: Vikas Patel <vikpatel@codeaurora.org>
Subject: [PATCH bringup] ath11k: assigning values to enum
Date: Thu,  3 Oct 2019 09:34:47 +0530
Message-Id: <20191003040447.7399-1-vikpatel@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: Vikas Patel <vikpatel@codeaurora.org>

Instead of writing enum value in comment,
assigning directly to enum.

Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 114 +++++++++++++-------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 28e16e353488..00c51cc83d47 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -112,63 +112,63 @@ enum {
 enum wmi_cmd_group {
 	/* 0 to 2 are reserved */
 	WMI_GRP_START = 0x3,
-	WMI_GRP_SCAN = WMI_GRP_START, /* 0x3 */
-	WMI_GRP_PDEV,           /* 0x4 */
-	WMI_GRP_VDEV,           /* 0x5 */
-	WMI_GRP_PEER,           /* 0x6 */
-	WMI_GRP_MGMT,           /* 0x7 */
-	WMI_GRP_BA_NEG,         /* 0x8 */
-	WMI_GRP_STA_PS,         /* 0x9 */
-	WMI_GRP_DFS,            /* 0xa */
-	WMI_GRP_ROAM,           /* 0xb */
-	WMI_GRP_OFL_SCAN,       /* 0xc */
-	WMI_GRP_P2P,            /* 0xd */
-	WMI_GRP_AP_PS,          /* 0xe */
-	WMI_GRP_RATE_CTRL,      /* 0xf */
-	WMI_GRP_PROFILE,        /* 0x10 */
-	WMI_GRP_SUSPEND,        /* 0x11 */
-	WMI_GRP_BCN_FILTER,     /* 0x12 */
-	WMI_GRP_WOW,            /* 0x13 */
-	WMI_GRP_RTT,            /* 0x14 */
-	WMI_GRP_SPECTRAL,       /* 0x15 */
-	WMI_GRP_STATS,          /* 0x16 */
-	WMI_GRP_ARP_NS_OFL,     /* 0x17 */
-	WMI_GRP_NLO_OFL,        /* 0x18 */
-	WMI_GRP_GTK_OFL,        /* 0x19 */
-	WMI_GRP_CSA_OFL,        /* 0x1a */
-	WMI_GRP_CHATTER,        /* 0x1b */
-	WMI_GRP_TID_ADDBA,      /* 0x1c */
-	WMI_GRP_MISC,           /* 0x1d */
-	WMI_GRP_GPIO,           /* 0x1e */
-	WMI_GRP_FWTEST,         /* 0x1f */
-	WMI_GRP_TDLS,           /* 0x20 */
-	WMI_GRP_RESMGR,         /* 0x21 */
-	WMI_GRP_STA_SMPS,       /* 0x22 */
-	WMI_GRP_WLAN_HB,        /* 0x23 */
-	WMI_GRP_RMC,            /* 0x24 */
-	WMI_GRP_MHF_OFL,        /* 0x25 */
-	WMI_GRP_LOCATION_SCAN,  /* 0x26 */
-	WMI_GRP_OEM,            /* 0x27 */
-	WMI_GRP_NAN,            /* 0x28 */
-	WMI_GRP_COEX,           /* 0x29 */
-	WMI_GRP_OBSS_OFL,       /* 0x2a */
-	WMI_GRP_LPI,            /* 0x2b */
-	WMI_GRP_EXTSCAN,        /* 0x2c */
-	WMI_GRP_DHCP_OFL,       /* 0x2d */
-	WMI_GRP_IPA,            /* 0x2e */
-	WMI_GRP_MDNS_OFL,       /* 0x2f */
-	WMI_GRP_SAP_OFL,        /* 0x30 */
-	WMI_GRP_OCB,            /* 0x31 */
-	WMI_GRP_SOC,            /* 0x32 */
-	WMI_GRP_PKT_FILTER,     /* 0x33 */
-	WMI_GRP_MAWC,           /* 0x34 */
-	WMI_GRP_PMF_OFFLOAD,    /* 0x35 */
-	WMI_GRP_BPF_OFFLOAD,    /* 0x36 Berkeley Packet Filter */
-	WMI_GRP_NAN_DATA,       /* 0x37 */
-	WMI_GRP_PROTOTYPE,      /* 0x38 */
-	WMI_GRP_MONITOR,        /* 0x39 */
-	WMI_GRP_REGULATORY,     /* 0x3a */
-	WMI_GRP_HW_DATA_FILTER, /* 0x3b */
+	WMI_GRP_SCAN = WMI_GRP_START,
+	WMI_GRP_PDEV		= 0x4,
+	WMI_GRP_VDEV           = 0x5,
+	WMI_GRP_PEER           = 0x6,
+	WMI_GRP_MGMT           = 0x7,
+	WMI_GRP_BA_NEG         = 0x8,
+	WMI_GRP_STA_PS         = 0x9,
+	WMI_GRP_DFS            = 0xa,
+	WMI_GRP_ROAM           = 0xb,
+	WMI_GRP_OFL_SCAN       = 0xc,
+	WMI_GRP_P2P            = 0xd,
+	WMI_GRP_AP_PS          = 0xe,
+	WMI_GRP_RATE_CTRL      = 0xf,
+	WMI_GRP_PROFILE        = 0x10,
+	WMI_GRP_SUSPEND        = 0x11,
+	WMI_GRP_BCN_FILTER     = 0x12,
+	WMI_GRP_WOW            = 0x13,
+	WMI_GRP_RTT            = 0x14,
+	WMI_GRP_SPECTRAL       = 0x15,
+	WMI_GRP_STATS          = 0x16,
+	WMI_GRP_ARP_NS_OFL     = 0x17,
+	WMI_GRP_NLO_OFL        = 0x18,
+	WMI_GRP_GTK_OFL        = 0x19,
+	WMI_GRP_CSA_OFL        = 0x1a,
+	WMI_GRP_CHATTER        = 0x1b,
+	WMI_GRP_TID_ADDBA      = 0x1c,
+	WMI_GRP_MISC           = 0x1d,
+	WMI_GRP_GPIO           = 0x1e,
+	WMI_GRP_FWTEST         = 0x1f,
+	WMI_GRP_TDLS           = 0x20,
+	WMI_GRP_RESMGR         = 0x21,
+	WMI_GRP_STA_SMPS       = 0x22,
+	WMI_GRP_WLAN_HB        = 0x23,
+	WMI_GRP_RMC            = 0x24,
+	WMI_GRP_MHF_OFL        = 0x25,
+	WMI_GRP_LOCATION_SCAN  = 0x26,
+	WMI_GRP_OEM            = 0x27,
+	WMI_GRP_NAN            = 0x28,
+	WMI_GRP_COEX           = 0x29,
+	WMI_GRP_OBSS_OFL       = 0x2a,
+	WMI_GRP_LPI            = 0x2b,
+	WMI_GRP_EXTSCAN        = 0x2c,
+	WMI_GRP_DHCP_OFL       = 0x2d,
+	WMI_GRP_IPA            = 0x2e,
+	WMI_GRP_MDNS_OFL       = 0x2f,
+	WMI_GRP_SAP_OFL        = 0x30,
+	WMI_GRP_OCB            = 0x31,
+	WMI_GRP_SOC            = 0x32,
+	WMI_GRP_PKT_FILTER     = 0x33,
+	WMI_GRP_MAWC           = 0x34,
+	WMI_GRP_PMF_OFFLOAD    = 0x35,
+	WMI_GRP_BPF_OFFLOAD    = 0x36,
+	WMI_GRP_NAN_DATA       = 0x37,
+	WMI_GRP_PROTOTYPE      = 0x38,
+	WMI_GRP_MONITOR        = 0x39,
+	WMI_GRP_REGULATORY     = 0x3a,
+	WMI_GRP_HW_DATA_FILTER = 0x3b,
 };
 
 #define WMI_CMD_GRP(grp_id) (((grp_id) << 12) | 0x1)
-- 
2.23.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
