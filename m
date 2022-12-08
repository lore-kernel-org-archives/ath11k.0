Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA76C4332F
	for <ath11k@archiver.kernel.org>; Thu,  8 Dec 2022 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fvVLsMSErdbgXyBXyfHTjD4ZNbwoV1UgUOSpqxxJz4=; b=ExnZ8RXdZQ32rT
	dEzVKwJBPKmR4qwQJnltz47dRHMOp/9F9uDhVKKMyM4bzNHKVlKl85SlnQumZK3XVj9xrpv1zgtXL
	Xjd4SaLD4R32Mi6O6GIlbod5bEsq4zMsJiQNI3MHRK3S45n3hP1vmd5TtX3IBpndF4YYQamLxwNjX
	MtdJrlvFiVoWKUgIuJ4e9yLerxnoTOr2RLwzXPydsiBLhi33cPDq8QItreYzk6M8kcN663Uuyo62k
	SV3kVUYuFky3OhhJA4umx+sk4VDo77QVvWuB2wLxHwBYeM/HxTy/nxcJfZY4yJxmCvrF8wR9d9tix
	8zYbKVn6vKPlAAj8HK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3LDc-007HKR-99; Thu, 08 Dec 2022 18:02:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3LDZ-007HJX-AP
	for ath11k@lists.infradead.org; Thu, 08 Dec 2022 18:01:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72BC16200F;
	Thu,  8 Dec 2022 18:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7FBC433D2;
	Thu,  8 Dec 2022 18:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670522512;
	bh=on1+QRlIvDYz/5vEct+6S8cHbCRZt7ZeIgH6zrgyf2U=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lL0GnfOLj7hepUuca4nU42NauHke7t6Wu+6SLOm6wCja7lAjHBUNQhCrFruJBisS/
	 H19hqxZJ/crzpclqgqOJ03VSZgqDBvUQkxqN1mWAt8wj558QNge5kY6/fZtKP3cMeE
	 N8qU90FLLMI7xA0F2uNkvfRyuLI6adUWa6UJcSH1LkY9MBO22QlLGWgNwXupolTbTe
	 30JFeGdLTuSbKmvLS5lCdH7XEs5/6ZaiZrmhvVDyFYI2d6l2bGmAYH8d30AEnzRo0S
	 1WJvyO3DmNqktqSEOt+gGgJ0kWPKOO7yER3JuwFJhvt8vYP2WgFvDNVy6+vvnPHEek
	 fBMzjTXtVhlhw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix scan request param frame size warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221205192125.13533-1-quic_kathirve@quicinc.com>
References: <20221205192125.13533-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167052250860.20906.4772122739003133775.kvalo@kernel.org>
Date: Thu,  8 Dec 2022 18:01:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_100157_449333_971C739B 
X-CRM114-Status: UNSURE (   7.99  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> Following warning was observed
> 
> drivers/net/wireless/ath/ath11k/mac.c:2351:1: warning: the frame
> size of 1184 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> A local variable is declared with a size larger than 1024 bytes
> this causing a compilation warning. Change the local variable to
> heap memory to fix the warning.
> 
> Tested-on: IPQ8074 AHB WLAN.HK.2.7.0.1-01701-QCAHKSWPL_SILICONZ-1 v2
> 
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d45daa6d1a8d wifi: ath11k: Fix scan request param frame size warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221205192125.13533-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
