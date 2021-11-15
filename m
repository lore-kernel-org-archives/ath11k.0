Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86235C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476D361AFB
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 476D361AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHIRNHKsSJi0D+n7fq7jOXcWWju2GJS1kybTlZ+3V4s=; b=ZLnmnA8Qpx3w4D
	urbTMaTWnCFFpl7UXKpKjU5G/p2RyEms17M32Zvrx5rCp4WQFncCOhXhDaHygN+elL+YT8BWw9hma
	79d5MoRbfdZvdfuk/+KB23wQuJzcAxjF7TzFy528a+J5PXGS53BDh3beNCWi0iQk6PiJVsZpfQV0P
	YZigwUWZ+rG08xHedJz40TJ6MhytzgVO6Rn9vKm/rDxK4ixicfotSBDKljA6kcvdHvYA0FroIq+O7
	FPyPVdO4Nbxe0UgtB7RsY0CEOUBXFrB4FPpdFUoPyGJo6bMCMlkIQbFWoDQ+56egqnC9wf9qVbZGi
	hWUzMaiFXUy0ZICvYWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYWg-00Ez0R-LS; Mon, 15 Nov 2021 09:43:46 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY8I-00Et3j-SZ
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:18:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636967914; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=YIn9nZprG+hyVOgHyyepe4eT3UyJA0CFsgJMKSwxkoo=;
 b=WG/TcecvSK8jfSxQekcI3+7j0a9m0RSQs1zHT7NKYdmVvFQ1UoE7bU9Uj2Itu+qk61m/M3KQ
 gyhh0qapSs7SYkF6XglML6sxPZT5HWRxF3TIqqCDzrjzOSqlg0NmhE92QGVyRRl52dTTLu9x
 ekNNY0vRPpcb8V/+/B9EimSVjE8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 619225eab3d5cb1f55c25e81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:18:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7780BC4360D; Mon, 15 Nov 2021 09:18:34 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 11E81C4338F;
 Mon, 15 Nov 2021 09:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 11E81C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix 'unused-but-set-parameter' error
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636609967-5114-1-git-send-email-quic_seevalam@quicinc.com>
References: <1636609967-5114-1-git-send-email-quic_seevalam@quicinc.com>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696791059.4767.5027079403422619483.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:18:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011835_065403_67AE51DA 
X-CRM114-Status: UNSURE (   7.17  )
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

Seevalamuthu Mariappan <quic_seevalam@quicinc.com> wrote:

> Below compilation error is reported when built with W=1,
> 
> drivers/net/wireless/ath/ath11k/mac.c:5408:22: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> 
> changed_flags is set, but left unused. So, remove unnecessary set.
> Compile tested only.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

624e0a317030 ath11k: Fix 'unused-but-set-parameter' error

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636609967-5114-1-git-send-email-quic_seevalam@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
