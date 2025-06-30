Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BE8C83000
	for <ath11k@archiver.kernel.org>; Mon, 30 Jun 2025 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0W903R8oLS9A2Sxqq1i/Td3ToFCQaML7iQd92xG1QFo=; b=3ecbvgo4wtZpG+meknCyyLVH+f
	LtxnNWoQc8m4eYUySlGhdtwXfSn8bYs1NLnxtFfbzcaVuCC7fmIMCcVvpHvXusud3viOmR0BMuGPm
	a6PiGgFa31RTFBqEfsiIwyEiiLkBuYWcgDPmH8iIceDdQGsqVhZIUL/qWwc9SWzVUylQ07mKsF33f
	ja0/JSqc2ssL6O4bqayd2xuE5fKqq/0Ipy3hU1oWXVy9vDf6rEc0Y7etnrzfySXvYZ/WV0Hrr3Taz
	uiiSqIsCooN1qxvehw7JE1SUPIFGGFGyPVLLgA65xOqgX3b5j2+WtVpQm5Hl9eubWV8CIBMTvcBA5
	zpea28RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Dc-00000001UaT-2jER;
	Mon, 30 Jun 2025 07:46:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9CR-00000001UJK-23nT
	for ath11k@lists.infradead.org;
	Mon, 30 Jun 2025 07:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751269459; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YPXl96toAc9A81uHYDgb3wzuBuBul39m6GIxCdtHx883TeQtZDvgj/BK4H2XKyL7snXDS+LKXfY7qOyuu/jCIOyWPTyWrPpe+h8ywrtlvGvZBJLTZzBgrzf701ejS7DhtDHKxSfXHnrNKltEf2bvssIp3xWFoL7jSKr8R7t7NVs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751269459; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0W903R8oLS9A2Sxqq1i/Td3ToFCQaML7iQd92xG1QFo=; 
	b=NSeiL5qXGb1LbteLWZi78rqdeCQI0hr4i7cB4u+2qGPoniIjCkvpOM6mw1Rq2bALtzXX4afBFvqSv4UItrbLDEDI8O3wRHdkbfnkp1+q+4Lby8KE7UgmNkfM5q1Ker0USBWYRnCkH/wM6erCIWBxRywUDpU+IK5yMOnIeT85bnk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751269459;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=0W903R8oLS9A2Sxqq1i/Td3ToFCQaML7iQd92xG1QFo=;
	b=EPkySk/t1sw5EqicXIkGaYPIbJB6ogRJvd3A5FHYzs/kpFfCnAZBcndTDx1tUpXN
	2wrbcQDYR4mgCU9+L+VATv91rCSS/94LVP+ZIR15ea4ylCeZjG2TofjaP91yigaseTU
	WeQYxaUSdGwwYVhldrR7xEO1nb5xmUYDHds7FL5A=
Received: by mx.zohomail.com with SMTPS id 1751269457487321.0194901089892;
	Mon, 30 Jun 2025 00:44:17 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Alex Elder <elder@kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	Sujeev Dias <sdias@codeaurora.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	John Crispin <john@phrozen.org>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kernel@collabora.com
Subject: [PATCH 0/3] bus: mhi: keep dma buffers through suspend/hibernation cycles
Date: Mon, 30 Jun 2025 12:43:27 +0500
Message-Id: <20250630074330.253867-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_004511_598412_291E3060 
X-CRM114-Status: GOOD (  10.23  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

When there is memory pressure during resume and no DMA memory is
available, the ath11k driver fails to resume. The driver currently
frees its DMA memory during suspend or hibernate, and attempts to
re-allocate it during resume. However, if the DMA memory has been
consumed by other software in the meantime, these allocations can
fail, leading to critical failures in the WiFi driver. It has been
reported [1].

Although I have recently fixed several instances [2] [3] to ensure
DMA memory is not freed once allocated, we continue to receive
reports of new failures.

In this series, 3 more such cases are being fixed. There are still
some cases which I'm trying to fix. They can be discussed separately.

[1] https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com
[2] https://lore.kernel.org/all/20250428080242.466901-1-usama.anjum@collabora.com
[3] https://lore.kernel.org/all/20250516184952.878726-1-usama.anjum@collabora.com

Muhammad Usama Anjum (3):
  bus: mhi: host: keep bhi buffer through suspend cycle
  bus: mhi: don't deinitialize and re-initialize again
  bus: mhi: keep device context through suspend cycles

 drivers/bus/mhi/host/boot.c            | 19 ++++++++++---------
 drivers/bus/mhi/host/init.c            | 16 +++++++++++-----
 drivers/bus/mhi/host/internal.h        |  2 ++
 drivers/net/wireless/ath/ath11k/core.c |  5 -----
 include/linux/mhi.h                    |  1 +
 5 files changed, 24 insertions(+), 19 deletions(-)

-- 
2.39.5


