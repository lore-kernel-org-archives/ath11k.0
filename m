Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA14C433F5
	for <ath11k@archiver.kernel.org>; Wed, 16 Feb 2022 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OKnvI+IL+AVDmGQdd7rhRRsm2gtl14vMFAGMXXnwgQk=; b=WZbJ3BjqDCgcmp
	b7g6eU4aoHh/Tf6Nhojd8VZYjHhgqNC7mggvmQzOXS+P1TBBS5sCDoMCxOClnQLnOSnW+EVdEjR36
	OUNh+6PyI0NxW0Q3n0/e64LYJ80wI0OMGoZSXCm2Vw5hKjnTVNSfKbuA2+3bM9h6p2ByMbPYYqm1t
	s67rSU4Kx3XmUsk1OXpbaVWOVx+hE17XVGp7NtGnjuPqPGBH1+i9UOVHs0AsampXEwvECCW+wczwn
	EayfMwlogolPwLVLHJwykY1dwCpa5zPS+ru1RA+B+q3vjJuQUxdAIG7dG7BdoO1od9qINefCgdOzQ
	HMHeVsfXtEXWzhz9bUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKFfm-0067ws-Uh; Wed, 16 Feb 2022 08:28:26 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKFfk-0067wI-7d
 for ath11k@lists.infradead.org; Wed, 16 Feb 2022 08:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645000104; x=1676536104;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ht6zc7GnMpiGMKIpCWjwzLSAlsWkcboTn5FCJx2yIrY=;
 b=bQeLxX8vx4VF+awJAwFpY6JS2jCJjwjmxp4oDlM7sR2U7ur/qMInxMwa
 zC2sRpgllh7WTrzxWFGvi5YzIaAdJa2Ab0s2XEU8ezJC9vCzzZ2055Jod
 9W9sSetmUbmRNFIdEDwbA8BvrWovwjrRbom3VF5qyhC/J0gZp9P2xEjVp I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 00:28:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:28:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 00:28:17 -0800
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 00:28:15 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: [PATCH] ath11k: Invalidate cached reo ring entry before accessing it
Date: Wed, 16 Feb 2022 13:57:51 +0530
Message-ID: <1645000071-25832-1-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_002824_320495_0A0928F4 
X-CRM114-Status: UNSURE (   8.52  )
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

REO2SW ring descriptor is currently allocated in cacheable memory.
While reaping reo ring entries on second trial after updating head
pointer, first entry needs to be invalidated before accessing it.

Move the try_again: label above  ath11k_hal_srng_access_begin()
so that first entry will be invalidated and prefetched.

Tested on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Fixes: 6452f0a3d565 ("ath11k: allocate dst ring descriptors from cacheable memory")
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c212a78..e432f8d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2642,9 +2642,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 	spin_lock_bh(&srng->lock);
 
+try_again:
 	ath11k_hal_srng_access_begin(ab, srng);
 
-try_again:
 	while (likely(desc =
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
