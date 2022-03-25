Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40B5C433F5
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 06:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0a872mbIsyJXJk6Eoe8Q3pHecbYqrztAIFUz79HsGbY=; b=OrewqATZi9gP8J
	W7iB61Mk0kfBkNuBKfyGuQqoaKRXj+MB6TGT4+dB3jELL9xpclNADZdfUCz5rUbVbh40oPfoHevk0
	my3vG4zrN0CM85EZP54Lq6W7IUUJduVG+9L84sHveAnRB1Q0eNXGnGfVPfT9Q1pFoH0UqIHcKqlt3
	GcHa+/qzKNDR5n7pHZg3t7xGUT/1Oy65byuOTTBENyBicEz0PdahwF8VXJK7ytyAxt7fFZLu5MuEp
	apw2jUpJAD3htktUcU6wFOWCCpfoOv0ua0yf9Lcte0g4NUTag7NoL/L6/lP7cKkLskhFnqYH+czUK
	WoHsP4sblzo3NP3R1MRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXczi-001EIK-QH; Fri, 25 Mar 2022 06:00:18 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXczg-001EGl-E5
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 06:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648188016; x=1679724016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2mKIC4Canfy9Bt4RGPz0iaA2vqA/2yLoC71GUupdPC0=;
 b=fpfPZjE8nq3GYrUQD/M+RidMcgMzEs7l4AEvFb8QEnRYlvKlpLApfhVD
 FTNEodCHBWzlQGWDKT/LzqhAJyi7lLElXMfp/s3uV5y3/b9x/Zb71pCla
 rMNPUPUMPNvo/l5TgthDsneZc3AD6m1Unqpz2Lqc23JummWGzh6Ua/tB/ s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2022 23:00:11 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 23:00:11 -0700
Received: from che-siroccolnx03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 24 Mar 2022 23:00:09 -0700
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Subject: [PATCH v6 0/3] Add support to configure beacon tx mode
Date: Fri, 25 Mar 2022 11:29:46 +0530
Message-ID: <20220325055949.3035053-1-quic_mkenna@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_230016_548306_BB1FB161 
X-CRM114-Status: UNSURE (   7.91  )
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

Add support to configure the beacon tx mode as STAGGERED
or BURST mode via hostapd configuration during the AP
bring-up or via wpa_suppplicant configuration during MESH
bring-up.

Beacons can be sent out in burst(continuously in a single shot
one after another) or staggered (equally spread out over beacon
interval) mode.

V6: Addressed Jeff's comment on v5.

V5: Addressed Johannes's and Felix's comment on v4.

V4: Rebased on latest ath.git TOT.

V3: Addressed Johnson's comment on v2 patch.

V2: Addressed Johannes's comment on v1 patch.

Maharaja Kennadyrajan (3):
  nl80211: Add support for beacon tx mode
  mac80211: Add support for beacon tx mode
  ath11k: Add support for beacon tx mode

 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++---
 include/net/cfg80211.h                |  4 ++++
 include/net/mac80211.h                |  2 ++
 include/uapi/linux/nl80211.h          | 21 +++++++++++++++++++++
 net/mac80211/cfg.c                    |  2 ++
 net/wireless/nl80211.c                | 11 +++++++++++
 6 files changed, 47 insertions(+), 3 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
