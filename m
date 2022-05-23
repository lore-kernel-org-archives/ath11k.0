Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F553C433F5
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpJGxDbQM+DFBs5aFK9E8OT+91tiDpirHyXiF5GyCDk=; b=JhAL4zx+5pZImM
	9crnevKFp23HYHakyse5/v4vmQhKNojy6RTlt0nfvzx0GaFJQQuDxYD+ZhPzzgagdenaA+qabDJMX
	MYE1wZnypElFcI1AYoyafmY5eXNdkQSvhnQ6Qpamj4VKq4hhMirv/5uOfSn4A7yqAiGg0yEEu2Xx7
	iHlQPC0GilZVr/+2q5oEahgMRhgBpRWeZwo2hKLXqgg+J0vox86eWoXL9tp0UXlrfkSV4jM95MAjd
	KYlOOmLizk3OwH+nRFBaXXVCBH2iQUlEjVcoPDg7oea3uzosleO78NeI64OcCiK3iCOGvCuZYtH5z
	4aMpoCshURCwaWuznJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4T0-002t1x-GB; Mon, 23 May 2022 09:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oq-002AAA-QA
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=yx/YJ4ASp9/nXbmV4N3Xn+b1NeN8cDGwqAeA2j4FbPc=; b=qWafBzcw8Bzg/OBX/MB1b6NQT7
 p+ywlO/Kmay4HG3tOy5vwpmQecyyp3KAH+FnGc3kG938RYjLDNrDA44Vl5Bev3AL6Ap3kEBbVdUIh
 sYiWqmAgPErxsJrUjLyBtc8znPUPmlHpYUMIc5Zz/tMi5X+c6wf8s6pfEzHBUjs80JRtBMa2b0ie2
 lF69FSxNyjkUcWWX32gdNy63UwB+16u4NsJzCj+2cvX398+fbq91+Iz1xJWTbBMcTpWD+4hX7n+Os
 ImehF5m65pQJTjCYpYLSof2wlRcs9LCbv+G2DPEBMhMzkyREVUgbyo5oKrR8adMvN/oz57DkRVOC3
 mUuSeWEQ==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19J-000seF-0F
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285757; x=1684821757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yx/YJ4ASp9/nXbmV4N3Xn+b1NeN8cDGwqAeA2j4FbPc=;
 b=j76CkO2wReFq44FWwGE2WrgTJiJDaM/ViaQDWy9nmGAzCvdw5ooO47rn
 sbWYpgTW78IqmdeGkvVUEqh/iaup4tAjFuW+yIwGCbq74z/wIq0qCAKNd
 AcMSPXVdGl5TpA35h4Nus1uifwEC4ctezvjTJAWB2W4AXDYQICqmO+TxH w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 May 2022 23:01:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:25 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:25 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 0/9] MBSSID and EMA support in AP mode
Date: Sun, 22 May 2022 23:00:59 -0700
Message-ID: <20220523060108.23982-1-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070237_682596_91127A76 
X-CRM114-Status: UNSURE (   9.81  )
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

- Changes in MAC80211 add support for enhanced multiple BSSID (EMA AP).
This patch is the next version for the following series:
https://patchwork.kernel.org/project/linux-wireless/list/?series=558285&state=%2A&archive=both
The changes are now rebased on top of wireless-testing tree which
includes this series:
https://patchwork.kernel.org/project/linux-wireless/list/?series=617531&state=%2A&archive=both

- Patches for ath11k split the changes from following patch in
logical separate patches:
https://patchwork.kernel.org/project/linux-wireless/patch/20210120003221.21984-1-alokad@codeaurora.org/
And also use the latest API changes in MAC80211 which were different
at the time of V6.

Aloka Dixit (9):
  mac80211: generate EMA beacons in AP mode
  ath11k: add WMI resource config for EMA
  ath11k: set MBSSID and EMA driver capabilities
  ath11k: MBSSID configuration during vdev create/start
  ath11k: create a structure for WMI vdev up parameters
  ath11k: configure MBSSID device parameters
  ath11k: move vif parameter setting in a different function
  ath11k: EMA beacon support
  ath11k: configure WPA and RSNE parameters for nontransmitting
    interface

 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/hw.c   |   3 +
 drivers/net/wireless/ath/ath11k/hw.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 361 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.c  |  27 +-
 drivers/net/wireless/ath/ath11k/wmi.h  |  66 ++++-
 include/net/mac80211.h                 |  77 ++++++
 net/mac80211/cfg.c                     |   9 +-
 net/mac80211/ieee80211_i.h             |   9 +-
 net/mac80211/tx.c                      | 110 +++++++-
 10 files changed, 603 insertions(+), 62 deletions(-)


base-commit: 9335156ac0e174721921c404bd173526c8509124
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
