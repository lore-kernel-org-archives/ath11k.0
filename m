Return-Path: <SRS0=PCnT=O4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE3EC433EF
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 05:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9F860F46
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 05:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA9F860F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9WSq6TmKG4O94SDGOlG2gWl1XWguBLGMVw/9i4vsqs=; b=PC5295sjzDjRh0
	QNsm4jr7RS65YIoTQPDRmg8gpAi2IpdzOdD6NIn54kqfoZYhiPXqkO/X2spkZjkwLMj5Sg3aEojDg
	rQ6ZthCo868AfDR6aj3pHfZ3XpTubFMFhAtw4kM+qeNNPjCV2NRGKzD+37gNCwqPlZJW5Ypdbo4t6
	3L1sn/XfV7/g3LB+5ypVjztlDPpc7sxwTETat/b1+b0yr6S3ZwPhHE6nXuXrb50y10796i8/BQkS2
	icT7ZvRi7QOnJiJDnZ+gpzmI8iM0n/6XRnRMbFmU+fybGmjWS5qFvihmPbJhStygjoPJbW99whExb
	9bPJd58KQ5z4ad0/VMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYior-001fbx-Ud; Fri, 08 Oct 2021 05:53:21 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYiol-001fb7-AT
 for ath11k@lists.infradead.org; Fri, 08 Oct 2021 05:53:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633672398; h=Content-Type: MIME-Version: Message-ID: Date:
 References: In-Reply-To: Subject: Cc: To: From: Sender;
 bh=rmh6oHI66td0Mu4wXsLqqmfSbirKcTqHHCrPMIVl3o0=;
 b=QWnIZXGWoIqyCNkZhAjKKnFCIvFXiZEImJQDCrbPeD7Yj/LVam6GRB0SBA0qNgaUnqjt9E2P
 kiOG+a5+VIGEOlp4OThPTEXugZ4UpfWUAx1nMtAgzMXoUxTj5mN2OvEQIOf5PBH67hR9JMVs
 MqYtDidvgDmR4+JocRvda6HHS2w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 615fdcbcf3e5b80f1f82b622 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 05:53:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CEC56C4360D; Fri,  8 Oct 2021 05:52:59 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C09DFC43460;
 Fri,  8 Oct 2021 05:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C09DFC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>,
 Jouni Malinen <jouni@codeaurora.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: linux-next: build failure after merge of the net-next tree
In-Reply-To: <20211008162103.1921a7a7@canb.auug.org.au> (Stephen Rothwell's
 message of "Fri, 8 Oct 2021 16:21:03 +1100")
References: <20211008162103.1921a7a7@canb.auug.org.au>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Fri, 08 Oct 2021 08:52:51 +0300
Message-ID: <87tuhs5ah8.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_225318_803674_9F6FCAEA 
X-CRM114-Status: GOOD (  17.40  )
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

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> After merging the net-next tree, today's linux-next build (xtensa,
> m68k allmodconfig) failed like this:
>
> In file included from <command-line>:0:0:
> In function 'ath11k_peer_assoc_h_smps',
>     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2362:2:
> include/linux/compiler_types.h:317:38: error: call to '__compiletime_assert_650' declared with attribute error: FIELD_GET: type of reg too small for mask
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> include/linux/compiler_types.h:298:4: note: in definition of macro '__compiletime_assert'
>     prefix ## suffix();    \
>     ^
> include/linux/compiler_types.h:317:2: note: in expansion of macro '_compiletime_assert'
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>   ^
> include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^
> include/linux/bitfield.h:52:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,  \
>    ^
> include/linux/bitfield.h:108:3: note: in expansion of macro '__BF_FIELD_CHECK'
>    __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
>    ^
> drivers/net/wireless/ath/ath11k/mac.c:2079:10: note: in expansion of macro 'FIELD_GET'
>    smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
>           ^
>
> Caused by commit
>
>   6f4d70308e5e ("ath11k: support SMPS configuration for 6 GHz")

Thanks for the report, weird that I don't see it on x86. I can't look at
this in detail now, maybe later today, but I wonder if the diff below
fixes the issue?

At least it's cleaner than using FIELD_GET(), actually ath11k should be
cleaned up to use xx_get_bits() all over.

Kalle

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d897020dd52d..3e7e569f284b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2076,8 +2076,8 @@ static void ath11k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 		smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
 		smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
 	} else {
-		smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
-				 le16_to_cpu(sta->he_6ghz_capa.capa));
+		smps = le16_get_bits(sta->he_6ghz_capa.capa,
+				     IEEE80211_HE_6GHZ_CAP_SM_PS);
 	}
 
 	switch (smps) {


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
