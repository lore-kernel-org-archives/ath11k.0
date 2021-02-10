Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD04C433DB
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9CB964E08
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9CB964E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B+uDkUSX39Mp5b8lCkVJkg+CZByBaKWl8Dj73El+SN8=; b=HSBQ+CZK0ocLxO1X6MrSagYNrK
	8UeLclxtT4m3H44hL1Y375TlQtePdW9hjAfNUpNagIa1VcuDzCn1LN/2U6k5/gT5lxeRtL+7ndll9
	3C3NEnC6d7qChQ7iG+7WTFyrV5tS9LayJqbnCcT6ECDbv4Po8uzHpnnt+9J3GE4SEkAHdttRApkuP
	CjUTFA9jO3wiDDlhNpfoGl2wfpQVaBiQDLeJw+XsT5/uw3pgNPfan9emVqzTLBtTy55ZeL8Ig32yU
	igLUZK8f4DJLUelaRItD21Fp1tE7clUD2FjndLbci6dwr9QqpeDIjEGbHVDpllyAgPlG0Wl48a996
	PBdTUIag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9l4v-0006ka-NN; Wed, 10 Feb 2021 08:42:29 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9l4s-0006k6-U8
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:42:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612946547; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=57YeHv8/zQvHMUpWce2DbhHXY78KxvzKmChd4fODxqc=;
 b=v8zkBfnNQA20/3qh3CH8AB5z/MaaLox2x18l+4EXc+knkbw9x889SUJc6zcr3IC6/40VjUHe
 ChOKPTt3VwmLZn26TqkRHhHjRQ6uGewYdHIRTnCep6+Mabfc2HtKgDnhND8fMI1Rz23ScF3T
 t46WSD1OKZaKjcHGhrrER24zoHA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60239c6fd5a7a3baae3cc94e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:42:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 37C42C43461; Wed, 10 Feb 2021 08:42:23 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DB3DC433C6;
 Wed, 10 Feb 2021 08:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DB3DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 00/11] ath11k: Add support for QCN9074
Date: Wed, 10 Feb 2021 14:11:59 +0530
Message-Id: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_034227_777015_6A4492AB 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

QCN9074 has PCI bus interface and shares QCA6390
configuration.

QCN9074 uses 45MB of host ddr memory.
FW requests the memory in segments of 2MB size and
each 2MB segment should be physically contiguous.

FW boot over MHI is verified.
BDF/M3 download over QMI is verified.
 
Below QMI issues are seen with QCN9074,
Issue 1:
 ath11k_pci 0000:06:00.0: qmi failed memory request, err = -110
 ath11k_pci 0000:06:00.0: qmi failed to respond fw mem req:-110
Issue 2:
 ath11k_pci 0000:06:00.0: firmware crashed: MHI_CB_SYS_ERROR
 ath11k_pci 0000:06:00.0: qmi failed set mode request, mode: 0, err = -110
 ath11k_pci 0000:06:00.0: qmi failed to send wlan fw mode:-110

QCN9074 uses,
 - 16-MSI interrupts, 3 for MHI, 5 for CE and 8 for DP
 - CE count is six
 - CE register address, WBM idle link ring address,
   WBM release ring address are different
 - TCL ring  descriptors,  HAL Rx descriptors are different, 
   so introduced platform specific hal rx descriptor access ops
   in ath11k_hw_ops

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1

Anilkumar Kolli (6):
  ath11k: Refactor ath11k_msi_config
  ath11k: Move qmi service_ins_id to hw_params
  ath11k: qmi: increase the number of fw segments
  ath11k: Update memory segment count for qcn9074
  ath11k: Add qcn9074 mhi controller config
  ath11k: add qcn9074 pci device support

Karthikeyan Periyasamy (5):
  ath11k: add static window support for register access
  ath11k: add hal support for QCN9074
  ath11k: add data path support for QCN9074
  ath11k: add CE interrupt support for QCN9074
  ath11k: add extended interrupt support for QCN9074

 drivers/net/wireless/ath/ath11k/ahb.c      |   2 +-
 drivers/net/wireless/ath/ath11k/ce.c       |  58 ++-
 drivers/net/wireless/ath/ath11k/ce.h       |   1 +
 drivers/net/wireless/ath/ath11k/core.c     |  43 ++
 drivers/net/wireless/ath/ath11k/core.h     |   4 +
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 476 +++++++++--------
 drivers/net/wireless/ath/ath11k/dp_tx.c    |   6 +-
 drivers/net/wireless/ath/ath11k/hal.c      |  88 ++--
 drivers/net/wireless/ath/ath11k/hal.h      |  33 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |  13 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c   |   3 +
 drivers/net/wireless/ath/ath11k/hal_tx.h   |   1 +
 drivers/net/wireless/ath/ath11k/hif.h      |  10 +
 drivers/net/wireless/ath/ath11k/hw.c       | 796 +++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h       |  53 ++
 drivers/net/wireless/ath/ath11k/mhi.c      | 116 ++++-
 drivers/net/wireless/ath/ath11k/pci.c      | 196 +++++--
 drivers/net/wireless/ath/ath11k/pci.h      |  21 +-
 drivers/net/wireless/ath/ath11k/qmi.c      |   2 +-
 drivers/net/wireless/ath/ath11k/qmi.h      |   9 +-
 drivers/net/wireless/ath/ath11k/rx_desc.h  | 212 +++++++-
 21 files changed, 1765 insertions(+), 378 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
