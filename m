Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8817EC433F5
	for <ath11k@archiver.kernel.org>; Wed,  1 Dec 2021 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YXk6rRwhdjutZBXnkMQsQ9Nz8veCqgm1+6ayArorlPg=; b=LE7o1aujOiHQns
	dxpi/LCIg0eGN67MiAEbIQhcahMIUYjO14kbox7QKhQVRryKf++lNyKF7IgfkqEAS44hW50g/p1I7
	pFmiiBie7D9RlHtXlycPEg2XH4bsbQ3SiJJBgcBcadUpAgYCC4XeFe6ES1jrwvUtXOlCx0VuTtaho
	80BQauhs/mAVMlP/EqcVp8JscHMaR0RsZ5JZtW2SF3CEuEwOt6etnZD8KA+VOI3h0jczPPKxg6XV9
	Vx5JHQgresHmRsr1KUz7ESXB1aeQuOdcaiAS3L5FhEG7jmEJxx/xjqfo6UinFzYgfbmmspe/1j7CQ
	MbZbTtsS6Du+jGVXxLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msJsV-007cwZ-8d; Wed, 01 Dec 2021 07:18:07 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msJsS-007cw4-A3
 for ath11k@lists.infradead.org; Wed, 01 Dec 2021 07:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638343084; x=1669879084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=snIlwV+sxLCzduq92Ek2HVU6p8hvG/M08L5C2725WSs=;
 b=IxmlRtHYJjn70hZ1jr09FhDt5p/snD6RrE1jU/spafzjrCQNPy8KvY5H
 HI1e8rWsLEvHGtw1tSiAD8+yuWKS14mgUqKNHSN3ftyCY1/r8XbvWqRIx
 eHVmehAsz1g3/44zF3/z9yKZ+rwp7U2TmeMZJ1vS7rmIXwTCmy/R87GTT U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 30 Nov 2021 23:18:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:18:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 23:18:02 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 23:18:01 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 0/3] ath11k: add 11d scan offload support for
 QCA6390/WCN6855
Date: Wed, 1 Dec 2021 02:17:42 -0500
Message-ID: <20211201071745.17746-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_231804_443256_CA43DC37 
X-CRM114-Status: UNSURE (   7.25  )
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

v3:
   1. rebased to latest ath.git master ath-202111221436
   2. add "ath11k: avoid deadlock by change ieee80211_queue_work for regd_update_work",
      it is to fix deadlock warning
   3. move "cancel_work_sync(&ab->update_11d_work)" out from pci.c to mac.c/core.c

v2:
   1. rebased to latest ath.git master ath-202111170737
   2. add "ath11k: add configure country code for QCA6390 and WCN6855", it is needed for
      patch "ath11k: add 11d scan offload support"

Wen Gong (3):
  ath11k: avoid deadlock by change ieee80211_queue_work for
    regd_update_work
  ath11k: add configure country code for QCA6390 and WCN6855
  ath11k: add 11d scan offload support

 drivers/net/wireless/ath/ath11k/core.c |  31 +++++
 drivers/net/wireless/ath/ath11k/core.h |   9 ++
 drivers/net/wireless/ath/ath11k/mac.c  | 163 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.h  |   7 ++
 drivers/net/wireless/ath/ath11k/reg.c  |  15 +++
 drivers/net/wireless/ath/ath11k/wmi.c  | 147 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h  |  39 ++++++
 7 files changed, 409 insertions(+), 2 deletions(-)


base-commit: e5118670f6edde897ab17c3467efd24ad334fe7b
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
