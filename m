Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D9C433F5
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOtYMVi1MhfF1Dtp2P85ujU/Q/zphbUsWst2lN60rTw=; b=VAmavxmIBAGU1J
	khLX8WcVGmkkN+hTT6CM8GybmmQXGZdcr6IwN61CuQzqpo2mqvjODY4ise3j62pOy03oz/mGF2GrV
	ARQ3OVeQLTi3FEbSliqZoGzIUmSTSD+CwmmrMlx7epOcMgkBqVDaVJiJqrhLIq5QR+3ke0SY2qRmc
	V936OZ2qoOMqlaxZFbR21VHxIuTBSh3v5sV93WgeX8YveV0vA1TJuQKxUHi2HyyUISBMGB4IVJmPl
	ZjMMZQ+NWH6p09o4PwH5ygUIBFA6VgvY5ou8P/4WRE0zS5lsXFWrg6ewAaspTt4hyjAP01G0LrZni
	bHTFYzTKWVlfKeBxWTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpvlR-005N8C-Ad; Wed, 24 Nov 2021 17:08:57 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpvlO-005N6q-AK
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 17:08:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637773734; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=yxb1QCPPnimeUoylr8y1OsQSAvXk+mRQpEio9CtKgTA=;
 b=CD7geyHMkX0HVbimTQUUWOddNRiRpTrUc2BIhbITyIOwnGPabXdKErUS6aVWGVOjoNMok2l3
 STIqxI5s3v6fdMvyvPf+sVqEdbrtbWYDT4qehkGTNSuctsXVOlf9EDbwzEr2hqgqdR8i1+2J
 wVIov/3T3wEbCXZOH/gUQQjSw1M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 619e71a5465c4a723b0c1c9e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 17:08:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 654B3C43616; Wed, 24 Nov 2021 17:08:53 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9483CC43616;
 Wed, 24 Nov 2021 17:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9483CC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Use memset_startat() for clearing queue
 descriptors
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211118202416.1286046-1-keescook@chromium.org>
References: <20211118202416.1286046-1-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Kees Cook <keescook@chromium.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163777372886.11557.5551795598856429949.kvalo@codeaurora.org>
Date: Wed, 24 Nov 2021 17:08:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_090854_456645_6755CD58 
X-CRM114-Status: UNSURE (   9.26  )
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

Kees Cook <keescook@chromium.org> wrote:

> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Use memset_startat() so memset() doesn't get confused about writing
> beyond the destination member that is intended to be the starting point
> of zeroing through the end of the struct. Additionally split up a later
> field-spanning memset() so that memset() can reason about the size.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d5549e9a6b86 ath11k: Use memset_startat() for clearing queue descriptors

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211118202416.1286046-1-keescook@chromium.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
