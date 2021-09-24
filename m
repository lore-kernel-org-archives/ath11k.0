Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6BDC433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 15:05:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E110D61038
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 15:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E110D61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEKA49xz4MozGJ3fAdT87LaybIJGs4A8op3QrKU8hkY=; b=js14getIU3daJU
	o9UNUvnaldHZggzkEE3OfbFxhPls/74q0eDG+bYNUv/aAAJMfeTlpBO7HiTo9ttPyD4lkMhJlrZR9
	0fYhuAsH+ZBMJCOSQtsgIP+Inyx7219t11RhJu00sT5z8wai3CzWIRqBW6QE8IooMxidWQGpmx/BO
	HvtKTFglPFcoCtAe8w79OEPgTAUYyxPvaBGXYOC3+cYVE+CL5FsXBB21/kmLQxFWdbMYpLi3xh/BI
	xrOWZFjAO2upRXVtFf3XH5qSJ9J17xdc7hx8JtGgHc1hEqbwGnq9AmeFG6/qdwH+LtT/F1D1GouDM
	5rmh6lSUMSXmTfAxvcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmlY-00EvCZ-7F; Fri, 24 Sep 2021 15:05:32 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmlN-00EvBQ-IF
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 15:05:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632495927; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=eyMGPHcaqJ0znG866UUp+BkYa+NlLIG6yFmlgPsLFiw=;
 b=d7oBw86FGrBJbnB2bPOND+QxPDqfNLae76ONpG14fqIIK7VtgmBoXjjnE2vj42uMnVi/jX7K
 P5HRYlYCEn6RRfkJF1dv9/DTWRjT9lx5bQPj425l2aPUK/AkNif7DvWXZaAqDTDaOpK+x1vc
 oGqBJC9lVzDg5jzKV4H6tycgr9k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614de9186661163a57fe21de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 15:04:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ACA4DC43618; Fri, 24 Sep 2021 15:04:55 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05F91C4338F;
 Fri, 24 Sep 2021 15:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 05F91C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 4/4] ath11k: add caldata download support from EEPROM
References: <20210721201927.100369-1-jouni@codeaurora.org>
 <20210721201927.100369-5-jouni@codeaurora.org>
Date: Fri, 24 Sep 2021 18:04:50 +0300
In-Reply-To: <20210721201927.100369-5-jouni@codeaurora.org> (Jouni Malinen's
 message of "Wed, 21 Jul 2021 23:19:27 +0300")
Message-ID: <875yuqrp4d.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_080527_778401_D59EF508 
X-CRM114-Status: UNSURE (   9.62  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Anilkumar Kolli <akolli@codeaurora.org>
>
> Firmware updates EEPROM support capability in QMI FW caps, send QMI BDF
> download request message with file type EEPROM, to get caldata download
> from EEPROM. Firmware takes more time to update cal data from EEPROM, so
> increase QMI timeout.

The commit log would need more explanation how this patch works.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
