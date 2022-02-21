Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B15C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ID2cF4tJnHoCTQtbBGdoS3MjGpy1hgB0mAKlwvKr6wg=; b=1TAyxrL4ZUsyQL
	QkSzxvZCli0vEBwNbLnfbBZBgOJ92iDYVMPrEhxbk4v3wURJxFfJ1r4VXDSNBGvIlwZ3Iz3nbPYSH
	BtwaKAGdOtxcRvhEWc6cVklpSaFCx6ryMDsIcMoi12/hM01JdxdgjlmSwecwCmTfe+jWEq4wmrMzM
	hIJFbW1+TS5CCYvT0f8jYwPZM/PhASyKsGfYK7iU5qtl0knG/q0AMjs+Ng6PVCUVMH+ge/OBTL2qc
	p3xi/MB7Ia5oSQx4DCLn//PIMdWXwck2qEPQnbO+wlAWImEf2Dxes4mz8Zab4DQvyvR+f5iDMMAEN
	tv8o8nRFKkil9Q69x3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6Ij-0057sD-H1; Mon, 21 Feb 2022 10:52:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5vy-004vtb-94
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 10:28:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65AC460FF0;
 Mon, 21 Feb 2022 10:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BA4C340E9;
 Mon, 21 Feb 2022 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645439324;
 bh=yTf6jL73vntZaHIBChTJh2VJ4HOTz4q/XMDKDrjD3Bw=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=ByCHktconmI8ixmMLXfyosbEkfgu/TDiUnLkP5aZ7+h5ecqwjOFdlcS9rsSlRXU1O
 gN+34kG8XOpJTgFn6wfIyQH5TXOc8lgAeIQf8v4IbPrC1wL68ynkjtpgYUFLxuz/zf
 zeQ03TOfTU5SQDfFm/u1xG6lwsNkSt/2Uie1bteBfw76eWii6g2gxMC+Mi5Kqj1jkA
 CuYfryIMsQVcoDs5m2W98F42Lecikrfx3IqgxS65Hye1eCwTmX6UfRYKh2Y1becDLH
 C4gQLLCLGSaodcJL4OZIV/7R52j8rRlwICM/tTm0zemuFJblhkgjZhxOV5PVu0Xjk8
 Qoh2gA0T77AwQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Handle failure in qmi firmware ready
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1645079195-13564-1-git-send-email-quic_seevalam@quicinc.com>
References: <1645079195-13564-1-git-send-email-quic_seevalam@quicinc.com>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164543932220.26423.15078831707395923545.kvalo@kernel.org>
Date: Mon, 21 Feb 2022 10:28:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_022846_440021_F9FA9D27 
X-CRM114-Status: UNSURE (   8.56  )
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

Seevalamuthu Mariappan <quic_seevalam@quicinc.com> wrote:

> In some scenarios like firmware crashes during init time
> and hardware gets restarted after qmi firmware ready event.
> During restart, ath11k_core_qmi_firmware_ready() returns timeout.
> But, this failure is not handled and ATH11K_FLAG_REGISTERED is set.
> 
> When hardware restart completed, firmware sends firmware ready event
> again. Since ATH11K_FLAG_REGISTERED is already set, ath11k handles
> this as core restart. Inits are not done because of previous timeout.
> But ath11k_core_restart does deinit's which causes NULL pointer crash.
> 
> Fix this by handling failure from ath11k_core_qmi_firmware_ready().
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-00881-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a19c0e104db9 ath11k: Handle failure in qmi firmware ready

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1645079195-13564-1-git-send-email-quic_seevalam@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
