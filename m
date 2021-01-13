Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0964C433E0
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 10:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 560B422CAF
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 560B422CAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wa2b8/xzuc/Roe4rCJ19giIaTwLXIHRVxiell2YY1PM=; b=aTZfYnUqNGlmUJZa0RDZBXjEF
	NjRNlGGrrD7XmlG6Z6RT+3dqKOBdSoIYoqdelupbrwdtxlhG2TLFHLTT/r2QR0g65YzPlPid9ij0g
	k6kCsuOc4zkwDxNtuuPs/LbL7L1HcpnMSbRzuN/CM0JqctcA6HHbQpL0Aq8PISWuKmchZHnyUOHhc
	Hl6Tna5ZKop7ZSSLiOkJdoqAJSRzZK8JFiOo2k4KETB2y85DcB/R2CjvxGSxSXOL3QaNvZVx3NQez
	4s+Qsr3eysX8DMfi0BcsTnRJCtIyT2NUmxBbvVAkfQhu0ZpXZ6Hs0va/XpDEc5nn/ZsspO7ma9AA0
	uQpBzmrvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdLM-00080n-6H; Wed, 13 Jan 2021 10:25:36 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdLJ-000805-Bp
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 10:25:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610533533; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=itrFVH5x7e3BhoKbNxyy+rmsI2M0wK6LPfsfEqMw9+A=;
 b=sjRSnRK0JnM2fCDca9wj2uqyALO805vp5GWSR/f9nJuQDNlm3cdjcT6hoCqanaBGhh75LABe
 Y6Xmg/GhQBGxEZE9u0oYQp5ZB6ltboKGh43uJRJhJ9bHP+akdD4m/rJ9HelVIfFWmoGtiSzW
 nBN3ANHcdS2U06T/XqEoQKdjEbA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ffeca8ed84bad354760b4df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 10:25:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D3C4FC433ED; Wed, 13 Jan 2021 10:25:17 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 863E4C433CA;
 Wed, 13 Jan 2021 10:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 863E4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mitchell Nordine <mail@mitchellnordine.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org>
Date: Wed, 13 Jan 2021 12:25:14 +0200
In-Reply-To: <87mtydwy7v.fsf@codeaurora.org> (Kalle Valo's message of "Wed, 16
 Dec 2020 17:46:12 +0200")
Message-ID: <87h7nli16d.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_052534_152501_1945713F 
X-CRM114-Status: GOOD (  17.86  )
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
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Mitchell Nordine <mail@mitchellnordine.com> writes:
>
>>> But I have now ordered Dell XPS 13 laptop and I should get it in
>> three weeks, keeping fingers crossed. That should make things easier
>> as I can test patches myself.
>>
>> Hi Kalle, you may already be aware of this, but I just wanted to make sure!
>>
>> Not all Dell XPS 13 9310 laptops come with the AX500 connectivity chip
>> (the one that uses the QCA6390). It seems that only the models with
>> 32GB RAM tend to come with the AX500 wifi chip.
>>
>> Most models appear to come with the AX1650 which I believe uses a
>> totally different chip and driver that is already well supported in
>> Linux.
>>
>> It might be worth double-checking the model that you have ordered has the AX500.
>
> I had heard about that so I did order the 32 GB RAM model and multiple
> times specified that I only want AX500. So I'm optimistic that I should
> get the right chip, but you never know how it goes :)

I got the XPS 13 9310 now and it indeed had AX500. But it also has an
updated BIOS:

[    0.000000] DMI: Dell Inc. XPS 13 9310/0MRT12, BIOS 1.1.4 11/23/2020

And with that I can get 32 MSI vectors:

[    2.758219] ath11k_pci 0000:56:00.0: WARNING: ath11k PCI support is experimental!
[    2.758778] ath11k_pci 0000:56:00.0: BAR 0: assigned [mem 0x8c300000-0x8c3fffff 64bit]
[    2.758797] ath11k_pci 0000:56:00.0: enabling device (0000 -> 0002)
[    2.759086] ath11k_pci 0000:56:00.0: MSI vectors: 32
[    3.208447] ath11k_pci 0000:56:00.0: qmi req mem_seg[0] 0x3f000000 3522560 1
[    3.208449] ath11k_pci 0000:56:00.0: qmi req mem_seg[1] 0x3f500000 884736 4
[    3.215355] ath11k_pci 0000:56:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[    3.215358] ath11k_pci 0000:56:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id 

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
