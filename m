Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA800C433EF
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xxcdgqmrYUSR1S4+p6nfw0OrMSKsJcRfxpw9rrE8/Yw=; b=mDmhOyCPzKgFZn
	4gIYmL6c8++ry7pcSATtPTDYc4Ez4iU0jypl5NIaSspjPXn4k4wKs3WbWi3iHHmi08CpHwvGjUWxZ
	M1nYc93itGI1X3hq7SeaB6hQ1nt3u7onVvoQ/mrnE7cHOIK7HyPM9ktEnTZf/E0cKrHoG2XHYbQ4E
	vDGEcySmyP/UaYOan9Qq4r2emENOwjdnLxkYQyWQL46HNtEko5NJLRC5I0tiP9BrejZ3Wz0zj7F2o
	rbrFLzjbwd37ZiHJhZWuoU44k2U/BLD9niAvUfCh1NQtUTs0dqoxZep6E3LDxI6HvMNK/DiRlpt0S
	JqPHv//5BNIrSDGF4jOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA7d-006J93-1G; Wed, 20 Jul 2022 13:52:17 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA7S-006J0j-9K
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658325126; x=1689861126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ppRigJYhz5mnSLJkJnf7Ku1tYwyLVb2RypjqAh+CWfk=;
  b=RTpZJe60HlGsUpHIdSLx2ovNYouoo+Fw9X73RQHgxFa3ewVVj8t7rFgM
   MRuM+/aag9OQi1mclklZO1MVaQLVaGFLU5oRWQX1z5XrRPM9nEtNY7Uld
   ebQD9FPRhI4rwmWr2C2e3q9+J8oyi2q87OhbS+3Wic7WfPidO12xYvsxx
   E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 20 Jul 2022 06:52:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:52:06 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:52:05 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:52:03 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 0/2] Add TWT debugfs support for STA interface
Date: Wed, 20 Jul 2022 19:21:48 +0530
Message-ID: <20220720135150.22193-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_065206_395247_6D37F406 
X-CRM114-Status: UNSURE (   5.68  )
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

Currently TWT debugfs interfaces are created only for AP iftypes,
add TWT debugfs support for STA interface as well. This is needed for
manually testing the TWT feature on STA interfaces.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Manikanta Pubbisetty (2):
  ath11k: Add TWT debugfs support for STA interface
  ath11k: Fix hardware restart failure due to twt debugfs failure

 drivers/net/wireless/ath/ath11k/debugfs.c | 84 ++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/debugfs.h |  5 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 22 ++++--
 drivers/net/wireless/ath/ath11k/wmi.c     | 68 +++++++++++-------
 drivers/net/wireless/ath/ath11k/wmi.h     | 23 ++++++-
 5 files changed, 143 insertions(+), 59 deletions(-)

-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
