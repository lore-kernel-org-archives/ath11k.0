Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10824C433EF
	for <ath11k@archiver.kernel.org>; Wed, 19 Jan 2022 03:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mQg2SJNI+SSH64vEpOfVzDO6ZEExhxEP9J5FxZZR2sk=; b=yLbIacCRW3bLNH
	ULiFwMZZaIbMVC5kBchsh1GQOU1HaD73DKXIm45P1AKptytMxCh3kRJ916G5BDOdWs3bm24gAsWwH
	0a3MTE6VIrLtN4WFEFkqdV2lCpj7TmzfhAZUZ3wBzfFL4IcemEysJXjs20x9MH9iBYr4IBlziPAnr
	Bytm1d8e35Js2VNlaZEZ0ObBd4c89AwTBuqyyGqYpt14Vsyig23ELwqGrOsrDo/4jLFuiakuWJpSE
	hOZ7cu1PElDr2OWqAZWIDlGIO6fy+moSK5KA80zHdov3C7o8ile8mmrqvQjrKsWI5eNp/WhKXFfQG
	rP/C8MlmF6Vl1mWzzLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA1rj-003gpF-N4; Wed, 19 Jan 2022 03:42:31 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA1rh-003goN-94
 for ath11k@lists.infradead.org; Wed, 19 Jan 2022 03:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642563749; x=1674099749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3DfHvsf0iHSgz3W2vQ7sXhGdiUHlPyFJr+PDhf8M9Cw=;
 b=wMfTyAUXI/+RNq35oeu3Oxn0yncJ6+eBtNEYXYZuiCLA/7uo63T0u0+7
 gnwMwoYQyeEDqwIDenHNPpkhphW7XpjdmiTkEh+vfC+rdqfkyqqpUf1yI
 y0UuDUoEzdubOunCbV701XVqQSiAYoMzsdarvbAHkBhu7WQT32Hae9763 0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Jan 2022 19:42:26 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 19:42:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 18 Jan 2022 19:42:25 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 18 Jan 2022 19:42:24 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: set WMI_PEER_40MHZ while peer assoc for 6 GHz
Date: Tue, 18 Jan 2022 22:42:11 -0500
Message-ID: <20220119034211.28622-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_194229_392072_E78038F0 
X-CRM114-Status: UNSURE (   8.33  )
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

When station connect to AP of 6 GHz with 40 MHz bandwidth, the TX is
always stay 20 MHz, it is because the flag WMI_PEER_40MHZ is not set
while peer assoc. Add the flag if remote peer is 40 MHz bandwidth.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Fixes: c3a7d7eb4c98 ("ath11k: add 6 GHz params in peer assoc command")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2:
   1. rebased to ath.git ath-202201171245
   2. change commit log

 drivers/net/wireless/ath/ath11k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 02228c4da4d0..90fcd6adf2d5 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2319,6 +2319,9 @@ static void ath11k_peer_assoc_h_he_6ghz(struct ath11k *ar,
 	if (!arg->he_flag || band != NL80211_BAND_6GHZ || !sta->he_6ghz_capa.capa)
 		return;
 
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
+		arg->bw_40 = true;
+
 	if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
 		arg->bw_80 = true;
 

base-commit: 7ed59172e3753f2a4d7a39515f1c937ea9edb968
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
