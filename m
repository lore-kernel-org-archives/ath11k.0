Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1D3C433EF
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 16:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNT0eS9evrQr3nf0tpMwjJfwMcH7q0QEy6FeEmc5INA=; b=fZbvzoJIInMja1
	LzVzHmpYBnheMIe38xxCp/ZU8U3fUHW6hgs8Ywib2t7TGJ4+c0GlLQPkpx8qlliU41tWMvPrKf21K
	iYPIPKgJebjaGUDLqEirQV1LVHF+MFYNbQCStvYqukBTOS03wwosJVSWIg5zwQ+hxJ6F7opaxL5RZ
	CdvqTXMBMzIpGJMafv3P9nESoLBV1w8XLZ6ZRqqdtgPi0UvoHgCdlooO8vF72pmuoU8B3X5AsVND6
	0K8ETbeKNkQn0n3o3VO37R1q9UhiE/mPQjWjxLrTFR1th56dgwE1sE4YS2JFXOjtI166IQxN93kLD
	5xaHcATWk2N43G/5q4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSlA-0036K5-3W; Tue, 10 May 2022 16:30:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSl5-0036HI-PN
 for ath11k@lists.infradead.org; Tue, 10 May 2022 16:30:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59113617F5;
 Tue, 10 May 2022 16:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EE3C385A6;
 Tue, 10 May 2022 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652200246;
 bh=W2VdkZxWjnWqBdl46V4hOjnDzyqRvWYoxuDOHVw/4FU=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=TForav3Ysqc2U+gCsk19dfNCxzDkLnl3+KcJzULioU1+Isf2jr2UHH9iNpHzz5EsZ
 T655kzqjqgYzwjQ078c5mvhwrE1kHZe6t/pPKV1HveaM4J4jprce/G2QUBg9BB1DDQ
 cUmvuTtunkM+ECeyDt3MICMn7JYfs1MSC9cf1nuyt0x+oO9doXbjcEIvIjMPAAfEKN
 Q67d/otJUpXpU7Duf3UCeXXtkxbIj/Ud+5ZfJyjrd7nIueJ2kutpi068MRhkfhf84U
 pNdD2Fmlww/hDaFgDtrSIVJ4KUDpsGDNupR03mlM493vN3g/PP+6idXM52pzS3m7Zu
 KX4D67aa3tPQw==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: Handle keepalive during WoWLAN suspend and
 resume
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220506012540.1579604-1-quic_bqiang@quicinc.com>
References: <20220506012540.1579604-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165220024378.6768.9664084417465134605.kvalo@kernel.org>
Date: Tue, 10 May 2022 16:30:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_093047_943917_3BE6A6AB 
X-CRM114-Status: GOOD (  12.58  )
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

> With WoWLAN enabled and after sleeping for a rather long time,
> we are seeing that with some APs, it is not able to wake up
> the STA though the correct wake up pattern has been configured.
> This is because the host doesn't send keepalive command to
> firmware, thus firmware will not send any packet to the AP and
> after a specific time the AP kicks out the STA.
> 
> Fix this issue by enabling keepalive before going to suspend
> and disabling it after resume back.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0f84a156aa3b ath11k: Handle keepalive during WoWLAN suspend and resume

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220506012540.1579604-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
