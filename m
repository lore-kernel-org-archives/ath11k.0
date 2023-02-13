Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85801C636D4
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPHkSsxV6IDBfC6J2bisxbj7J1U0Sym7XlVDkTnA/9Q=; b=zfVmQWw2Z/7utD
	TMlZfou5Ob2pBybFf9QDRCjIAl7J+B1jdtKGxwpf+iw1N82h59qNFZqG7gTsaN9+mlGTO45GrPynq
	0Jsy654z3hCBs2CeHNnRCPsDG79cwvbQ7oEh3s2f8glahv4kBb9Yw8NEiqbfa5BKaoHThpiWnLRRI
	kzLbdUjQn7YukXD9RkVGancDzmld7VI1zTYnQDkv95FMzpjCAWFG4gBCumY9jypIrvzNPrRgH1o9d
	NoqjO3G/ThdXghtmmYvCvUWcF6XByVweoJBv1TqDBoTOLmdpmVpIgEnvbThINr1RFxgPirM0xS/1m
	8rRH8gNNk/USpzhX9w0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXrs-00EccR-If; Mon, 13 Feb 2023 12:23:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXro-00EcbV-FB
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 12:23:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA70E60FF2;
	Mon, 13 Feb 2023 12:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7191C433D2;
	Mon, 13 Feb 2023 12:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676291011;
	bh=CB1CTbyVWy55UbrgOxtn957brP3FUMxMTsNLEP8SFKw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=b2F8YMtgNiDuXrLecwtmGtifA+LNrC248U0BFYTq9+pZ2gIHqcUGEWXrOFJJ4aAIh
	 lEsNv4ttAgZ3GK2a/W4KWCKL7bRZw4qFakJYXe8mQTfJME2FdB9UtuJ6Lkud5DL4Jw
	 8NfuQdj6wv2LJcq5MghEi5TljjTgXZu9p7ovIQGVdBSqfHYYl1jxSwhR4WQNdGSMXa
	 3yDr7GRq+nUBfyBx6Ju1Hz+YLRW/aux1JsEAVzve+5eDoa/m+4AxUxQNCqKKXXwY72
	 waB0LqwcGYN2CLhDdiaNdmi5rloPM6oD2fpZt89SPdcVharIFY1bsMydv2JHsJsztg
	 02IGOpVBmn+/w==
From: Kalle Valo <kvalo@kernel.org>
To: Carsten Hatger <xmb8dsv4@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: FIX: Frequent wakeups on HP Pro x360 435 13.3 inch G9 using Qualcomm FastConnect 6900
References: <CACp=KFTTOpKzDkMuGyYm3ynF53nqHLwdAqt79mMJLpCyTyy-Zw@mail.gmail.com>
Date: Mon, 13 Feb 2023 14:23:26 +0200
In-Reply-To: <CACp=KFTTOpKzDkMuGyYm3ynF53nqHLwdAqt79mMJLpCyTyy-Zw@mail.gmail.com>
	(Carsten Hatger's message of "Tue, 7 Feb 2023 14:47:39 +0100")
Message-ID: <87y1p1vjnl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_042332_565939_98E8C288 
X-CRM114-Status: GOOD (  11.94  )
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

Carsten Hatger <xmb8dsv4@gmail.com> writes:

> To whom it may concern:
>
> I was experiencing frequent wake-ups from s0i3x on a HP Pro 435 G9
> convertible [1] using the Qualcomm FastConnect 6900 SoC [2]. The issue
> is related to FW revision
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9 that comes
> bundled with Ubuntu 22.10. It appears the SoC increasingly triggers
> wake-ups after being suspended for approx. 4 hrs.
>
> Read the full story at [4].
>
> The solution is to upgrade SoC firmware to rev
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23/ [3]
>
> Best regards,
> Carsten
>
> [1]
> https://support.hp.com/us-en/product/hp-pro-x360-435-13.3-inch-g9-notebook-pc/2101144107/document/ish_6053745-6053789-16
> [2] https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6900
> [3]
> https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0/1.1/WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> [4] https://gitlab.freedesktop.org/drm/amd/-/issues/2377

Very good to know, thanks for the info. I'll try to submit that firmware
to linux-firmware ASAP.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
