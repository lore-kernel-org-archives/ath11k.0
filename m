Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7969AC4829E
	for <ath11k@archiver.kernel.org>; Thu, 15 Feb 2024 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBSCoa7S51gJiaa8i6pIUfAhcYDKRAL/Dzaw/UW7/4o=; b=5D3J4Q4PIoux4wtrwEcHBcIWl3
	otCFpZdhOcwT2m8G/N3c5mCOjvAeGb8w2jZHNBhhMohwACMUfgTRknwuDcOG05oQbufsRIeY3u6Hk
	c9Wl41R44SzoCm+Sf4zfq3ED7fFs95KzWc7oQQJEzBHl1Dpje7CJDfrdTEGPvm1t0WPAqYZKLPPmW
	LQtBUWENXuP4iHA5N2+IbpS3LvEpENqwrIMGtMuNKd1uUArYWkMwjnztIzHDAYI35HQXKx7bxnuJf
	vmGHUm/t1GkUZ09pFsRfAyYRI7aARXvbH137yJzlFcGnwC1ugrHJ5q1HdVMrwWWNC8cLnxuWaW2nv
	k9sNPk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZqc-0000000G1B2-0GRS;
	Thu, 15 Feb 2024 11:24:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZqY-0000000G18s-2y31
	for ath11k@lists.infradead.org;
	Thu, 15 Feb 2024 11:24:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A96DCE252C;
	Thu, 15 Feb 2024 11:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690ADC433F1;
	Thu, 15 Feb 2024 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707996242;
	bh=eXCxHWY5sXnYQAHIrXcmuCtKtdH6fUG7bClWRU+dlzQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NYAGv80kZo+caeCIkiRoPRvW1BoCX0nRXZyDppJxxur22e30Fst74xj0wtbs+Mop1
	 Jrh4+sIdqHLQFUvWZF8aN4qyUzccCyIlF1FOjm1KKxEjXgfWkJ/xJQ4yVCG0BiSUb5
	 Q1WbbtYxN3QrepURYobnqLk2VhUjXieauJCvdoE+Vtdg2fKa85LOgd7QAk6qnA6xk9
	 AO4Gp/+rrlsCpVDQMO0rmm1Yt5DGNku2yPvvB76dTdql4aCsEbIMJ9R4VsqrTCbWYP
	 F5svmIymeWeOpE4suVekkmkJml0zTDmFq7BM7/MVV0W9hTjSk3kogge1uvHoDVM5F0
	 pTV5Bid8D6cyw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] wifi: ath11k: move pci.ops registration ahead
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240109021336.4143-2-quic_bqiang@quicinc.com>
References: <20240109021336.4143-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170799623969.3860606.1320756266938068421.kvalo@kernel.org>
Date: Thu, 15 Feb 2024 11:24:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_032407_025798_B6374B08 
X-CRM114-Status: UNSURE (   9.60  )
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
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

515bcdf587f9 wifi: ath11k: move pci.ops registration ahead
5dc9d1a55e95 wifi: ath11k: add support for QCA2066

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240109021336.4143-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


