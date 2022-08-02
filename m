Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC07C00140
	for <ath11k@archiver.kernel.org>; Tue,  2 Aug 2022 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jptnImywFJ/MeQ0aGrcjFjgL/YYHi0BtQx39F6Ro3Gw=; b=t4U2GwKdf8O0Fy
	Zehmn+Da+XJJNWtBKq67OYMBM+GCl90KLfXyn951W7MxMe7kkYoAKRC0fYGqUyAEGswLI6L8IFhKQ
	8AGddH7mbCxu2a5LeY0RiGid8dPOSpDNozrGV/FvdYIuqmfxPogpEA7eNncXQTjYYUveS9IxLpQu7
	Osz19zh7PkDR7rW6jQdhQigQB3VHalvNJ/Shl6d/an4SeGLg0ai63Os9k/X0+X3SkNfZc5Iw+epi2
	dG10sxxoZp65S81eYaF2ImsCqjGFbkHVQY+myamUcXPoQIDiQvoSr7HVzABR5HL3l8w1lhluBqC1m
	s8F0glQGpEl81BhgJ0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIml8-00BZ7E-Bm; Tue, 02 Aug 2022 07:56:10 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIml1-00BZ1y-Oh
	for ath11k@lists.infradead.org; Tue, 02 Aug 2022 07:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659426963; x=1690962963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D9iNWlELmFi/hRYacqy6gZg3+0cd1J8YXncbE1N6T1Q=;
  b=UTYnk6pu7YBWSxlqhrZgijN/MNpJslY/oAMPmwyjTZijDFHwpDRPlgBV
   CbbhtPX/k1OzfjPzK0mvax35m9eNeYaMEWHAb/piiNZhQGRGDsLAxLUHl
   94Q2LKZQWY+b+Xd37pdp61aAgybp9ox/FWNlKKpM8UgXHkgJi1FlVHgTb
   I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Aug 2022 00:55:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 00:55:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 2 Aug 2022 00:55:56 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 2 Aug 2022 00:55:55 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 0/2] wifi: ath11k: Add support for sram dump
Date: Tue, 2 Aug 2022 15:55:31 +0800
Message-ID: <20220802075533.1744-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_005603_878387_8B9599E2 
X-CRM114-Status: UNSURE (   7.67  )
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

On-board sram contains valuable information for debug, this patch adds
a new interface named "sram" in debugfs with which we can dump sram
content using following cmd:

        cat /sys/kernel/debug/ath11k/<pdev name>/sram > sram.dump

v2:
 1: rebased on latest ath.git.
 2. drop the patch "ath11k: Move pdev debugfs creation ahead"
    per Kalle's comments.

Baochen Qiang (2):
  wifi: ath11k: Split PCI write/read functions
  wifi: ath11k: Implement sram dump interface

 drivers/net/wireless/ath/ath11k/core.c    |  7 ++
 drivers/net/wireless/ath/ath11k/debugfs.c | 62 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hif.h     | 10 +++
 drivers/net/wireless/ath/ath11k/hw.c      | 10 +++
 drivers/net/wireless/ath/ath11k/hw.h      |  9 +++
 drivers/net/wireless/ath/ath11k/pci.c     |  1 +
 drivers/net/wireless/ath/ath11k/pcic.c    | 79 +++++++++++++++++------
 drivers/net/wireless/ath/ath11k/pcic.h    |  1 +
 8 files changed, 161 insertions(+), 18 deletions(-)


base-commit: b93992f874a92c264a0d0bda3bbf44b84eff4321
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
