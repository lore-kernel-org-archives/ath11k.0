Return-Path: <SRS0=ASgL=OZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB1FC433F5
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 14:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6B86115B
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 14:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D6B86115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lyvx+IzrKQFA+FPqeQtuhdheLjXwImoar0N1HFchjg=; b=kP/FykKt1mGjug
	sYgvhqMIlfYgu9DFrwLpWLgN3D3FzfchMKRkyxOOB3EloDr2KoMMI04H4UjGuUAn1mgWP/JUHCugt
	2YVCLyl+/EE1PhpG+h+M8uRH/6/DD4bAul9bxqqZXtXul/fb+nbTiLzGZYgQB5V5qSHlmCzK7BfbG
	3mpm370UDX/oTlaARCFxvF/eNR1IkM3ehsw+3acN4lCu18utiCONjUKyD7ECe1+6bNODxNrJH97qE
	xim95uZlTNL45JaT8tyuek6qLpBDfDWwLDdNaH4D+UBcdASpy/Dz/LZNETUD0WcPXUY7+YeY0Vb1d
	AnbR1l730nUFSLUTKzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXl95-00AnrC-KZ; Tue, 05 Oct 2021 14:10:15 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXl92-00Anql-NH
 for ath11k@lists.infradead.org; Tue, 05 Oct 2021 14:10:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633443013; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=sAflXWHFCtPcPvvfMZVY7wWrYE1ggRKCVsd3OOu3EpA=;
 b=jntK5X0427DB3E/BXIO3RYELkiPwo8q9IhU9/hy6+QEcc3dZqufSZW/CYLsiyNYRm5Yfgaeq
 BgB1XQezrTT7mlk0THX+G5q017q73rDkYiHTa/P5L415Zjv+dw4q4x2U7BGKlNzvx8Bi3Sq2
 zSXfl7s4AXecg18n4Gohi46dPDY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 615c5cc28ea00a941f5d2446 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 14:10:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 68EE8C43619; Tue,  5 Oct 2021 14:10:10 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ED045C4360D;
 Tue,  5 Oct 2021 14:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org ED045C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: bqiang@codeaurora.org
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/3] ath11k: change return buffer manager for QCA6390
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <20210914163726.38604-2-jouni@codeaurora.org>
 <87pmsspwa9.fsf@codeaurora.org>
 <43fd66ccc28fe80b3ef00e5f1c7e6fbb@codeaurora.org>
Date: Tue, 05 Oct 2021 17:10:06 +0300
In-Reply-To: <43fd66ccc28fe80b3ef00e5f1c7e6fbb@codeaurora.org> (bqiang's
 message of "Wed, 29 Sep 2021 10:42:43 +0800")
Message-ID: <87a6jnftq9.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_071013_359015_16919A20 
X-CRM114-Status: GOOD (  11.13  )
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

bqiang@codeaurora.org writes:

> On 2021-09-28 23:14, Kalle Valo wrote:
>> Jouni Malinen <jouni@codeaurora.org> writes:
>>
>>> From: Baochen Qiang <bqiang@codeaurora.org>
>>>
>>> QCA6390 firmware uses HAL_RX_BUF_RBM_SW1_BM, not
>>> HAL_RX_BUF_RBM_SW3_BM.
>>>
>>> Tested-on: QCA6390 hw2.0 PCI
>>> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>>>
>>> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
>>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>>
>> Same question as in patch 1, does this fix a bug or is just a
>> theoretical issue found during code review?
>
> Yes, this patch did fix a bug.
>
> QCA6390 firmware expects some specific packets from WBM2SW1 ring,
> which, however, will not happen because they are routed directly to
> host through WBM2SW3 ring due to wrong configuration of RBM.

What specific packets exactly?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
