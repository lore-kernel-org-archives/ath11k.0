Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18156C433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tx/DTHBCIlrq7+lBIgafpc5uvOWRWzQ6WA9EpcMKm1M=; b=TXam7zJfUHUVTH
	CirQdUBizReRfJeFMNYT+D0ON6DrzM58BbeRzw9wxGgMNcqNRepGb9GZLNjbWC7QCzeU4m/ONGlES
	27ERK0BvTCQPbXBt1gmIw8Qp3kIfiaAqNsyvrHCNA8i+qMKUKzs6OG/uy501ME2GQayl9amn4ZeBV
	ILuEpARNuuoKsscICI8kI4pK2ih7paRo3GQgNj/DoH75r50ZoVY/aoUENScdqWIN81OchoEy9sMpF
	DI64gpUCJ/trSFUpJWHdY26GNXkaQZWHHlFqLrEMkYoxfuTemXYRDtdlYW3q40QBLssYg2jjI2VR4
	gJEBgYCcoer1sZFJYe5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mutZI-00Bxvs-Vt; Wed, 08 Dec 2021 09:48:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mutZG-00BxvR-Gw
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 09:48:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 44689B81FFB;
 Wed,  8 Dec 2021 09:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F78C00446;
 Wed,  8 Dec 2021 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638956932;
 bh=XHcDxJiV3Kg/Mwj39DHnaFrw/vR6P0Z7HjIW/2ngatw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=hDaWjZwyg8eyJGxbHOeditX6AljVyoUzbXoyC+5OAo5Tc2ki+Dhiefh01ZWXEcxev
 LCxkuv5WE7KY8u7FlskvHPyc/MuT7p3UL6srXTVgxEU45HhDtleTOwVkKxJfPHCue7
 P6NSkzzIcQ8scN+RLm1hSZ1ApWUZ+rogIxtLA/f2xnNTAMgw+Z9yWmMeNVIzEN3uiE
 vrtawyu3gm8ZjYTv+f5GeNNEL5kr+DnXt1Rsd0ZtAMVf8JYBzIxjdzS1WarKI0Luu/
 X8eXeyjfKycpAj5y7iCs5oQsOJTjD/IrexJAGf8l5gHC5iVRujZnKFHK+Q8qdErcQe
 s8R1HWaZHf2rQ==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <quic_wgong@quicinc.com>
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
 <163895135713.29041.4980786229647025244.kvalo@kernel.org>
 <463b4075-e98f-d51a-d305-a7adadc8a585@quicinc.com>
 <2239044.ZpX2dJDJjJ@ripper>
Date: Wed, 08 Dec 2021 11:48:45 +0200
In-Reply-To: <2239044.ZpX2dJDJjJ@ripper> (Sven Eckelmann's message of "Wed, 08
 Dec 2021 10:12:59 +0100")
Message-ID: <87lf0vfmv6.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_014854_717213_531E0526 
X-CRM114-Status: GOOD (  10.94  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Wednesday, 8 December 2021 09:19:28 CET Wen Gong wrote:
>> On 12/8/2021 4:16 PM, Kalle Valo wrote:
>> > Wen Gong <quic_wgong@quicinc.com> wrote:
>> ...
>> > Sven, after your memory corruption fix is this good to take?
>> 
>> After Sven's fix "ath11k: Fix buffer overflow when scanning with 
>> extraie", it will not happen kernel crash.
>> 
>> But it need Sven's confirm.
>
> Correct, it is not causing any problems anymore when the other fix was applied 
> before this change.
>
> Tested-by: Sven Eckelmann <sven@narfation.org>

Very good, thanks. I included your Tested-by.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
