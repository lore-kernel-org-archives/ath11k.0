Return-Path: <SRS0=G+gt=OV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8937BC433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 06:27:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CE961206
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 06:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52CE961206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7gVZImonilw13mZEZ8GSrXdoC2jpOK5oZwcFOTvqI8=; b=rughfEpHaneofg
	94buRLAUjiU7WZ7D4gxTpABTtDURVvnrJHFK2ekCtTuAoy2Wl5izmh+qrnLO/AvQFm0+JGRusJ7Ht
	rclvi7s2vfjhum9tHKrM0YQAMmqYHZihsIj7JqcJYCCdccb7YdyKSnMmyh3PxHbzYtbAJvhqcX+AR
	ZBAUzs4KlI1771pbNZEJ1OO0rFcXlrRQmbr+R4yZS6LTW4t36Ez4nRUe3D29jM67pBTVDUeFkTgsC
	JauEEn8Ghc+pzgJx1Hv3MEgLz8ddup46eUhURLY7MQr+kTKUH5DfCsIPAoN5DLvQMuUUy9ZB8qiIZ
	R2nVTqYnhvCzGpC5v66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWC0t-00GnG4-T9; Fri, 01 Oct 2021 06:27:19 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWC0o-00GnFf-Uz
 for ath11k@lists.infradead.org; Fri, 01 Oct 2021 06:27:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633069636; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=RfG9ID86HZzLxpbltn2M0RQuxe4ZDrqWD5fcitSRBvY=;
 b=vPAy7NDvzGBjYL/d0EaWKbX0VKAyXQ19SaxXPy5nmDCt/a+DLR7L3lYcR6e++9h8bMSq0USu
 btuIRqWXh+TQE1tMJTuAWAiFSXrrjCQDrGgsuLWAW/nq2dcZFI6DiD/ZgDS8L7YdHlJkEcMX
 Iv/xcrmQ6rX5oaf4eSoLVBaR2s0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6156aa2ca5a9bab6e8b42a45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 06:26:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0A8C6C4360C; Fri,  1 Oct 2021 06:26:51 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A5E7C4338F;
 Fri,  1 Oct 2021 06:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6A5E7C4338F
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
Date: Fri, 01 Oct 2021 09:26:47 +0300
In-Reply-To: <43fd66ccc28fe80b3ef00e5f1c7e6fbb@codeaurora.org> (bqiang's
 message of "Wed, 29 Sep 2021 10:42:43 +0800")
Message-ID: <87k0ixmfa0.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_232716_686752_0FD6266B 
X-CRM114-Status: GOOD (  12.88  )
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

Ok, please always describe the bug you are fixing in the commit log.
This is documented in the wiki pages which you definitely should read
very carefully, links below.

> QCA6390 firmware expects some specific packets from WBM2SW1 ring,
> which, however, will not happen because they are routed directly to
> host through WBM2SW3 ring due to wrong configuration of RBM.

Can you give higher level description of the bug (from user's
perspective)? For example, what test case was failing or how did you
notice this? I'll then add it to the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
