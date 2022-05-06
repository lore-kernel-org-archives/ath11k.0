Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDD2C433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 01:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8yuO51VK66O3701J4AXFwdRT2NuR1lXikRQ//VlC3A4=; b=uTkMzNdARJRL+p
	6HuK9UlzznRAfsPZvBTdJfFlXAT6PLnWzVEd9fvsz0r9xmiHoU/T2nrGbd36dWb8vvwsLPMYtBIZ2
	Sd/3CUaTGHEf/Vlr3EPRoxOQ5/+JQBjtzzqLxAKDtwLgk0c1FC0j8kbt7L3n+HsfwMoqNNx63IOGQ
	BBePZ0hNn4HSc4OpEuO/H7IVuJrWQengF0n0H/D5l2zw21VPTUrR33FoIbD5QcAODtTGKHL9wXy7M
	pTHGxSwql2/pp9rBzgECQSjKdJOEQdt6sNZLxoA6CZE0uC9n0xliQmgPwvYvifXeiPgIBwfdV+fXd
	iBMKJKq6yufixSA9HEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmmtR-000ni6-0O; Fri, 06 May 2022 01:36:29 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmmtO-000nhU-JL
 for ath11k@lists.infradead.org; Fri, 06 May 2022 01:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651800986; x=1683336986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FA94JyOdyKLzWnhysBgprLnh+J4ocncFt0+dV7mOlo8=;
 b=vcDJCFN8DG0MQu8K3awXrD9vkmNCcceVVN+/W/DjbZ52npZ8G4ukjuah
 JZpwgLnL9SyzAnbzaGg+ZkAQZWsBNGFr7Pp7wK5WSPxD62KR24uvgBnKg
 PcN07Z/FKI+Z5pZAGo2cpr8DV3hKcPxMZi5J7fyFQelXDLm0aFA8LmQXP c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 May 2022 18:36:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 18:36:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 18:36:25 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 18:36:24 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 0/3] ath11k: Add support for Passpoint
Date: Fri, 6 May 2022 09:36:11 +0800
Message-ID: <20220506013614.1580274-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_183626_701247_3209512F 
X-CRM114-Status: UNSURE (   6.96  )
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

This is to add Passpoint support for WCN6855 and QCA6390.
With this patch set, STA can successfully connect to an
Passpoint AP.

v2:
 1. update commit log of patch 2/3

Baochen Qiang (3):
  ath11k: Implement remain-on-channel support
  ath11k: Don't check arvif->is_started before sending management frames
  ath11k: Designating channel frequency when sending management frames

 drivers/net/wireless/ath/ath11k/core.c |   8 ++
 drivers/net/wireless/ath/ath11k/hw.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 120 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c  |  21 ++++-
 4 files changed, 147 insertions(+), 3 deletions(-)


base-commit: b04efb72cd9d2d471a14f0a5758873f6c78923c2
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
