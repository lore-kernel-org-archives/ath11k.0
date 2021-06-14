Return-Path: <SRS0=4E4+=LI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ECAC2B9F4
	for <ath11k@archiver.kernel.org>; Mon, 14 Jun 2021 16:24:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BA561378
	for <ath11k@archiver.kernel.org>; Mon, 14 Jun 2021 16:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1BA561378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahDcyHh4IBTUBdTjXfAK9pQ7M52swHByvwidiHoE89M=; b=INRFHtONB7sULE
	+j5NfHKuHopiCNt90pD5XrepdxejY4zWu53Ep59KJC1gsTACwQlTEuSd0HB3syA2qYzi4LbND/1pL
	Rp2lCiRF491H42VjDFXUUmo6HVnEBEqvmZhNkDl0rq8+EGZOcdIXJyscgNtV15yYD+f7zMRwNy4vD
	UpFEi+EBbQsXqpxzb2WTZuF3927mXs585+5XkL+PDtWc9R8xQJFSj1URSirSBHO2QTpdBjQJfJlBi
	BkNyD94jRNxYRqwJlmMpdMVH0B/EktNbbP2u1a/9TFNK+rfjg15IQ6Y8JCyJejyew6fdCvS3Rs1u4
	RpiA9gYzzMYZjijYbA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lspNX-00F6V4-UO; Mon, 14 Jun 2021 16:23:59 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsp3i-00EyPA-Pe
 for ath11k@lists.infradead.org; Mon, 14 Jun 2021 16:03:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623686614; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=h/MYTAGzh1yqIwqzV/V7jJRRMLxM6iJicH91XeZOxsI=;
 b=Vv3WH5znzwImHuHCx41noVt5st3KjRzuroj6BiHc3L7ZkgtrkBUrfQAb7OpuN1pZmODsNXqf
 nf3VWNdfB1nMpE/PkCNtmVcnS+8ssmE2AncsPy7/Q9yvEZx7AxB5HrC4B50zooihi931VmbZ
 OFR3haERDx/USlWJdUXhRPpIlkE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60c77db2e27c0cc77f903cd9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 16:02:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E21E1C4338A; Mon, 14 Jun 2021 16:02:57 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F07B8C43460;
 Mon, 14 Jun 2021 16:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F07B8C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bhaumik Bhatt <bbhatt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 hemantk@codeaurora.org, jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
Subject: Re: [PATCH v4 4/6] ath11k: set register access length for MHI driver
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
 <20210521135152.GL70095@thinkpad>
Date: Mon, 14 Jun 2021 19:02:38 +0300
In-Reply-To: <20210521135152.GL70095@thinkpad> (Manivannan Sadhasivam's
 message of "Fri, 21 May 2021 19:21:52 +0530")
Message-ID: <87h7i0juxt.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_090334_907170_F133DD52 
X-CRM114-Status: GOOD (  18.24  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Thu, May 06, 2021 at 12:51:43PM -0700, Bhaumik Bhatt wrote:
>> MHI driver requires register space length to add range checks and
>> prevent memory region accesses outside of that for MMIO space.
>> Set it before registering the MHI controller.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> Kalle, should we do immutable branch for this patch or I can pick it up via MHI
> tree (if there are no other patches expected from ath11k for this controller)?

I'm not expecting any conflicts with this, and if there are, they should
be easy for Stephen or Linus to fix. So it's easiest to route this via
your tree. But I'm not giving my ack yet, see below.

I'm worried that this patchset breaks bisect. Every patch in the
patchset should not break existing functionality, what if only patches
1-3 are included in the tree but not patch 4? Wouldn't ath11k be broken
then? I didn't review the whole patchset, but I suspect the fix is to
include the ath11k change in the actual mhi patch which changes the
functionality. So that way we would not have a separate ath11k patch at
all.

Also I'm not able to test this patchset at the moment. Can someone else
help and do a quick test with QCA6390 to verify these doesn't break
ath11k?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
