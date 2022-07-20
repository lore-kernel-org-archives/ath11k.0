Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE330C43334
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0IMj9M5NSQzSbT/uulkG3sWAQhr8y6CYLC/KGc3U8Vg=; b=3+gKUMvef/yBwv
	Z6a0vov0rd1DMQupkZT1XN62CrzZhvWOSVE8D+s5Kx171cVTFdA0EZ8nSgk6ZN/huwiZNtP3dSDdf
	rZJCdXqaQ1+1O528AmkaRNF2N3XM1hSxiz9SNLPQz/ytqodjb0BvAOLho/qmOEOiiTXZDKk9s64aF
	NavhuFy6TVAee2hAfal2TMH3ezi49PN9yMYSSLuoM64I4/9wI2DwqVEg3uGfh1H5fuPmey5FIhgG/
	Sxp9sWg/pciksPJc7U7+hF0f4VU1oFCJ9BWHU6PfC6ht1Hk08CyFtlPdOCETMmYrGBtIxxY1/+MeV
	GfZNkbyQrqqJrm4fAp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA06-006Bzm-5P; Wed, 20 Jul 2022 13:44:30 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA02-006Bx6-JJ
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658324666; x=1689860666;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r/BEuxqEDuebpbiD1N3o42xiJNxtIZ7vOqzfS9CSCp4=;
  b=qFkglK/do1KDNbjC4kvxYkgqleOYa+WJMW/hvMq8cHxQklWY7ERIvzH4
   XM3AV4uyu7rNT0j4wtNLIwl3FKNBUZeTp0UEfaj7s1M/T5AA8gJA9/Yr8
   iDekNZv1h/inYf69g07pZjQQS5hPBQ67w9RGZUJ7Jyf65P/VxWPkUfs4c
   s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 20 Jul 2022 06:44:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:44:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:44:21 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:44:19 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Enable remain-on-channel support on WCN6750
Date: Wed, 20 Jul 2022 19:13:31 +0530
Message-ID: <20220720134331.14832-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_064426_694669_0857C7E2 
X-CRM114-Status: GOOD (  10.07  )
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

Enable remain on channel support on WCN6750 as it is needed for
GAS, Passpoint.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c8e0bc935838..ddbdfc9311d4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -559,7 +559,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.dp_window_idx = 1,
 		.ce_window_idx = 2,
 		.fixed_fw_mem = true,
-		.support_off_channel_tx = false,
+		.support_off_channel_tx = true,
 	},
 };
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
