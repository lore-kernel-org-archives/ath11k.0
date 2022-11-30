Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E95C433FE
	for <ath11k@archiver.kernel.org>; Wed, 30 Nov 2022 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CttM4WSD5CnkQvbTgVcydEzfIRm4HqMsqP4/VaN7P9c=; b=mWPFK/8GBRvwBa
	UPtBO3WpJn2hvBCDQ4CASSPTZIc1yREdBQXPwMIPoLNi+EB5+OIrDDuiuwxcJi2dIAa6DzFmm3hXA
	WSNTBmidlQEZiiqnJodNooGEGTvo8tszcGAY8GbR/lq4HhyJgVt7fHKhmLps41OipVk4x5OLmr4Xn
	iC0J1CUNviYSbRaHr3j1/ZHPuiP6Vsb4g4trzpNfLu77scJKT/15b/Ddufh0gDuNROlsgSkJqXy+a
	pCYy2IQ0bZQjfTJHwaRiWXFtLWkCFF8W+An1+VgH3qDo2fQJYm8TwXGE2IZFIgpLucbBXvCGwNajA
	JChjJGd9hNwP3ft6odNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MQM-00GEEE-S9; Wed, 30 Nov 2022 12:42:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MQJ-00GECp-T4
	for ath11k@lists.infradead.org; Wed, 30 Nov 2022 12:42:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B7D7B81B3D;
	Wed, 30 Nov 2022 12:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E56C433C1;
	Wed, 30 Nov 2022 12:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669812165;
	bh=uZ6P3B5vwzdHPKiVZdx68XIaIy5fCrMeJR95VABVGFA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZRnT6wa+0sXBaw1uvysUJBgTJG7sGOOaE6L+Mj5M4uV1bvxroauUJZj25soiCbAGV
	 wdd46O1E1zAupnHB97t41hqM+kOQpUoMMRb2f4jWrWucbnTEjAwPOslHusbg5eYZks
	 HY6Vu1ribauFZ6cVoN7rOuSow94fAxRBrr/CFRJS7aVYF8uVk0muRenmGkUFQZsYW2
	 MDkZYNDS4QZyB3nj53w73XPdjhTr8rXw2EkkmlF7fh+Hfy+5kKLmR9W//Lwdgox5i3
	 zoH2Fw7NAyU38w/sA7ZOPmfWC0C6fCcpE5sPqRn9jee35tLba1BHAayEesT6srxY6H
	 8S0pQiFdWZ1/g==
From: Kalle Valo <kvalo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k vs ar_qrtr?
References: <20221130122807.GA31720@lst.de>
Date: Wed, 30 Nov 2022 14:42:41 +0200
In-Reply-To: <20221130122807.GA31720@lst.de> (Christoph Hellwig's message of
	"Wed, 30 Nov 2022 13:28:07 +0100")
Message-ID: <87o7so4nr2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_044248_100128_D762EFC2 
X-CRM114-Status: GOOD (  18.32  )
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

Hi Christoph,

Christoph Hellwig <hch@lst.de> writes:

> I'm trying to install debian testing on my new Thinkpad T14s, which
> comes with a Qualcomm QCNFA765 wifi adatper that seems to be supported
> by the ath11k driver.
>
> Probing the device fails with a "failed to initialize qmi handle: -517"
> message, which as far as I can tell happens when qmi_sock_create
> fails to create a AF_QIPCRTR socket with a status of -EAFNOSUPPORT,
> which the confusingly gets turned into -EPROBE_DEFER by qmi_handle_init.
>
> The debian installer kernel doesn't seem to come with af_qrtr at all,
> which seems to be required by this call and unless I'm missing something
> is required for support for at least this version of the ath11k
> hardware.

Yeah, ath11k PCI devices require QRTR and we have this in Kconfig:

config ATH11K_PCI
	tristate "Atheros ath11k PCI support"
	depends on ATH11K && PCI
	select MHI_BUS
	select QRTR
	select QRTR_MHI

> Is there any reson to not have a module dependency so that
> distributions will pick it up automatically?

Sorry, not following you here. Are you saying that "select QRTR" is not
enough and we should add something more?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
