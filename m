Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D2C4332F
	for <ath11k@archiver.kernel.org>; Mon, 21 Nov 2022 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uaL7u13xxSO2SHTTqmgqMujrm7eUlFOUKtxcqFZRMM=; b=RGb6ibF64baITl
	PUwqRDb8vDzPuHPbNvFneHVM9HXkB9R4Toh0PBtSUnWBzLyEW4I1/Icx36BAOipf7tjBsM/2xeBGZ
	PhCCg7DbWNJYHspds8smP51R9FVXgOTptKoTBolGyb1ug4ItHBGfZeKzy3rsgrJIV8P5P5w9R5znU
	JkkfJcnHISg9/QHQTnRhMMc3GRorFK0RxVpqm63QjofMCaPms5Kxd+B/N8pdiIml0Xlm5oHyg/AMl
	2ZGtlnJU3abShQ+z4zMUCQ3MKfMUJZUxdF4BfpLA+B9EC/lGhPszFsi9uJn1uXdLg6KF5rDewsBJp
	nMFKIGV395AyMPuPnTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9RR-00Fbgy-E5; Mon, 21 Nov 2022 16:14:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9RP-00FbgB-A0
	for ath11k@lists.infradead.org; Mon, 21 Nov 2022 16:14:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCE18612DD;
	Mon, 21 Nov 2022 16:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CE4C433C1;
	Mon, 21 Nov 2022 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669047278;
	bh=Obxuz5Kw2UEILB88rYZT+CJVKc/PM+QgkPzSyjFgdr8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=laIEwikYFfySQ3a6+xlI/U+ZFsTieU0ueF0GS6hfC8O8imrn/AqqVGE5yuVLdHMLp
	 /nom2nbF+soLdOwSOS3mCNrqLDr8hIOz//t6MyZfAgLpTlysdngAHoKk43/GGM2Kg1
	 JL8n8js1g17TxxOi3eqAiqJ2OKy0TWvjkTymhzwQ+6TIH6hgH2gatt9QIaguM2lR2Z
	 Uj9VcYkyJylxFTSeDFJCA/RxHB75WCq+SKWHvMTjqXsrQPGTAoN02ytaFpavGcDQb7
	 +ArZajJMkCaCZzp8RJBpE19QU+xReH7rCjkQgAIuAC9pIY+rv0PxOIMoA1cYQJqvES
	 bjobHpQmtKkxQ==
From: Kalle Valo <kvalo@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath11k@lists.infradead.org,  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: WCN6885 crashes on Xperia 1 IV
References: <34956280-4716-d24e-1b2e-01be3366b605@linaro.org>
Date: Mon, 21 Nov 2022 18:14:35 +0200
In-Reply-To: <34956280-4716-d24e-1b2e-01be3366b605@linaro.org> (Konrad
	Dybcio's message of "Wed, 16 Nov 2022 16:07:26 +0100")
Message-ID: <87o7t08etw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_081439_409135_57BC9802 
X-CRM114-Status: GOOD (  16.11  )
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

Konrad Dybcio <konrad.dybcio@linaro.org> writes:

> Hi Kalle, Dmitry
>
> I recently got Wi-Fi to work on my SM8450 Sony Xperia 1 IV (with the
> help of Dmitry), but I can only get it to function using very old CrOS
> firmware [1]. Linux-next fw breaks for me in the same way that it did
> for Dmitry here [2]. There is however also the fw shipped with the
> phone (not sure how redistributable it is, you can extract it from the
> OTA [3] update by running simg2img from android-tools and mounting it.
> You will find it in image/):
>
> - amss20.bin (renamed to amss.bin)
> - m3.bin
> - board.e[0-9af] (Dmitry gave me a hint that I should choose board.e8d
> based on the reported board_id; renamed to board.bin)
> - regdb.bin
>
> Using this set of firmwares I get a veeery long and unpleasant set of
> crashes [4].
>
> Any ideas where to start tackling this?

So if I'm understanding correctly, you are using ath11k firmware but the
board file from the somewhere else? That won't work, the ath11k firmware
has it's own board file format so you cannot take a board file from
another driver.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
