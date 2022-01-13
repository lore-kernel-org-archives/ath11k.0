Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB51C433EF
	for <ath11k@archiver.kernel.org>; Thu, 13 Jan 2022 02:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4wTLLjy3pN3JF1+J8RB0Id4nHow0MhduGxPXY83QOA=; b=KvlRhivZCv9NfA
	RtQ3QxxNzION/R0XjcTiatdHLP/YWt6pRQ9RkjeNgoXe8Abfdhd4mIYcAdfH7iUBk6if4zvkqKgoi
	9h8L++bMxNcc8EyWdex39+mIsKlDPgB5Vj9f1Paui+p/QxRWDX2w8TH40zEjYhNeDFo6Vm2AU4YzR
	OAPcTEKwHkGeb+00cWnbavvLGhyoQ9qqVjC5wNgqc3o25+SBz1VgootLI4wX9S7hVrQMo1xJLh0Cj
	VTgq9eaeiO//aJ7H/GIyMoEm6zbg5LQnUnyM7ScDMneb9lmeXxptR6qpbfftKbUfbV26x+N7sW4g2
	yLVBQihj32oUY+qLaSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7puL-004I7I-FI; Thu, 13 Jan 2022 02:32:09 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7puJ-004I6d-BH
 for ath11k@lists.infradead.org; Thu, 13 Jan 2022 02:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642041127; x=1673577127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zBlat8tQ6bnylReTzE36wcrn+PLIAcSz3jIy/oXAoew=;
 b=Jt/IL9W9lGA1HpWsS6XQ91SFw2X7gEowGvuWbTZGWEf0b0uKKbjbLso4
 +xtLV5cuzDADM8uh+sE5xZF3+Rg+GzEGHh9dcQgqYDtok2glMKODijo0T
 8NA5+Kvs9rGzGafm8y5pVAGS0tgsas97g9en7oqfsYdDTVxlYvC7tL03G U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jan 2022 18:32:04 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 18:32:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 12 Jan 2022 18:32:03 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 12 Jan 2022 18:32:02 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: set WMI_PEER_40MHZ while peer assoc for 6 GHz
Date: Wed, 12 Jan 2022 21:31:45 -0500
Message-ID: <20220113023145.14292-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_183207_453145_E6CB830D 
X-CRM114-Status: UNSURE (   7.93  )
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

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Fixes: 2cdf2b3cdf54 ("ath11k: add 6ghz params in peer assoc command")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 07f499d5ec92..fe4103bcfee3 100644
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
 

base-commit: 69a6130e6ab00306fe1552c73eb0d7a0dd4b4c04
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
