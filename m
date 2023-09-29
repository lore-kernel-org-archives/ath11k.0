Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE8E743FE
	for <ath11k@archiver.kernel.org>; Fri, 29 Sep 2023 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fif+suHSClep4fXH3LP/fCKCaEXOv9TU/MUDksxsyb0=; b=lypIYaUbGhyKXA
	M9Nv4NVi8hVGM1j0mu67OBzUaPEDgK1s44tV9TkOH8txrJw35F3kym/HiQrSb6JUPGhWSaCStktzj
	WV8jygNdFhp4K032hKtiji3iOQmOZrC/Up9HR3fN9Mb/DnM8/urHbIylCZyui0eLlmoNBWGN1Tg7Z
	8AipEB/7YGAmZEwrbH0bqkpRaQ23INtCCkyXjhBO6bYpNHl3FCbQGVVm2qJBfyoun+wqDVWHXylzH
	O0L10HtFhpF5vL5UjQI8IreDAoSuJR6kiEDlhi0xIgG1fr3mkyE8sVyaU5NEGuJcrSWguTwYDonYd
	6v9jBAquX4MDySUunIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9Um-007RUL-0M;
	Fri, 29 Sep 2023 09:09:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9Ui-007RU0-2Z
	for ath11k@lists.infradead.org;
	Fri, 29 Sep 2023 09:09:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEFED61E60;
	Fri, 29 Sep 2023 09:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0699C433C8;
	Fri, 29 Sep 2023 09:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695978547;
	bh=wfl6ypqxXpzsB73dvy0nGzMg6Q0TrSyFS3x5+ngV/Ro=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=EFYlNHtwEaNJihc0U7jRQFABRTp6nnaAjIR3G8BkJwQQLuT1RVNSwWq4j46oFK2Sh
	 R/xP3e2I0s9nqqqXySQOFKTQT/slfUgqDFXXkQLnlUXkdPF5KtibazSrwTI2z33f3c
	 LIGevQxQN2fe6xUSWVRVTTk7SA63rHwr354UjYx9jYPRbgg2sDsUQn80AqkwWImaSJ
	 Csv3jqShapbhpEqMPRos3uhTIt3h9puTKY+VcKAEJoJZ0zwDG/3vpBTJiHtXH8Mdqy
	 lJKb/kNbLGvqUQp+BPUY1QM6yuMs7cpETjJ7HcHAseRKNKDQzDorc5Ny+ccakajffV
	 cFiIwvf+HLeTw==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: move pci.ops registration ahead
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230807061749.9404-2-quic_bqiang@quicinc.com>
References: <20230807061749.9404-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169597854467.3479545.1030727333826913383.kvalo@kernel.org>
Date: Fri, 29 Sep 2023 09:09:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_020908_876656_8BBB060B 
X-CRM114-Status: UNSURE (   9.68  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> In ath11k_pci_probe() there is a switch statement that, based
> upon the PCI device ID, assigns pci_ops. After the switch,
> ath11k_pcic_register_pci_ops() is called to register the pci_ops.
> 
> Unfortunately, this registration is too late if any of the cases
> in the switch need to perform operations that require the pci_ops
> to already be registered. In particular, an upcoming patch for
> QCA2066 needs to call ath11k_pcic_read32().
> 
> To address this issue, call ath11k_pcic_register_pci_ops() from
> each case instead of doing so after the switch. That way the ops
> will be registered if any subsequent operations within the case
> processing require the ops to be present.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

I'll now drop these from my queue, please resubmit as v2 once we have
pushed the firmware to public.

2 patches set to Changes Requested.

13343062 [1/2] wifi: ath11k: move pci.ops registration ahead
13343063 [2/2] wifi: ath11k: add support for QCA2066

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230807061749.9404-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
