Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A97DC433DB
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 11:54:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69BF233ED
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 11:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C69BF233ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5lvwWC0HTUZYSjchqtsIo72EuwO1l6wxLIfg2Ojc7ec=; b=hxetsADiQLw/IJ1h4lXb3Y8h1
	jg+UNbS+2pS449ChiZzMtviqawS4Z22BdNPUZFzaYMv37pvcjhaL8XgmORJ8OIM1ExLO4OZHNJtWp
	N5oftaArwKzmK8YT5gmw4BLMTm4Ae2hOYWEGicLKz4NCgDPKhoF4AyecWJzmmP8/+XHgXwGM3baCb
	3QDfZQwEHpjbnyzdVpScmpXwPFIqceSJkzFV3C09RigzMoA6z07qDbytOkHNL9u//T8+Kd0IwC3Cg
	JyyHsxPFfmE9tmm3I6zEfna56/gtLe3eJpbz6uiVuBX8GJmYKSSwyAuZnRFWFipYGO9aBtU+hkXyA
	Ib+uAU4FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzejQ-0006XR-GK; Wed, 13 Jan 2021 11:54:32 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzejN-0006W2-Tu
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 11:54:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610538868; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=JYnFMCX+MFBog7sTnAGVb/+4cfOMV1JUDSzIlbecaPo=;
 b=us3nf8M+opRvfbirDpcU0OOo7o1uIJwq/3ryfTos03+Kyje9J5n1P8QNYTy8bf9fIn9E1Hfu
 5C/pQ1LOQ/XEN/QiFEQqFKkooBVkqAX9hL9hKfQ2lYtZmEcK0nn78ilLHMm0qoftlEbW7AzC
 TLC/iG+UmHVGgDfF1VPCkQsNqr0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ffedf742a47972bcced5c35 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 11:54:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CB351C43461; Wed, 13 Jan 2021 11:54:27 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 207C9C433ED;
 Wed, 13 Jan 2021 11:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 207C9C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: wi nk <wink@technolu.st>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
Date: Wed, 13 Jan 2021 13:54:23 +0200
In-Reply-To: <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 (wi nk's message of "Wed, 13 Jan 2021 11:40:21 +0100")
Message-ID: <878s8xhx1s.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_065430_144581_81DCECB0 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

wi nk <wink@technolu.st> writes:

>> I got the XPS 13 9310 now and it indeed had AX500. But it also has an
>> updated BIOS:
>>
>> [    0.000000] DMI: Dell Inc. XPS 13 9310/0MRT12, BIOS 1.1.4 11/23/2020
>>
>> And with that I can get 32 MSI vectors:
>>
>> [    2.758219] ath11k_pci 0000:56:00.0: WARNING: ath11k PCI support is experimental!
>> [ 2.758778] ath11k_pci 0000:56:00.0: BAR 0: assigned [mem
>> 0x8c300000-0x8c3fffff 64bit]
>> [    2.758797] ath11k_pci 0000:56:00.0: enabling device (0000 -> 0002)
>> [    2.759086] ath11k_pci 0000:56:00.0: MSI vectors: 32
>> [    3.208447] ath11k_pci 0000:56:00.0: qmi req mem_seg[0] 0x3f000000 3522560 1
>> [    3.208449] ath11k_pci 0000:56:00.0: qmi req mem_seg[1] 0x3f500000 884736 4
>> [ 3.215355] ath11k_pci 0000:56:00.0: chip_id 0x0 chip_family 0xb
>> board_id 0xff soc_id 0xffffffff
>> [ 3.215358] ath11k_pci 0000:56:00.0: fw_version 0x101c06cc
>> fw_build_timestamp 2020-06-24 19:50 fw_build_id
>
>   I did see the updated BIOS from a few weeks ago, but I've been a
> little hesitant to update since I wasn't sure what would happen or if
> I could downgrade.

Makes sense, better to be careful.

> So to confirm, the new BIOS is allowing the driver to obtain all 32
> msi vectors removing the need for the single MSI patching? Does the
> MHI / M2 behavior also change to work properly?

I have not tested these yet as I only did a quick 10 minute test. I was
offline over two weeks so I have a lot of catching up to do, but will
get back to you in next few days on these. My plan is to also test this
new BIOS with the official 5.10 release from Linus (tag v5.10).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
