Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A52CC4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 07:41:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB8F23370
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 07:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB8F23370
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WN+mqTYv5reI2EZLLjWkD/K2i8CWM0CZKXKurTV7H7A=; b=QiHGoA6CUFj+W6cPGELkMmJbs
	ZN5x8oA9aJ6CLJGJ5+5+YSdngmBN9/ChLwHH/D/D92b7FwPpeLa4IHbcUtwIGtUqHlGWeA+kD00XT
	ymr1lc5F0DKaCEnv8+LWi8VScHuvuHMIq4B0R5+z/48vXNT6YSCJe6Ty+T/PEm+9B+1lil6+0elT0
	eo9GxjyuOlbphBoRZh9OqRE0Tq09oCfRaDh5tRlM93xKnwTt8QaHlEjfsXsf+aAYcKQq+yDW7wK6V
	rFGsO7EDDFBeWot42lrB3/W3k9SpJ5x9NnBYiMPuyNUamCGhq0VaGoUxX2pI6kZc18ykyELoxOQte
	7hgCovXhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpRQp-00074F-U4; Wed, 16 Dec 2020 07:41:08 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpRQj-00073p-Sb
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 07:41:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608104463; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=T6S2uL0jAsR77E4Tvjclbou5gUZbYPX5/R/r3BydnX4=;
 b=jb/LyDwl12BUrQ3bDXIwhaw+qkTxZGGlFMsvGxxk1EyOryAqfnnuq9gq203onvUeWWnqhoYR
 wMN1Q5ZPrEo0C/3JDRwgMrMAmZGI88u86YEJ58QDI+dem4fXOear5gvnc1KChQ7GKRzCa6zv
 dgl379+NckTI+OTpZ2tKblXYXco=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fd9ba08f5e9af65f84cad43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 07:40:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0230DC433C6; Wed, 16 Dec 2020 07:40:55 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EC707C433CA;
 Wed, 16 Dec 2020 07:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC707C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Thomas Krause <thomaskrause@posteo.de>
Subject: Re: ath11k-qca6390-bringup-202012140938: rebate to v5.10 and MHI M2
 workaround
References: <87blew3e4q.fsf@codeaurora.org>
 <1a319f2b-f1b1-4575-d85d-a4c95c67da1e@posteo.de>
Date: Wed, 16 Dec 2020 09:40:51 +0200
In-Reply-To: <1a319f2b-f1b1-4575-d85d-a4c95c67da1e@posteo.de> (Thomas Krause's
 message of "Mon, 14 Dec 2020 13:28:48 +0100")
Message-ID: <87y2hyxkos.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_024103_763921_5315754C 
X-CRM114-Status: GOOD (  26.88  )
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
Cc: ath11k@lists.infradead.org, wink@technolu.st
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Thomas Krause <thomaskrause@posteo.de> writes:

> Am 14.12.20 um 10:56 schrieb Kalle Valo:
>> (Bcc: people reporting qca6390 problems)
>>
>> Hi,
>>
>> there are updates in ath11k-qca6390-bringup branch[1] and the new tag
>> is:
>>
>> ath11k-qca6390-bringup-202012140938

[...]

> just compiled the kernel with the attached settings and even with the
> messages in dmesg, it seems to work extremely well on my Dell XPS
> 9310. In addition to use the updated bringup-branch, I also updated my
> BIOS to version 1.1.4 and disabled the "Fastboot" mode in the BIOS
> setup.

Unfortunately the new BIOS still has the DMAR bug:

[    0.050968] DMAR: [Firmware Bug]: Your BIOS is broken; DMAR reported at address 0!
               BIOS vendor: Dell Inc.; Ver: 1.1.4; Product Version: 

And ath11k only gets 1 MSI vector:

[   16.085779] ath11k_pci 0000:56:00.0: MSI vectors: 1

>> In the reports try to include at least:
>>
>> * name of the bringup branch tag you used
>
> ath11k-qca6390-bringup-202012140938
>
>> * if there are other changes in the kernel, patches, reverts etc
>
> No code changes to the kernel, just some kernel configs enabled as
> previously suggested (see attached config).
>
>> * do you use the memmap kernel parameter
>
> This kernel parameter is not set explicitly in the boot options
>
>> * make and model of the laptop/computer (eg. Dell XPS 13 9310)
>
> It is the Dell XPS 13 9310
>
>> * how much testing you did
>
> I tested both the Wifi and also connected some Bluetooth headsets
> simultaneously (and streaming some music and downloads to stress test
> both connections). My tests ran for about 45 minutes, in which I put
> the system to standby three times and also did some wandering around
> in the hope to have a handover between different access points. During
> all this time, the connection seemed to be stable, even if the Gnome
> Network Manager sometimes reported a question mark as status. Also,
> both Wifi an Bluetooth were available after each standby.

Great, thanks for testing. This is good info.

> Thank everybody involved for their work on this, if there are any out
> debug outputs or configurations I should share I would be happy to.

A big thank you goes to wink as he has been doing extensive debugging
and found the workaround to disable M3 MHI state. Great work!

Though I doubt we can upstream the MHI workaround so we still need to
find the root cause for the problems with 1 MHI vector patch. So expect
more testing requests from me in the future :)

But I have now ordered Dell XPS 13 laptop and I should get it in three
weeks, keeping fingers crossed. That should make things easier as I can
test patches myself.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
