Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A0FC4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:50:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B432222D74
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B432222D74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QUMysL7/4O+grZTn8kiwMoO0hSZwMPHTZxnqH8WqqbE=; b=VCEshAicDPElpSmfzKZO0Rj60
	CJMi8UNxnODYMdwJPENPysOPzt1hUp6x8CKIrZ8COYTl8qF8oDd/ZdfMWaIlecJiZndg1L8fYQ7Dg
	6sktWwoPN4sbFD6kyeLQ/NVAWVUZJ1R2X1I+ISc6UzOGvo1ndEre6+WEbUXqOnqQUXnMviaVs74WD
	ikeD1BQlp6aDycxdBWiMYlO7kCDKo3P8/ETequqGFArpQUskXxfQYRdidQzA4ykOTu7Y6+2O3fA9Y
	KgdSj0DSrqDtYQ4eteOUjUFW7RUUY3cBwYcZZxoFk0maM9fjsbn14svdu4FeVFIEx2JZfhvEDTgSB
	I8FhbK2sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSW5-0005zr-OG; Wed, 16 Dec 2020 08:50:37 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSW3-0005zX-8Q
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 08:50:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608108634; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=rARqGt45QEcCUwYjpzKbN9Zdy0Yief/LpnbIf5d+8Gw=;
 b=qO52gMI0FTHzfmmJ1pAf2BzXtyyArF7vSk4m0+bXtH2qU9kdQuxliVzZy8WbX0m95WK6qw8u
 p8adjcggmKWV5i6C5nB6mfrNPex5169NjSfHyBwH2vhUN9CvdXtWynnZkDcwszxPA8uWnqDW
 73DJ/AAC2/UJp/EEDX+MyUSdzeI=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fd9ca5a0564dfefcd1094c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 08:50:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41CD9C43462; Wed, 16 Dec 2020 08:50:33 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E95B4C433C6;
 Wed, 16 Dec 2020 08:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E95B4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mitchell Nordine <mail@mitchellnordine.com>
Subject: Re: ath11k: QCA6390 on Dell XPS 13 and kernel crashes
References: <XEttDWCeuyBOzI9ypOwPDrgK-gUENAtY06t0CLx9viSsEPSQ6RAibULAYL2Vl_DuxN1HXhqlRlsmhdZstp1aoh8wrT_YZt8arK6PuS457Lo=@mitchellnordine.com>
 <87mtyn9dx0.fsf@codeaurora.org>
 <CAHUdJJWNSKw9aAHQBc8Ftne1J+s5KdVfdMLwgWu+g-ZfeDnitA@mail.gmail.com>
 <CAHUdJJXiDUc7ovAo8KbWxo_FEdniN4hXo67M9w6979QdNXeMfA@mail.gmail.com>
 <CAHUdJJXsduncuuA-Q=4A0mo=vO9z2zBe0=x5SBd7+J1eSQKZ8Q@mail.gmail.com>
 <874kkr4mba.fsf@codeaurora.org>
 <CAHUdJJUQmRkh2vAFksvnSqwN5hk58O8Smrf_-PSfwaJwC+D2CQ@mail.gmail.com>
 <CAHUdJJW_M1p0QWND1nS-WgZ2ZV8sWt-qipwCxmUzuRKXr-x6uw@mail.gmail.com>
 <CAHUdJJWymU7MT=B-xMTQeVKj2RtE9sAGzrBEcETg+0a2NN83+w@mail.gmail.com>
 <GEqEHwkxcbfwllceC1TRVJLtj8Dmwp8siybWHHJNuiG4DSh9Ovh293KwSJfMwfykp1ToCm3Jh_hxLlNr-XaNNsMJFvErV3vjVXfOrXgprJw=@mitchellnordine.com>
Date: Wed, 16 Dec 2020 10:50:28 +0200
In-Reply-To: <GEqEHwkxcbfwllceC1TRVJLtj8Dmwp8siybWHHJNuiG4DSh9Ovh293KwSJfMwfykp1ToCm3Jh_hxLlNr-XaNNsMJFvErV3vjVXfOrXgprJw=@mitchellnordine.com>
 (Mitchell Nordine's message of "Sun, 13 Dec 2020 00:59:48 +0000")
Message-ID: <87lfdyxhgr.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_035035_352609_EE671876 
X-CRM114-Status: GOOD (  20.75  )
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
Cc: Stephen Liang <stephenliang7@gmail.com>,
 Carl Huang <cjhuang@codeaurora.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 wi nk <wink@technolu.st>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Mitchell Nordine <mail@mitchellnordine.com> writes:

>> > Ok I tried to boot 5.10-rc6 with
>> > 59c6d022df8efb450f82d33dd6a6812935bd022f (single msi) and reverted
>> > 7fef431be9c9. With this kernel, I can't get the wifi adapter to come
>> > up, but no freezing. I receive this consistently:
>> > [ 23.959920] mhi 0000:55:00.0: Requested to power ON
>> > [ 23.960058] mhi 0000:55:00.0: Power on setup success
>> > [ 24.362295] ath11k_pci 0000:55:00.0: Respond mem req failed, result: 1, err:
>> > 0
>> > [ 24.362303] ath11k_pci 0000:55:00.0: qmi failed to respond fw mem req:-22
>> > [ 24.374433] ath11k_pci 0000:55:00.0: chip_id 0x0 chip_family 0xb board_id 0xf
>> > f soc_id 0xffffffff
>> > [ 24.374438] ath11k_pci 0000:55:00.0: fw_version 0x101c06cc fw_build_timestamp
>> > 2020-06-24 19:50 fw_build_id
>> > [ 25.450139] ath11k_pci 0000:55:00.0: failed to receive control response compl
>> > etion, polling..
>> > [ 26.474154] ath11k_pci 0000:55:00.0: Service connect timeout
>> > [ 26.474163] ath11k_pci 0000:55:00.0: failed to connect to HTT: -110
>> > [ 26.477247] ath11k_pci 0000:55:00.0: failed to start core: -110
>> > With the latest bringup and my patch to disable M2, I'm still booting
>> > and operating reliably.
>>
>> I took my bringup branch and merged 5.10-rc6 into it. It merges fine,
>> and seems to be stable as well.
>
> Nice find wink, I've been running your patch that disables the MHI M2
> state on my XPS 9310 for the past few hours and wifi appears to be
> running smoothly for the first time.
>
> The wifi symbol in the top right menu (GNOME 3 desktop on NixOS) does
> show a question mark for some reason, but otherwise everything appears
> quite stable so far.
>
> Perhaps its worth running git blame on `pm.c` and seeing if the
> original author of the MHI state machine might be able to shed some
> light (if they remember)? Would it be inappropriate to cc them into
> this thread? I'm unsure of mailing list etiquette here.

I started a new thread and included MHI developers, hopefully they have
more insight what could cause this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
