Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E03C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:12:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D36604DC
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10D36604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giHShhxoAnmW1icN4MxHwPx2qbIBes3qbAukkjw7AJs=; b=kJsfahwUjNNzQm
	Zmnsx26NkEgzyMu1zgpaaCCUDvKk9G7pBXHHhR8O0iC59Z2ZcQF8+2f4ENSioJwOf2/2EoLrLruzL
	IgsCbrZwtb17hzG0iv8zLkupin2/OL60TAj6eEPu3uSHGhurKvZrRGi5XgvG/ap//CNl/9o7STndn
	HLsPdmGAjipkmwhwSB0GIvqxenzDwGQggwlpc2p44RegoLHGwm94utlfLAVTsZ1+wpLDN7DINMGfe
	YAkiRbYyganvIfI2w/1OEAUtievAgo5oE9sMUStQReNAE46hPHmnhZ/kRVIhbtxfrgVGlfASGEGrb
	ff9RSF/0WizCfNr8qfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV99e-006Ugy-SY; Tue, 28 Sep 2021 09:12:02 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV8qa-006M8b-Ax
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 08:52:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632819142; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=5SQVtzjt0jc8NiRFpkDOSCJnSjman+hLzxIoWiptXgo=;
 b=KR7YjFn8B3bGTIG5OPDKcvpMjpTNFFe8wun+xkXcbRiitVkeYGq/HMiOzZ+hRc4VsDmFrqhX
 Mhy7jPQKZaWf7RKXCC1KGk8labQb+HPdIZkZE7BaLiktC9Mpg7Kf+OAIuS5Er6O//wxX4n4g
 YBQLQ5xSTxQo4JgwmY76eTG3SOc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6152d7ba47d64efb6dbd7df3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 08:52:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B3E13C43617; Tue, 28 Sep 2021 08:52:09 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E641CC43460;
 Tue, 28 Sep 2021 08:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E641CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: add support for setting fixed HE rate/gi/ltf
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210721173615.75637-1-jouni@codeaurora.org>
References: <20210721173615.75637-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Miles Hu <milehu@codeaurora.org>, Aloka Dixit <alokad@codeaurora.org>,
 Lavanya Suresh <lavaks@codeaurora.org>,
 Pradeep Chitrapu <pradeepc@codeaurora.org>,
 Venkateswara Naralasetty <vnaralas@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928085209.B3E13C43617@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 08:52:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_015222_874506_33B82D29 
X-CRM114-Status: GOOD (  10.42  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Support setting fixed HE rate/gi/ltf values that we are now able to send
> to the kernel using nl80211. The added code is reusing parts of the
> existing code path already used for HT/VHT. The new helpers are
> symmetric to how we do it for HT/VHT.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00235-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Co-developed-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
> Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Co-developed-by: Pradeep Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Pradeep Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

61fe43e7216d ath11k: add support for setting fixed HE rate/gi/ltf
f552d6fd2f27 ath11k: add support for 80P80 and 160 MHz bandwidth

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210721173615.75637-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
