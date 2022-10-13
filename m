Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD0FC43217
	for <ath11k@archiver.kernel.org>; Thu, 13 Oct 2022 06:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPJ5gIP1roepotsqWKbXgGFcOQAxfMFqp8I7T0zI2zU=; b=FrlWPZ85ASTKrg
	RjSVVrvuAcorklS7PzHmKj5GrCBKmfvIRFFk8uGuUR2yMpOsoiDlQ1f1qn4cBFUS/YMvv0qJ6T41W
	3bE7GI2S4QWqarUJqZvcy/FU3h0B7iWyfskbbVXadjTgCPcOqHp89u5bU5pPQ1kj5pk6Sgkfhl+a9
	V0gcivUh9jCWnaKXdXvfdEf5LeJDtf6126AgjHsS7lw1gvcQA4Ce33wKRCmTP5aEInxCPykLhVk14
	h5OuCTVrMSHFFuaF0AQuejWX7/65zgTkYRGDszJllQkHDJrSFpXEGFoFg0XDowYD0ZgXCPL1Fh9tp
	Bnxr3BGX/rnHuUB7jcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oira9-00AppX-AP; Thu, 13 Oct 2022 06:20:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oira6-00Apo3-IY
	for ath11k@lists.infradead.org; Thu, 13 Oct 2022 06:20:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2B593B81CC2;
	Thu, 13 Oct 2022 06:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A3AC433D7;
	Thu, 13 Oct 2022 06:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665642029;
	bh=SX1tJx6PksBjMTylR2yTzCL3/MT4x3kaF/Nzi8ybxCQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jvEdbDpapPyxsUIS/h4btIoqCYUMgBtVeztg+vcnXML1fgTb1D9SkwHgwWM1exO/g
	 AS6/JpoqjSzHP/crMcCDvDNzIGI9uNDu4vFaO5SZTsNpzQnBAgt+xovOPRHJzCa15r
	 j3JszvMbVQr6hVsLR78BnNIDZUatkoXujVV2HNI7ecQV9fo3Qf6kGjhayYPwFg/03l
	 9+A75DXLTTgeyZFJIhp9Tt1t+hXNPC8ss/Bk4358UW/7DcqqI3uwHfLS85JOKunRaG
	 LOaKCNtjFxMS1QiXFRnix6VVaZIZXHbO9i61VviSMLJTSh2oB5HUwURZPtbf0YKVWx
	 sBzBi9KL79q6g==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix firmware crash on vdev delete race condition
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221011095346.3901-1-quic_ssreeela@quicinc.com>
References: <20221011095346.3901-1-quic_ssreeela@quicinc.com>
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166564202593.7747.2576198553366967666.kvalo@kernel.org>
Date: Thu, 13 Oct 2022 06:20:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_232034_789712_0E2C92DC 
X-CRM114-Status: UNSURE (   7.33  )
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

Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com> wrote:

> Current code does not wait for vdev delete completion on vdev create
> failures and tries to send another vdev create followed by vdev set
> param to firmware with same vdev id. This causes firmware crash.
> Fix this crash by waiting for vdev delete completion on vdev
> create failures.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.6.0.1-00905-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3811fa1f231f wifi: ath11k: Fix firmware crash on vdev delete race condition

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221011095346.3901-1-quic_ssreeela@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
