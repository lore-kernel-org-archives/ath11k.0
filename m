Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2487C433EF
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 13:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9CC760F0F
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 13:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9CC760F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fafTuDhv0X+ZCQLhKgnJ4EBoCHZ3BnogkiiEgWMoyc8=; b=cl17F2OimJD+Tl
	5S752RyCrdEXGr6j0ZsTd6MsFgWC+tvR673emnr/vgRjWHP8Ev386L138HrbL5vsM99hocJbFFNJ/
	ODYSDpnF9XowQPKQWETaT4Sa3sRfsTfvt8LiSbEnWjhym9WymZYW10f5L3Bg8isQjf5X7Y4Z5kxfV
	ewFR6rDJITDwEwnSmazX4kBa8T0xz/QuxLH+KGkFJDEhRJzQyqaJhtivSV992a3nWGEL1r/h5sAXV
	fhYAw4mL8L2pJ+IdaA50BIUaw5iddcQsUWi4024n+t1c/HdDW4kr8mNIY5K7+QMeZdK12uF2x84xH
	9FFafaZ4wQ+zWQwj8jIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezcN-00GTuX-Bh; Mon, 25 Oct 2021 13:02:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezcJ-00GTtl-MB
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 13:02:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635166940; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=bNVnuQryzLAZ411TWplun3SNdrSAWKLeEU32LDW4Olg=;
 b=kEyyrpiQO5PmNMwRZve4Y1uOZ/T3+qGxtp2LJG4et9K14GAMnhokuLxDUFEURIB+mXH8zBLR
 mlHHwy4uCV8VdxwxHB9NVw9pm2qOc3vUhsUIYUs0UUcmmf6bhsfhQ6SBHz01MHSRc4abQa3t
 /GyaxLVWRjlGd+PlrSaLTWtR+yU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6176aad5fd91319f0f07d9a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Oct 2021 13:02:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A87F6C43460; Mon, 25 Oct 2021 13:02:12 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34623C4338F;
 Mon, 25 Oct 2021 13:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 34623C4338F
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
 <87a6jnftq9.fsf@codeaurora.org>
Date: Mon, 25 Oct 2021 16:02:06 +0300
In-Reply-To: <87a6jnftq9.fsf@codeaurora.org> (Kalle Valo's message of "Tue, 05
 Oct 2021 17:10:06 +0300")
Message-ID: <87r1c99s1d.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_060220_912632_B7B07C41 
X-CRM114-Status: GOOD (  11.08  )
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

Kalle Valo <kvalo@codeaurora.org> writes:

> bqiang@codeaurora.org writes:
>
>> On 2021-09-28 23:14, Kalle Valo wrote:
>>> Jouni Malinen <jouni@codeaurora.org> writes:
>>>
>>>> From: Baochen Qiang <bqiang@codeaurora.org>
>>>>
>>>> QCA6390 firmware uses HAL_RX_BUF_RBM_SW1_BM, not
>>>> HAL_RX_BUF_RBM_SW3_BM.
>>>>
>>>> Tested-on: QCA6390 hw2.0 PCI
>>>> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>>>>
>>>> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
>>>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>>>
>>> Same question as in patch 1, does this fix a bug or is just a
>>> theoretical issue found during code review?
>>
>> Yes, this patch did fix a bug.
>>
>> QCA6390 firmware expects some specific packets from WBM2SW1 ring,
>> which, however, will not happen because they are routed directly to
>> host through WBM2SW3 ring due to wrong configuration of RBM.
>
> What specific packets exactly?

We discussed this internally and I now changed the commit log to:

ath11k: change return buffer manager for QCA6390

QCA6390 firmware uses HAL_RX_BUF_RBM_SW1_BM, not HAL_RX_BUF_RBM_SW3_BM. This is
needed to fix a case where an A-MSDU has an unexpected LLC/SNAP header in the
first subframe (CVE-2020-24588).

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
