Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C61C77B76
	for <ath11k@archiver.kernel.org>; Wed, 12 Apr 2023 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RcAqA+soFaw/AVCaNcKle7LOmJ5rRXqymJDcEbsRtk=; b=HBDpfrCaPSsj6y
	tqfc3JwwxWVWcvzKj7YFwOkobcVpDehuJEXPrGzeETjS3iXTTwki/wPfjlpLLVR5ddmfqpHZxE+R0
	qentAwqIHRZF2a/oxAKy2FLsdl3cgIn6YpcTsZeSuJ1nwRfd9oOtVQjE4lN6fEFoINYkpWxdzrLmw
	C+raXrQh9drZ59aKOTHQ9oPOsA5zhSOHVVK5QQZqmdAYwlGqA6z7g/toqsrs5XdsmCke4gnAokvqj
	qH8NardHLEl3bzrzFINK7Ml+7c1+0VSlQSpRnO+JIxORhlbSp+qKqHEvUOACplJ7njHsX2sKT4dDY
	mtToqO52RVQCvOT6f6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXH0-002UrY-2I;
	Wed, 12 Apr 2023 10:00:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXGy-002Uqv-01
	for ath11k@lists.infradead.org;
	Wed, 12 Apr 2023 10:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96F3C63127;
	Wed, 12 Apr 2023 10:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF989C433D2;
	Wed, 12 Apr 2023 10:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293615;
	bh=fK8C2lU5H+Gru/bw6YH75nU6KIJR8dwsXYKM5NXezzc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gI3pR1stBxU5DrujSZxZtZAzlX7oL6Kxa/ksbTQDwejGXJmyjQnpmSRRfYBh3pHJ2
	 tyCTNfuSnh0Lewfuj+7sUwZFTc1JAOX1WMDyPvt67CZ32+VRJd4JiDECp1VcGAW2H+
	 GSZyGQ2hVlU9HnDS9JuWM+ZwvzzkeUT2U0QRXLqHJOgn3ePeYakFnqIrtOJxvfjmDa
	 nultbOstvpKjT0TJoQp5SlyN8sOCctzL62o1cXwPUq4Y3m77rU2NmcbLEr335EyX/s
	 wC+7Jlic3BVHa1eKwHgbXDLPZKcihiIUacJt7c2CF9DgIXWGHXBYfbH60cXvkeTd2x
	 cyZNpfoQsO3bg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Fix invalid management rx frame length
 issue
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230320133840.30162-1-quic_nmaran@quicinc.com>
References: <20230320133840.30162-1-quic_nmaran@quicinc.com>
To: Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
 Nagarajan Maran <quic_nmaran@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168129361208.14673.5430321799624017931.kvalo@kernel.org>
Date: Wed, 12 Apr 2023 10:00:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_030016_080976_8970F8F4 
X-CRM114-Status: UNSURE (   7.93  )
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

Nagarajan Maran <quic_nmaran@quicinc.com> wrote:

> The WMI management rx event has multiple arrays of TLVs, however the common
> WMI TLV parser won't handle multiple TLV tags of same type.
> So the multiple array tags of WMI management rx TLV is parsed incorrectly
> and the length calculated becomes wrong when the target sends multiple
> array tags.
> 
> Add separate TLV parser to handle multiple arrays for WMI management rx
> TLV. This fixes invalid length issue when the target sends multiple array
> tags.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Bhagavathi Perumal S <quic_bperumal@quicinc.com>
> Co-developed-by: Nagarajan Maran <quic_nmaran@quicinc.com>
> Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

447b0398a9cd wifi: ath11k: Fix invalid management rx frame length issue

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230320133840.30162-1-quic_nmaran@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
