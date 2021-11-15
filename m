Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88761C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504AB61AFB
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 504AB61AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vP7C5HKeBiP9lYsJAB+qV5Hne86/+GhTdjNTJe9f4+w=; b=B4w6f2mBEFor3v
	M8If6Cznfxo8rF8Un36YTJTjY0BEgoMNaMHhdslR1H2022IuE7IX9vkhheKk7tdaMxiIYjXy4L6m/
	iNg0yg5EbVcfzAXZLcLhIXfHD4MIhKL6lTLVUiNt9lNZQNNRuc9Pd4gcJfg7dLzE3t9qenTQ2rPBx
	d813UMbUWf9WahZGea6I9kmbaGGFkIMI+Y2+KoUKtUCVQyxWX87gamyIO+KiwhcBEdOfDWcJfVaou
	LghmHmNB+J04X1ub0iQIQT409+ie1tuBycmUu2VtaiHb5PtW5Xu3W5GW8f88qXvBfF+WTmTQw64wv
	3WRgZDMEH6IB58j07vuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYWa-00EyxL-9M; Mon, 15 Nov 2021 09:43:40 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY7x-00Et3j-R2
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:18:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636967893; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=0KPjkVGXFtSNL20fQAvXTI0JDc16/i6zovziaDfgfVw=;
 b=pb/ozVj5SknHl0i7i9HkllZt+JsXCIqUItUZkEYN5N/hLadeeDD8BlCdNaBBsuHEDA1zlDbe
 Wroj0IjwWBpql4kY9ZXXlXw+rxkvODZNb8rVrFTjdBqYZYaaoeyt9mlAIkbtAG+4ss2nCAVc
 NxQ9rlJlzllZbp8m23sz2/eObhI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 619225d4c48ba48884ab3175 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:18:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5D7C3C43460; Mon, 15 Nov 2021 09:18:12 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 024C8C4338F;
 Mon, 15 Nov 2021 09:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 024C8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix DMA memory free in CE pipe cleanup
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636561290-18966-1-git-send-email-quic_periyasa@quicinc.com>
References: <1636561290-18966-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696788878.4767.6521409779732581676.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:18:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011814_007552_DC68118D 
X-CRM114-Status: UNSURE (   8.36  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> In CE pipe cleanup, DMA memory gets freed by the aligned address
> (base_addr_owner_space) which is wrong. It needs to be freed
> by the address (base_addr_owner_space_unaligned) returned by
> dma_alloc. So free the dma memory by the proper address.
> This was found in code review.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

31aeaf547d7e ath11k: fix DMA memory free in CE pipe cleanup

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636561290-18966-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
