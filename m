Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B38FC433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZp80QPvbBa0NJFHICWVWvWpAkyFEM5TSDCoCxsQ05M=; b=RwHv92AJ/XxqST
	Ep/x99RYH8vqnlezhcm3315zjMBgEZ/FhYZVjHqkOsUutF+aqwU2XZ3Q4N1abv4mGdO2hgtviTEAg
	PIGC5GQbdjj0sSjtxuPuorjEZtv+mgvclSfqylZUTVCwCi9zrM7wgTSxjab/FQVANfQP9s71nxLyR
	Auq25NmQE5MvQ3i0/xGUD9dZgiwDimaltp4awqd5Vx2nyPYkhq4H1UYHnc0vmivL6tpNEa940ba4l
	jN4gEsFNOxY8wz09cWYo/MIMDkf6xvzKmfo/o12TZ1ZHxs18WoRSyYsueyh7DmH2UdoR6iwdoeOYN
	SgmMdLKYYukFmCQxCMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mriV3-001FGJ-8l; Mon, 29 Nov 2021 15:23:25 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mriUz-001FFy-U6
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 15:23:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638199401; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=bjeNqRpZI+UZ8mmcr2gnPdAjGzdFcv/eKIbLwETZnYs=;
 b=s7rxaUTN+8PM5LZu0/t4heanufB6qzcn40bvi/DzJ/ETYRdnpBnSnqHEQ7qCUj4Sm+dTjL4Z
 QH5JoTAVwI4fQ0+MxfEtlsJp8BWZGZNDZ8LOztbLZ0PWXesTZ4gBy6pkPPEHaSquSwFcek0j
 2iWis5g4JFAYGtusVQbrnIL7YUg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61a4f068db3ac5552aed35b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Nov 2021 15:23:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 772D8C4360C; Mon, 29 Nov 2021 15:23:20 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EB340C4338F;
 Mon, 29 Nov 2021 15:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EB340C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: fix destination monitor ring out of sync
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1637061007-28663-1-git-send-email-quic_kathirve@quicinc.com>
References: <1637061007-28663-1-git-send-email-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163819939464.793.16499915763295863939.kvalo@codeaurora.org>
Date: Mon, 29 Nov 2021 15:23:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_072322_074847_2B32B73A 
X-CRM114-Status: GOOD (  10.08  )
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

> More than 20000 PPDU id jumping causing status ring and destination
> ring processing not sync. The status ring is processed and the
> destination ring is not processed. Since destination is not reaped for
> so long, backpressure occurs at the destination ring.
> 
> To address this issue update the PPDU id with the latest PPDU, this
> will allow the destination ring to be reaped and will prevent the
> rings from getting out of sync.
> 
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

No Tested-on tag provided.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1637061007-28663-1-git-send-email-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
