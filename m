Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92725C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 07:46:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E876523343
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 07:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E876523343
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IFAmR/L8U6sV15h0olSAa2r6Lqy/Wp7idcJQxxjpjdE=; b=pFH8KMbKsGDD9kpMtHH3NdXMa
	NtAtLy8P8JxBLsIKvbt3BC0Z7IyQuPoHpwZ8z9pZVusfjmXvNuh+MOlulxrkmoR8bLsWj5Z1SVkM0
	jlOiMlFnZbxm7zAq1LruouS26BMKPmcLu9vwpg2bFo3oAf39SB1epzqdD0lwdP1s0wXfstO/Yl60d
	FgLaYN5XrxEWVKNGN7ojBJvUj8zpxaBmUqpc5kQEWn2kxo/vfcxrSCMKRHn77NHN8WJmYs/6pKg6Q
	mU+Vf+6nm2WBzzwjhPVYto1oIKjKWCaQlm79PqrQVGRMArwE2PhvVuVbOF9QjrvlLnPOiZCnbgQ+W
	iEmVKwLqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpRVq-0007Jy-QT; Wed, 16 Dec 2020 07:46:18 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpRVo-0007Jc-K9
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 07:46:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608104776; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=UQ6G2z5a5RpM3nPLPIdnfS2xckTywSuHruXGfssLJdA=;
 b=uoi2AxxM2VMNT6GfDhKpkGmu4KlbLBB9ussrU7eH+f7988Fk0PEb4OhzzEEpuhoQ1+bo4Rzl
 R56hiMzi4n7HKMEVpP9ZlDefYq2iCjmJwj5V7e7vZ0YYtVEPbbuilIeq3hHYQ9fS6BMH9/pF
 sDHBroptCGDh2oHHOG/8gO1Q8kU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fd9bb470564dfefcdefa6e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 07:46:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BD889C433ED; Wed, 16 Dec 2020 07:46:14 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A841C433C6;
 Wed, 16 Dec 2020 07:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A841C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Stephen Liang <stephenliang7@gmail.com>
Subject: Re: ath11k-qca6390-bringup-202012140938: rebate to v5.10 and MHI M2
 workaround
References: <87blew3e4q.fsf@codeaurora.org>
 <CAHUdJJXFyNxbf7nBGxw+dsMswcVoxwbQ73U=9=3o+zM7p7kpHg@mail.gmail.com>
 <CAE+mCOEavJkcsgBvLR1z=kLUEwW9jJzVvi7hoxVrkBYj=pwKSQ@mail.gmail.com>
Date: Wed, 16 Dec 2020 09:46:11 +0200
In-Reply-To: <CAE+mCOEavJkcsgBvLR1z=kLUEwW9jJzVvi7hoxVrkBYj=pwKSQ@mail.gmail.com>
 (Stephen Liang's message of "Tue, 15 Dec 2020 21:41:03 -0800")
Message-ID: <87tusmxkfw.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_024616_722224_16AFBE6D 
X-CRM114-Status: GOOD (  19.80  )
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
Cc: ath11k@lists.infradead.org, wi nk <wink@technolu.st>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Stephen Liang <stephenliang7@gmail.com> writes:

> Uptime has been very good so far at 24 hours, no hangs. I did see a
> backtrace when associating with a different AP, please see:
> https://pastebin.com/raw/5VTAK1mp
>
> This backtrace does not appear to affect functionality and the AP
> associates just fine.

I have seen the same lockdep warning. Our current thinking is that it's
just a false warning, but we need to do more analysis before submit a
patch to silence the warning.

> Speedtest.net is giving me 340 mbps down / 185 mbps up, so very good
> throughput. I can do a LAN iperf throughput test later on as well if
> there's interest.
>
>> * name of the bringup branch tag you used
>
> ath11k-qca6390-bringup-202012140938
>
>> * if there are other changes in the kernel, patches, reverts etc
>
> Clean copy of Fedora rawhide kernel 5.10.0-0.rc6.20201202git509a15421674.91
>
>> * do you use the memmap kernel parameter
>
> No
>
>> * make and model of the laptop/computer (eg. Dell XPS 13 9310)
>
> Dell XPS 9310
>
>> * how much testing you did
>
> Mixed usage, suspend, wake, charge, discharge, etc. WiFi network
> disassociate and associate, etc.

Thank you for the report, good to hear that it's working.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
