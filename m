Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64021C433F5
	for <ath11k@archiver.kernel.org>; Wed,  9 Feb 2022 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PGldvFKwPI9OpysOik2aENzY98ZCKe484Oc0IIlaeiI=; b=wRRwGkIr5VDaY5
	xy+rk2Bg7OzGM7q018MhkWpXSdTaRBfMAjQEx8/CD+td9USmC1dyBe0kEGoyhYZcyBnZMHM7O1Vm+
	SL/u9aQ01RWz0YwNIScnmBgVzB5jEPlW/QwvXw4X9wHQkia3CILMRvPPicbdSWD4DzarUnrB8Muiw
	kquIydKxU1cwDWzu6NeaRfdxREqTCzB5jPomwmTpAri3JGrK2+ygO/xKuE6H+AeE6rtnOh3LiWTSd
	CS3xvjRlmXZZzryOXIVg0/ImGsC9kTvYGoPn1wTg7sOnK1MN0XLwSF6GHQFjRDskJLBIjSyKYxz9J
	OEOAdXx1MqbUq0vyvitg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHg1o-00GIdU-6U; Wed, 09 Feb 2022 06:00:32 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHg1m-00GIcd-0u
 for ath11k@lists.infradead.org; Wed, 09 Feb 2022 06:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644386430; x=1675922430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ByrhfU1w8cUviJV+Xsi3eZDVQVoAKiqYdGH2gesod1A=;
 b=k24Qg40xqS9vXJ13TEyK2xtwm3R6I9WgcNOvNhi5nfm+8G4w63s5CJyI
 GYZ08fSdQis4tc+mPJjNgiTgyQlhAl9rzt0t4rhSDGb6ucHiveh7JbzbZ
 u8w8CeioGQVWpbYRGUu/jVjKYNi2ycrbX4CM1sK2ezJL+PItRtksxMfvj o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Feb 2022 22:00:29 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:00:28 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:28 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 22:00:27 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 0/6] ath11k: add feature for device recovery
Date: Wed, 9 Feb 2022 01:00:06 -0500
Message-ID: <20220209060012.32478-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_220030_118624_517DF223 
X-CRM114-Status: UNSURE (   7.32  )
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

Currently recovery is work success for QCA6390/WCN6855 without the RDDM dump feature,
because patch "ath11k: configure RDDM size to mhi for recovery by firmware"
added in v5.

v6: add patch "ath11k: Add hw-restart option to simulate_fw_crash"

v5:
    1. rebased to ath.git ath-202202030905
    2. change a few commit message
    3. fix count set sequence of ath11k_core_reset in "ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base"
    4. add patch "ath11k: configure RDDM size to mhi for recovery by firmware" to support RDDM
    5. move destroy_workqueue(ab->workqueue_aux) from ath11k_pci_remove() to ath11k_core_free()

v4: add patch "ath11k: fix invalid m3 buffer address"
    recovery will fail when download firmware without this patch

v3: remove time_left set but not used in
    "ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base"

v2: s/initilized/initialized in commit log of patch
    "ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base"

Add support for device recovery.

Carl Huang (1):
  ath11k: fix invalid m3 buffer address

Wen Gong (5):
  ath11k: add ath11k_qmi_free_resource() for recovery
  ath11k: configure RDDM size to mhi for recovery by firmware
  ath11k: add support for device recovery for QCA6390/WCN6855
  ath11k: add synchronization operation between reconfigure of mac80211
    and ath11k_base
  ath11k: Add hw-restart option to simulate_fw_crash

 drivers/net/wireless/ath/ath11k/core.c    | 121 ++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h    |  18 ++++
 drivers/net/wireless/ath/ath11k/debugfs.c |   4 +
 drivers/net/wireless/ath/ath11k/mac.c     |  40 +++++++
 drivers/net/wireless/ath/ath11k/mhi.c     |  35 +++++++
 drivers/net/wireless/ath/ath11k/qmi.c     |   6 ++
 drivers/net/wireless/ath/ath11k/qmi.h     |   1 +
 7 files changed, 217 insertions(+), 8 deletions(-)


base-commit: 76680d49b5e0e661bc4abcdaf13fb7e124b4ca08
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
