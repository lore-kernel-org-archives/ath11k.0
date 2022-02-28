Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D38C433FE
	for <ath11k@archiver.kernel.org>; Mon, 28 Feb 2022 06:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iGAwkV7ADRuvCEm4RVXeb6SfmRhHU/cvjpZF1+9tlp8=; b=FRlYvKIlSSpCdm
	Y/LaCI2wgTxi+viduL4j2gL1uH+A5rtZ7DV/lw8ClcrdKMImtOT1BjGtNAseVXXdUsxpOfjSwsj6E
	62m1YT+bqE4vKkRzS3mmzjU+Mjam319BehLyECDzd2lJti0oD/UsamabLoJcjoLngjOfa2w/wNbJn
	xdsSRHK7VxMmiHfTI2bhjDyjkACf1CjKBpdU/pnb78yuNdnGNGxIQgGt3rdj717cMFs5YKH84Wt+Z
	AnynHPIvhB17T7WFRgQ8Wxw0hSBC1K+F4uHrUVTqpHJthadsv3P4+kZ0/UAb200MWm9bklikIyqZP
	G0q1cncGlBd7FHjvJjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOZnl-00AvL9-0u; Mon, 28 Feb 2022 06:46:33 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOZnh-00AvID-DL
 for ath11k@lists.infradead.org; Mon, 28 Feb 2022 06:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646030789; x=1677566789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Sw8CmSZ7521fZPjWcYMdpdXPX1uK062hnXZMz3LxsI=;
 b=GlIfOy3YNmFiuBuVul/VPnI0e9D+eBGrK2kTe+GRv/4jcZa423ihm2sK
 mhaLBc4uo7Ss8pQUpOhfm2hGj24V/ucul+8qdXyhql3nE0zqX9AzGWsK8
 zeVfQQTo/Y40qb+NmBS/Zr69G8tjtDDjL+U3GM4P5vZtBFzijHlnIEox7 w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Feb 2022 22:46:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 22:46:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 27 Feb 2022 22:46:21 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 27 Feb 2022 22:46:19 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v8 0/4] ath11k: add feature for device recovery
Date: Mon, 28 Feb 2022 01:46:02 -0500
Message-ID: <20220228064606.8981-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_224629_522037_7BF6AFDE 
X-CRM114-Status: UNSURE (   8.01  )
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

v8: change "fail_cont_count = atomic_inc_return(&ab->fail_cont_count)" to "atomic_inc(&ab->fail_cont_count)" in
    "ath11k: add support for device recovery for QCA6390/WCN6855"

v7:
    1. rebased to ath.git ath-202202211030
    2. add patch "ath11k: fix the warning of dev_wake in mhi_pm_disable_transition()"
    3. remove below 3 patch which has upstream.
       ath11k: add ath11k_qmi_free_resource() for recovery
       ath11k: configure RDDM size to mhi for recovery by firmware
       ath11k: add support for device recovery for QCA6390/WCN6855

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

Wen Gong (4):
  ath11k: add support for device recovery for QCA6390/WCN6855
  ath11k: add synchronization operation between reconfigure of mac80211
    and ath11k_base
  ath11k: Add hw-restart option to simulate_fw_crash
  ath11k: fix the warning of dev_wake in mhi_pm_disable_transition()

 drivers/net/wireless/ath/ath11k/core.c    | 121 ++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h    |  18 ++++
 drivers/net/wireless/ath/ath11k/debugfs.c |   4 +
 drivers/net/wireless/ath/ath11k/mac.c     |  40 +++++++
 drivers/net/wireless/ath/ath11k/mhi.c     |  33 ++++++
 drivers/net/wireless/ath/ath11k/pci.c     |  12 ++-
 6 files changed, 216 insertions(+), 12 deletions(-)


base-commit: 193dc0446985372a9b06b7572e1b98e1963c23a9
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
