Return-Path: <SRS0=F7Ac=LR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3E2C4743C
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 17:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED550608FE
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 17:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED550608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRcjGAMSb3vtXokNewaAx18I/dTk71Utjrst9hGyvPo=; b=qrNybCsJNJxg4j
	ic7vAnIaDlIZOCRoNLN6Ds7788anNXPzqrsnWSVir0F1GD4YaKznbbyxiZDrosE6XARJlGbPUUCxk
	AC/5mqrotfbv8Q0Tbg9Bv/+jicAI+0s/76s6TiPMte2OLTCNJYmgAwXqyqqFj/HwmdIvN6R2wy6lw
	iWaby5dmVzDcO6SfpgvZEhIagUqQpIFhp7FjTO34zArjLGY49WIBAKjtRzq/+6iNgI0N2CQD2Pij2
	s2wWZHMXz2fYU5hRILBNqR0Ggh7u0kkg6XuNCXgbE1xnLv4fU3t8rZ2hdP2mcGfy1Jpgj023ifPJC
	wxV9eeiDADzeB0xjZkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw6hA-00BOtJ-DO; Wed, 23 Jun 2021 17:29:48 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw6h6-00BOs4-Ku
 for ath11k@lists.infradead.org; Wed, 23 Jun 2021 17:29:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624469385; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=s5Bz0eZCymv18Oj3WyVC1yQjpxs4Dm1dYfaMS7UGc5M=;
 b=OQPdeO3qL3fRrD85T7r6PAm1M7wMKgh8ea25a8FNlZVJNz042rST1AqMaUnjScBUWt0i9QYq
 7hTYhwDYR+dym2oDlINPcDHuuW0Jn2vyWQSos+W14x8bdW0SsfVO4xE4SPArgsyLW9PFXPh7
 pibo3VJeLrQr7bS0X84hWQEEyAg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60d36f860090905e160e9ecf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 17:29:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6BAD1C4323A; Wed, 23 Jun 2021 17:29:41 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C26C3C433D3;
 Wed, 23 Jun 2021 17:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C26C3C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bhaumik Bhatt <bbhatt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 hemantk@codeaurora.org, jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, bbhatt=codeaurora.org@codeaurora.org,
 lilic@codeaurora.org, kangxu@codeaurora.org
Subject: Re: [PATCH v4 4/6] ath11k: set register access length for MHI driver
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
 <20210521135152.GL70095@thinkpad> <87h7i0juxt.fsf@codeaurora.org>
 <37184e28dcc952ba9ad5ed0dc2c1a6da@codeaurora.org>
 <6ed9fe90f40e5f8151d3a028abf0acd1@codeaurora.org>
 <20210618064514.GM3682@workstation>
Date: Wed, 23 Jun 2021 20:29:26 +0300
In-Reply-To: <20210618064514.GM3682@workstation> (Manivannan Sadhasivam's
 message of "Fri, 18 Jun 2021 12:15:14 +0530")
Message-ID: <87k0mkh4ll.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_102945_454317_7A643828 
X-CRM114-Status: GOOD (  14.52  )
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

> On Wed, Jun 16, 2021 at 10:38:01AM -0700, Bhaumik Bhatt wrote:
>> Hi Kalle/Mani,
>> 
>> On 2021-06-14 10:49 AM, Bhaumik Bhatt wrote:
>> Just got confirmation that the whole patch series was tested for functional
>> sanity on
>> Dell E7590 + QCA6390 with Ubuntu18.04 and patch 4/6 is also good to go.
>> 
>> Can you please ACK and pick up this series?
>> 
>
> I can pick the series but I need an Ack from Kalle since it contains
> ath11k changes. Kalle, can you please Ack this patch?
>
> I'm planning to send the PR by this weekend.

Sorry for the late reply. Yes, as this now tested with ath11k driver
please take this ath11k patch via the mhi tree:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
