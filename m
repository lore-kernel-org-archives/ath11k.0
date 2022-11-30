Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCC8C4332F
	for <ath11k@archiver.kernel.org>; Wed, 30 Nov 2022 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JiFILgY79RPWVmFcj6GryTMSx/bJMSXN/2T2ZuYZWms=; b=VImy1U/eS6ahy0
	msnLLHWSzF8+JDluMfRHrt/HZIEjtJj5Y+cTgSCMLmmHKZ39BnRdX0EcPZAvycdX8M8mJtRw2dP80
	MZLH8c5toczyYz5wutvd2uLpyO6DtElrFYWR4T/zxyxaM762fmSa4hrz94f70+W9WbPSotCqFx4K0
	4GPCgzRfOi6NKxI/GaEuYiPPuY6LgEEVvHyjYzLlzGLzYjey3lLmB1fZbaiu0OwRw2AkJfUcren8O
	8w4qnx9dnNZE1fhUu4vh1Vs5+cCNktaSAOp9RygutrWHX6ynUXvwt8/DEa++tr8TR3Chov/KjwYn5
	PuBntowFwBMosKDy5IoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MCI-00G7E5-MP; Wed, 30 Nov 2022 12:28:18 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MCF-00G7BO-Vh
	for ath11k@lists.infradead.org; Wed, 30 Nov 2022 12:28:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3F42D68AFE; Wed, 30 Nov 2022 13:28:07 +0100 (CET)
Date: Wed, 30 Nov 2022 13:28:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Subject: ath11k vs ar_qrtr?
Message-ID: <20221130122807.GA31720@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_042816_199113_335439BF 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Kalle,

I'm trying to install debian testing on my new Thinkpad T14s, which
comes with a Qualcomm QCNFA765 wifi adatper that seems to be supported
by the ath11k driver.

Probing the device fails with a "failed to initialize qmi handle: -517"
message, which as far as I can tell happens when qmi_sock_create
fails to create a AF_QIPCRTR socket with a status of -EAFNOSUPPORT,
which the confusingly gets turned into -EPROBE_DEFER by qmi_handle_init.

The debian installer kernel doesn't seem to come with af_qrtr at all,
which seems to be required by this call and unless I'm missing something
is required for support for at least this version of the ath11k
hardware.  Is there any reson to not have a module dependency so that
distributions will pick it up automatically?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
