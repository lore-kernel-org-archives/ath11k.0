Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3049C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kgBmNkDQ0uye0rnIKD/YvDGgfrscxvWhZITJYE2IDig=; b=bVzr3HS4SOpLOO
	1FAsdN/Fj2N9T0+yWUh3oSjLFkHbfU8fRryA1ZS0y1UatDszVdBX9UWljQBOqOZqUAUtenR1kRMhK
	BRr7+qXzvgd2uMyfjP7uVQwm69SUDwGzhNOdPg5MmW6hHBBM2vKkRp8o7fMpD+xq1zVAEWTluFyb1
	huT7y0pPY0RJ8xho59Jj9n4nBGV1hPmc1ZawUZduqP2d6ga+/YPuIM1jn40zEZDFnDRlWgb6waFbT
	CihY+8CW1JTXhJqyd3J0BuK/o3Qp9ssL6TmhdG0oOEANGf29Xrx1Pa3k8C0mb+hxdlxRvuwek9vvu
	Gp0XTSFRJUbI4/NaqFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1murQb-00BZv5-8A; Wed, 08 Dec 2021 07:31:49 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1murQY-00BZue-1V
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 07:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638948706; x=1670484706;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=gHTSXC/AolTIbMQUfTIn6LHsqBZW/QKXSLOEiTj31cM=;
 b=sWzhpxLrfmVuJYJ1bDiSBrTWqK6lOmjchPGbcmOdaS8gVb3taFDE6oeP
 siE92/Bg8/rfhWMLpaA2NuPXl1GAgGMOq4nUH/l0ylWl8HfZLcu1BmQUU
 Qao9LPpVbs3l0IQSGK6R1/SHK9x9NrocnyG+ZIbqX8G6WM/rcRhByeJJz 0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Dec 2021 23:31:45 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 23:31:46 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 23:31:45 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 23:31:43 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v3] ath11k: set DTIM policy to stick mode for station interface
Date: Wed, 8 Dec 2021 15:31:34 +0800
Message-ID: <1638948694-15582-1-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_233146_160073_CE925717 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Set DTIM policy to DTIM stick mode, so station follows AP DTIM
interval rather than listen interval which is set in peer assoc cmd.
DTIM stick mode is more preferred per firmware team request.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
v3:
  - fixed the Signed-off email address to quicinc.com

v2:
  - rebased on top of 4f4f8aee394b73abf5e5f98c63187fdbf1d627f0

 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ffedd22dd1c0..f8a072020198 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2681,6 +2681,13 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 	if (ret)
 		ath11k_warn(ar->ab, "failed to set vdev %i OBSS PD parameters: %d\n",
 			    arvif->vdev_id, ret);
+
+	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+					    WMI_VDEV_PARAM_DTIM_POLICY,
+					    WMI_DTIM_POLICY_STICK);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to set vdev %d dtim policy: %d\n",
+			    arvif->vdev_id, ret);
 }
 
 static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 35f5432357f5..7941838f5efc 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2169,6 +2169,13 @@ enum wmi_nss_ratio {
 	WMI_NSS_RATIO_2_NSS = 0x3,
 };
 
+enum wmi_dtim_policy {
+	WMI_DTIM_POLICY_IGNORE = 1,
+	WMI_DTIM_POLICY_NORMAL = 2,
+	WMI_DTIM_POLICY_STICK  = 3,
+	WMI_DTIM_POLICY_AUTO   = 4,
+};
+
 struct wmi_host_pdev_band_to_mac {
 	u32 pdev_id;
 	u32 start_freq;

base-commit: 4f4f8aee394b73abf5e5f98c63187fdbf1d627f0
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
