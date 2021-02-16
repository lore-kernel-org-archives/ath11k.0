Return-Path: <SRS0=GJml=HS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D487CC433DB
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 16:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F84D64E09
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 16:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F84D64E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PSN5qvIovWfJHpZuWwnTShEvmo5BYPcguDDnl7SZ2Qk=; b=nF0TXgSbhF4ZGG4HhbYzoZG9d
	CDX/cWd1g7UJxp+BCOIYxrzOX/mlwJAVaXmTqo9JI/Xtp7hkE6c2jB6iPMHMYb7XFBj8h5PSyMLoa
	V4XtSNQvQE8IR8xF7SlXsOaLJfVDpNr3m1IHfPWlBqO9z+UWrZSbJp6zZ+q/kJC0SdKQ61S3RhPuF
	yVC7z13AZpMp1R3BW8B1iJh9Xx4KNh2SnJBeSFheM0z6DJpniss8femdr1QxOk/p90DZo4Jq4dOkV
	IUuQzG9H04IwHrGl67ZoxNq8kWUsuJZr1ONEdFeD2welsxHDL4Q7sumBRif/lSDwyim00UfCOLxc7
	CInaNdYug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC3TT-0004q3-NF; Tue, 16 Feb 2021 16:45:19 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC3TP-0004pf-Im
 for ath11k@lists.infradead.org; Tue, 16 Feb 2021 16:45:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613493917; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=dnkRE6+ay0NaWW4qr0xA/J6CMSk1MTmUzYcYeEc+h1c=;
 b=HihjjlMY98eI5dtl4t0yPeUBv8ycQQiRFM9mlPCUsjgAxMf2PlHw/Dh2YgC0VFZcRdfgcKCw
 AvJjmQeSsipP98tvVtRjokjtdYQCebpKJAynE8W3MIkiATChbu5eBTYQnnanAsxCMzYW4vrU
 0whDRIkElTVr9K9z1mpTWeymIQA=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 602bf6954129d8cb4a734391 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 16:45:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E93CC43461; Tue, 16 Feb 2021 16:45:09 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AF465C433CA;
 Tue, 16 Feb 2021 16:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF465C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 06/11] ath11k: add static window support for register
 access
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
 <1612946530-28504-7-git-send-email-akolli@codeaurora.org>
Date: Tue, 16 Feb 2021 18:45:05 +0200
In-Reply-To: <1612946530-28504-7-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Wed, 10 Feb 2021 14:12:05 +0530")
Message-ID: <87czx0q7vy.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_114517_279651_16AA6259 
X-CRM114-Status: GOOD (  11.68  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>
> Three window slots can be configure. First window slot
> dedicate for dynamic selection and remaining two slots
> dedicate for static selection. To optimise the window
> selection, frequent registers (UMAC, CE) are configure
> in static window slot. so that we minimise the window
> selection. Other registers are configure in dynamic window
> slot. Get the window start address from the respective
> offset and access the read/write register.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Patches 6-10 are missing Anil's s-o-b. Anil, can I add them? If you
agree, please reply to this mail and include your s-o-b in the reply.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
