Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2043C433EF
	for <ath11k@archiver.kernel.org>; Tue, 30 Nov 2021 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqFTihPoB6NWJ7vEzleHRX9StOWvNHIHR55MT2iPZ0s=; b=I+RYtIKf6k+soP
	FnEJ8C0XdUBClrgRMrEMCifUNr2WVmYpTeYpiYxzs6qkN23QFs2YwbJb7RQuySjlqLo/vhOpYga6X
	bWWo/EEAq0kDKHN/VNMIi5uNBOIK3kCRUp59Ug8WUCximA9mY/FuJQhYPIuhr0UAxE1K3ZqYPcG1a
	+3Xy8Zmjk1O7O1r99WR9PI2jLXqkBacj+tyXRv5d/HtWlW231MtIt6fyyOw3Y8MIOkqHiB3VdGp7f
	FCLqLG3nIluQjLKG/zLB/COHYV0+ybp/lZTNLPDxnKPf+Fppi0BaWopb+d8ehKoeKRSpD0S5/M++a
	SaLdtUcPH1fVMn6G83hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7Hn-006Ovu-RG; Tue, 30 Nov 2021 17:51:23 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7Hk-006Ou2-SJ
 for ath11k@lists.infradead.org; Tue, 30 Nov 2021 17:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638294680; x=1669830680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=AehaPN9mAVpFKqjj4RHvCuU9GRZ7+GwKC1WV+P6Ie5U=;
 b=exqxTjiXaoC4zLavwgHU2xJZWUE/qUp3QQs8vWv7Js1BXKquS3sWhvoB
 pp18m1sEijGGUp0DroJad2rYNQTfY9mXxb9DtBBNxKBR79FKYgv6cZeV/
 91mvIfd93sTf3LQqtBBaVWGQeZEb6qewouarhqSsho8P3fIsDqxOEEZja U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Nov 2021 09:51:17 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 09:51:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 09:51:17 -0800
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 09:51:15 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 1/2] mac80211: fix FEC flag in radio tap header
Date: Tue, 30 Nov 2021 23:20:47 +0530
Message-ID: <1638294648-844-2-git-send-email-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638294648-844-1-git-send-email-quic_ppranees@quicinc.com>
References: <1638294648-844-1-git-send-email-quic_ppranees@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_095120_977495_DEDD16D4 
X-CRM114-Status: UNSURE (   9.47  )
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

In mac80211, while building radiotap header
IEEE80211_RADIOTAP_MCS_HAVE_FEC flag is missing when LDPC enabled
from driver, hence LDPC is not updated properly in radiotap header.
Fix that by adding HAVE_FEC flag while building radiotap header.

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 net/mac80211/rx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 9541a4c..be12fa8 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -465,7 +465,12 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
 		unsigned int stbc;
 
 		rthdr->it_present |= cpu_to_le32(BIT(IEEE80211_RADIOTAP_MCS));
-		*pos++ = local->hw.radiotap_mcs_details;
+		*pos = local->hw.radiotap_mcs_details;
+		if (status->enc_flags & RX_ENC_FLAG_HT_GF)
+			*pos |= IEEE80211_RADIOTAP_MCS_HAVE_FMT;
+		if (status->enc_flags & RX_ENC_FLAG_LDPC)
+			*pos |= IEEE80211_RADIOTAP_MCS_HAVE_FEC;
+		pos++;
 		*pos = 0;
 		if (status->enc_flags & RX_ENC_FLAG_SHORT_GI)
 			*pos |= IEEE80211_RADIOTAP_MCS_SGI;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
