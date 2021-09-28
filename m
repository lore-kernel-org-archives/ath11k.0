Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654E2C433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:34:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3418560FE3
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3418560FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtiNkAxy9fCFOWapa8o5qGSmWSPH21BC8Y/cK76wH9A=; b=JqMi+RWTI0tsig
	HX8DLqrATH2N8IsPGqZqznsnxSOSYnnAJ03gQBmlnZTnAXmWrpfVgdxANTYfVtnk/QgyI9dRdAdF/
	HUOrvSMGmdLir66WeIoLZrfQ2tTNq+p/FkWMecSIR5a/FQiYsdMl7SYO425B0al6af7RZ+qMpdyuA
	3vA46UOBJaJDs0hCfgNVLHhrwCNE+JCy82sV7zawlFJPyZIIpGk/bO+gsVAZVVIVMK5tuXO4Zrmt5
	xfkQWGL+9H92MDpUWytjnBLHdT2cB4+Md8N/EmtzDXhgohTu1iaLOIUqSsYztUeeVnn0fu28QNuGP
	Va9Aj1WIJcVqyaAmHuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDFp-007LbQ-1d; Tue, 28 Sep 2021 13:34:41 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDFg-007LZo-9N
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 13:34:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632836078; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=qIenvzswKXzfNvQN9kF57HKMxQNafVodnX5MHkPsog4=;
 b=wm3OLmlMCYnQnpTRt3SgquEytESSYbftsnLRgBJMRjxHknmr8ufWNsb/qSYNnFn9nUuqlGwM
 ctJaZuiMHJUTFk8+V9+HoqIjyyYTRZpTyKbT91W//I3OSdn7jFFOXgHc8EBjBKwifJLjf688
 LYcVmT77DEhwd4zL2HYuI1XPjs8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615319d53cc3a01f26a8b358 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 13:34:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 44F33C14929; Tue, 28 Sep 2021 13:34:13 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EE13CC1492B;
 Tue, 28 Sep 2021 13:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EE13CC1492B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] ath11k: Drop MSDU with length error in DP rx path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210913180246.193388-2-jouni@codeaurora.org>
References: <20210913180246.193388-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928133413.44F33C14929@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 13:34:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_063438_688941_5D11BF4D 
X-CRM114-Status: UNSURE (   8.82  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> There are MSDUs whose length are invalid. For example,
> attackers may inject on purpose truncated A-MSDUs with
> invalid MSDU length.
> 
> Such MSDUs are marked with an err bit set in rx attention
> tlvs, so we can check and drop them.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

cd18ed4cf805 ath11k: Drop MSDU with length error in DP rx path
8a0b899f169d ath11k: Fix inaccessible debug registers
72de799aa9e3 ath11k: Fix memory leak in ath11k_qmi_driver_event_work

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210913180246.193388-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
