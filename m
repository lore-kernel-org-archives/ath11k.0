Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B772C433F5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D24076152B
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D24076152B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjO/20WcCqPpfAUn2N2W+mTZJSjlqXflw77R9Nxgqes=; b=pctgvn1NpvQobc
	stAiOmmb9bQDwoft9FnCZElviOMhxj/TeLVTcz2Q8IB6Y5Wd2sSdVbxMG5F1+fTB4TadZgV8YluMj
	wAaMHTwt4I2LWoVXmUREHbXYLYzYcjT8xFXpoUNZYOOPnj92k8Fip6xsZ219FXpALKh55bplMtj6U
	ABO3Fxf7a+Qpoxk2S6rGuS4M4ovZrXliHBopj7Rr+O3CJ6P1D0epGXZjMNP87USF+mQZiF1BWAk39
	MzjXtiIvsh+a9HzZ1Xu8U6J6rqdbynOs4kYCiQ5wmeG7UVSXUJ1Do4NMB/IIisS21Jz2x8F10zb98
	GeeTxiYynTicD7osBhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFNB-003nRV-0A; Wed, 17 Nov 2021 07:28:49 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFN7-003n3X-QR
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:28:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134125; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=uRTKDUbn59MI/DX7yiQ4Ke7Mo2N9hD+tEqivvCXbxzQ=;
 b=ZPnGr00HxOW5ikdzgNK08+J5ot5yHfu5UVlJSlbFugd3oWEpsC0u4g5uCp95X27mT5uXxpNv
 Djn6uW4GX9Budf8P+BCeJcoCclIrO/WJF+QaYO1IF+cAEpOVNrY7Jfd3/Yvw6mc2bvKZrIED
 eDP/NqQQ82jFcp8PqVRzQSgY1KM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6194af2d5bbbed1f7034694a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:28:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 17DCAC4338F; Wed, 17 Nov 2021 07:28:45 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A9871C4360C;
 Wed, 17 Nov 2021 07:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A9871C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: use cache line aligned buffers for dbring
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635831693-15962-1-git-send-email-quic_ramess@quicinc.com>
References: <1635831693-15962-1-git-send-email-quic_ramess@quicinc.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713412147.31320.14390592409999795508.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:28:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_232845_959416_6604146F 
X-CRM114-Status: UNSURE (   9.99  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> wrote:

> The DMA buffers of dbring which is used for spectral/cfr
> starts at certain offset from original kmalloc() returned buffer.
> This is not cache line aligned.
> And also driver tries to access the data that is immediately before
> this offset address (i.e. buff->paddr) after doing dma map.
> This will cause cache line sharing issues and data corruption,
> if CPU happen to write back cache after HW has dma'ed the data.
> 
> Fix this by mapping a cache line aligned buffer to dma.
> 
> Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bd77f6b1d710 ath11k: use cache line aligned buffers for dbring

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635831693-15962-1-git-send-email-quic_ramess@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
