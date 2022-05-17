Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613D3C433EF
	for <ath11k@archiver.kernel.org>; Tue, 17 May 2022 00:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wW3hwK/7xOVUoJqoABjcu+El0uEXgY1K3hcXg5PXMSc=; b=Shw6wZ3xWnh0Bo
	cJsmBMJ4tRQtr/EMncNtFbuDpD4uhrhE/i876f6bmLNNDlXhPng8zg0z1gj7/PCiuwM5Y0ESmbZOH
	cMSAn5tQkgtc3AbsbetXhZAq2PrnQfL7px5hcIEEbxASflSUADzX5IrMssOO6Xnv+6U03TEQeyRLS
	JwEi4LiAmD/KNOA1ZHmXF1zm4TolI3yK4VFAAb9fCVq6V543Bs4FEF6Ip1IIft23cqMiS7jjcOrwm
	O7xwNT0ybYXWtKLna3M1a2ERVlFSqbB/QBSictfiWmq3Zc9dgQ40XQlze3dQiH6T+BzWLnJvFEXXa
	fEkKTJeYN3jzB4jDWyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqlOc-00B2S6-7z; Tue, 17 May 2022 00:49:06 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqlOZ-00B2RV-Ij
 for ath11k@lists.infradead.org; Tue, 17 May 2022 00:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652748543; x=1684284543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ehcT4+FkHyfIyexUCzwzsh50H4NwjSQI7EjsJIMzAPc=;
 b=O2bY+2uj79RfHx5nVZR+lwc7aTUA2dCjp0BP7eYaZ+gcFtuuG1cg/uh8
 1NxSt6Mz4PLifGjDWPjl1Kq2ZMCIBV3Dg7Np+AGAOpQqHmh9Z4LvPuGlv
 McnVw+RdO7qQNqBmRBIfPtzPlRMOR+baoxuH9BYBmeWJjbUOr5FUZtmIE 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 May 2022 17:48:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 17:48:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 16 May 2022 17:48:57 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 16 May 2022 17:48:56 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: Fix warning on variable 'sar' dereference before check
Date: Tue, 17 May 2022 08:48:44 +0800
Message-ID: <20220517004844.2412660-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_174903_683521_744812D9 
X-CRM114-Status: GOOD (  11.67  )
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

We are seeing below warning:
warn: variable dereferenced before check 'sar'

Fix it by moving ahead pointer check on 'sar'.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Fixes: 652f69ed9c1b ("ath11k: Add support for SAR")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ee1590b16eff..7d574ad67e59 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8297,11 +8297,15 @@ static int ath11k_mac_op_set_bios_sar_specs(struct ieee80211_hw *hw,
 					    const struct cfg80211_sar_specs *sar)
 {
 	struct ath11k *ar = hw->priv;
-	const struct cfg80211_sar_sub_specs *sspec = sar->sub_specs;
+	const struct cfg80211_sar_sub_specs *sspec;
 	int ret, index;
 	u8 *sar_tbl;
 	u32 i;
 
+	if (!sar || sar->type != NL80211_SAR_TYPE_POWER ||
+	    sar->num_sub_specs == 0)
+		return -EINVAL;
+
 	mutex_lock(&ar->conf_mutex);
 
 	if (!test_bit(WMI_TLV_SERVICE_BIOS_SAR_SUPPORT, ar->ab->wmi_ab.svc_map) ||
@@ -8310,12 +8314,6 @@ static int ath11k_mac_op_set_bios_sar_specs(struct ieee80211_hw *hw,
 		goto exit;
 	}
 
-	if (!sar || sar->type != NL80211_SAR_TYPE_POWER ||
-	    sar->num_sub_specs == 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
-
 	ret = ath11k_wmi_pdev_set_bios_geo_table_param(ar);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to set geo table: %d\n", ret);
@@ -8328,6 +8326,7 @@ static int ath11k_mac_op_set_bios_sar_specs(struct ieee80211_hw *hw,
 		goto exit;
 	}
 
+	sspec = sar->sub_specs;
 	for (i = 0; i < sar->num_sub_specs; i++) {
 		if (sspec->freq_range_index >= (BIOS_SAR_TABLE_LEN >> 1)) {
 			ath11k_warn(ar->ab, "Ignore bad frequency index %u, max allowed %u\n",

base-commit: 14c24bc11b43da59fe41d79d3c1b29decc3d21f3
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
