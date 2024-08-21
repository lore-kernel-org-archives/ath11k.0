Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DFBC52D7C
	for <ath11k@archiver.kernel.org>; Wed, 21 Aug 2024 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8DQru6UN8dJs60jykvyzxdgZb0RXRlNWrUteqGq0t4=; b=jja0aH18yuj0QUbZ0LY0uYHuEL
	kcMMw1G8EyTyGz3acjQ327YT1FOPkNPa5Mnn1tfcu3pI6F1DTDZVy2jUbDHzYVVNIjA7DAWQqqB6h
	3Lop0O6rvKiyYqSdsDYy5etZR91/tRMJIuYt8ueaUSQMrnZwu9UQA6KxCLmqshFmP7PQhnCJOCVBf
	qsnkkCeZi+6Lu0YjAWybLs4okWJwH4bPd6iJCsWbA0iI+goS23RJ971QD9OIYuovRElzEfFtNxKuZ
	JzB+ejVX0hvLavW23Z25PfChnQg6fRH/0y2YxwUiWQFbhi3k7Br60OEtbNLbDxdTzK5wG0RcEzS8q
	j/JK8sKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgomQ-00000009rlc-0glq;
	Wed, 21 Aug 2024 17:05:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgomN-00000009rl7-0NcX
	for ath11k@lists.infradead.org;
	Wed, 21 Aug 2024 17:05:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-201e64607a5so48222625ad.2
        for <ath11k@lists.infradead.org>; Wed, 21 Aug 2024 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724259950; x=1724864750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F8DQru6UN8dJs60jykvyzxdgZb0RXRlNWrUteqGq0t4=;
        b=QT5JPRht/nWHSeESF/RnU3i22gHnPU2CD5ASszPRE2Dreq2LcE8BAVSzoqLbWSTOQQ
         tnBQBwFI1qgIjsulCKHlUNC8aat5YjS3uyn8JoVSyYAhq4cj38wbxUNKCG3sBRtIYaZY
         wvzQB0JsJhO5PC54vTkbsI2IKOiQk2hoaDEZ8jNvGaKqjDyhhMZeO6HCo3VcUuwDj8vO
         UMEMRchiamn3Adkb23Nr64E511nUOjIx/L4cilZG3wL82hiW37dVlA+z7tGSdWqNNFEx
         9jqgwWBXmYRSIj5SBmb0b7zazSTNy/Z3CxszjZwHtcCst24YUzSGvuK2CY3WNTOWZRHe
         WDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724259950; x=1724864750;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8DQru6UN8dJs60jykvyzxdgZb0RXRlNWrUteqGq0t4=;
        b=WsINjbHuh5fGHpDUTRH67ueRhmbRUvZMmWyEezU+0N99FqA5RPvfTmkd13yPXoU6So
         Zmt41dAFO4dMY/M+2hD5wBKNHKx4N+RiGI1v44OxW2PBNdNOL5ga+dOYzuvLJ03zUdA4
         SyyxUSKVmZdhL33KsSNLCqM7yt9ZFrllyi5yAZ6WjOcoTk88NFrjTHiDe7/7aI8hjsiv
         TrcE8CNTDQY9z1zqzVt9XbuUbGvOCcouuY0zX9/0gj1tRnDgdL4bC9k66wqXIHUMTCCx
         hOmmt4L5TPEBMdw1rN2ASRNjS2fIvwv11vtMc8FsxqE/+EkdQ2FXvP2oWAsgA4Jj9NT5
         sgtw==
X-Gm-Message-State: AOJu0Yz1njMZLkFmvbywRdqmKS5EAL2vAZC298lB2BYFKE6xP+83mKsX
	a1ZF0PIKs2k4Nunkbc1I45waFjCy6LVLRE0VaT6vuu4802iDScJ+
X-Google-Smtp-Source: AGHT+IEU75GWPV4RspaE673U+0qloLAUcZdlAdfIsvIszG9477jSA7GQmXkyDPRT3LwXfbtcmYgLzA==
X-Received: by 2002:a17:902:ecd0:b0:202:20bf:461c with SMTP id d9443c01a7336-20367d3b7ffmr34862695ad.31.1724259949927;
        Wed, 21 Aug 2024 10:05:49 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03756ebsm96099035ad.158.2024.08.21.10.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 10:05:49 -0700 (PDT)
Message-ID: <45445d1b-7e0c-4c6e-b8c7-17098586d861@gmail.com>
Date: Wed, 21 Aug 2024 10:05:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k WCN6855 seems to have incorrect regulatory info for US
 DFS-FCC (no 6ghz)
From: James Prestwood <prestwoj@gmail.com>
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <3b8c7d73-3e2e-471a-8434-61322a5746fa@gmail.com>
Content-Language: en-US
In-Reply-To: <3b8c7d73-3e2e-471a-8434-61322a5746fa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_100551_154519_39D74F77 
X-CRM114-Status: GOOD (  14.33  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 8/20/24 12:05 PM, James Prestwood wrote:
> Hi,
>
> I'm using the latest firmware for ath11k [1], WCN6855 hw2.1, and so 
> far I guess we've been lucky that the regdom has always been set to 
> 00, which apparently allows 6ghz. But recently we have seen the regdom 
> get set to US and it then has 6ghz disabled:
>
> phy#0 (self-managed)
> country US: DFS-FCC
>     (2402 - 2472 @ 40), (6, 30), (N/A)
>     (5170 - 5250 @ 80), (6, 24), (N/A), AUTO-BW
>     (5250 - 5330 @ 80), (6, 24), (0 ms), DFS, AUTO-BW
>     (5490 - 5730 @ 160), (6, 24), (0 ms), DFS, AUTO-BW
>     (5735 - 5855 @ 80), (6, 30), (N/A), AUTO-BW
>     (5855 - 5925 @ 40), (6, 30), (N/A), NO-OUTDOOR, AUTO-BW
>
> I have updated the regulatory.db from wireless-regdb.git as well, and 
> updated all the firmware (including regdb.bin) to the latest 
> available. According to the wireless-regdb tree, US: DFS-FCC _should_ 
> allow 6ghz [2]:
>
> Is there something I'm missing here?
>
> Thanks,
>
> James
>
> [1] 
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/WCN6855?ref_type=heads
>
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/tree/db.txt#n1895
>
It appears the issue was actually at the driver level. Updating to 
kernel 6.8 seems to reflect the correct regulatory domain rules, at 
least with US: DFS-FCC. Might have something to do a commit [1], which 
was sent a few months after 6.2 was released, which is what I've been 
using prior.

I now see the expected frequency ranges for US: DFS-FCC:

phy#0 (self-managed)
country US: DFS-FCC
     (2402 - 2472 @ 40), (6, 30), (N/A)
     (5170 - 5250 @ 80), (6, 24), (N/A), AUTO-BW
     (5250 - 5330 @ 80), (6, 24), (0 ms), DFS, AUTO-BW
     (5490 - 5730 @ 160), (6, 24), (0 ms), DFS, AUTO-BW
     (5735 - 5855 @ 80), (6, 30), (N/A), AUTO-BW
     (5855 - 5925 @ 40), (6, 30), (N/A), NO-OUTDOOR, AUTO-BW
     (5925 - 7125 @ 160), (N/A, 24), (N/A), NO-OUTDOOR, AUTO-BW

[1] https://www.spinics.net/lists/linux-wireless/msg236203.html


