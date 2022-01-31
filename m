Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A803AC433F5
	for <ath11k@archiver.kernel.org>; Mon, 31 Jan 2022 11:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oahyzC2pbXbh7rGp3Z91tteGP3/Hlnso/l0fdujz2ro=; b=vTuyzMnjQp6z7P
	hfdqEt1m2jR9AC5v0m0DbXVCPEm/lXRhPu5BLticJNsHLL0skErtVmuHEYfqzVRnYVwi/6DVUqYyp
	zbXCkcwU7HEsdYBLB8mjtqsdPIeBwu7+dey1RpwTDNIt9xjq4y6MzN04SXE6HsUKXWQq+i3q2xrAT
	EB0DDySSF0DJOqOcWojpvF4VnCRv1RohYkJEOMhqD72VGovGYvIKHwIibDWBCkDSciUH18PLsgAqw
	O33Vbt7OaMxIErOVUVSz3JHby35d7oeW3K7DxOcf2wXQZxosOvIjl1jptycfsvMYIQYFSQNYWN6x7
	OGw+ePWfu+0VEWzF7qfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUWZ-0092TM-2j; Mon, 31 Jan 2022 11:07:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUWN-0092Nj-FX
 for ath11k@lists.infradead.org; Mon, 31 Jan 2022 11:06:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F79D610A5;
 Mon, 31 Jan 2022 11:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044EDC340EE;
 Mon, 31 Jan 2022 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643627213;
 bh=98Di4x8JTahKGXUWYUezGgFzwe37jI7UVkU/JaTYaNY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=buHVF0hB5Od9AoiDQw+1FsDiMesil5w+7bj/OrzqODewYI8136gtzEKaquRBOu8ah
 RR6jdI69w490R0e29PG3uYybPnYH381vH9z8T9hihLFVjtYe2Me2LV2j9AzHggXPO6
 LClwqJwqdmdGOXMFaEycOFtJvmM1kjqk8zdExBr61cnpXD9e8mjbWgd3mWGexeaJGW
 0DQM4AE0ADPJq2wnfPi5tvo7Z5m0aDX5fCFRbfkhaBUQ+9Fiz09utv+p16sT7L/P09
 D8REIBJvfkIF4YByyFeMKENC1q5gL1bKMk0ImhOujrP0ysrR/lwbck2v63XNvjJ6rX
 rKUzPCuG0OhtA==
From: Kalle Valo <kvalo@kernel.org>
To: Patricio Ferraggi Ares <pattferraggi@gmail.com>
Cc: Mark Herbert <mark.herbert42@gmail.com>,  ath11k@lists.infradead.org
Subject: Re: Fwd: AX500 support quirks
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 <87ilu5jr98.fsf@kernel.org>
 <198d5223-0dcf-6006-407f-7f9eeeb90c92@gmail.com>
 <CAGYwnbkh=RebRnSxXy7jXyfgMUXd=VBBZPTCB2zWbAM5y40XzQ@mail.gmail.com>
 <a00b83f2-ceba-ec6c-dd41-edaa9f84a041@gmail.com>
 <CAGYwnbnJb_0B0rwbDkTseJVZvNxn_XN2dPF5rG_ni9Hoy8MXgw@mail.gmail.com>
Date: Mon, 31 Jan 2022 13:06:49 +0200
In-Reply-To: <CAGYwnbnJb_0B0rwbDkTseJVZvNxn_XN2dPF5rG_ni9Hoy8MXgw@mail.gmail.com>
 (Patricio Ferraggi Ares's message of "Mon, 31 Jan 2022 10:30:46
 +0100")
Message-ID: <87ee4ocgfq.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_030655_645353_C86844A6 
X-CRM114-Status: GOOD (  20.92  )
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

Patricio Ferraggi Ares <pattferraggi@gmail.com> writes:

> Hi,
>
> So I decided to give it a go, I prefer to dive more into Linux and
> have a distro that I enjoy using than the one that plays it safe and
> has "everything" working but I hate it.
> My Linux partition is just for my personal use (my windows partition
> is for paying the bills) at the end so why not enjoy it.
>
> I am currently running:
>
> Distro: Arch Linux
> Kernel: 5.16.3-arch1-1
> Linux firmware: linux-firmware 20220119.0c6a7b3-2
> System firmware: 3.4.0
>
> The wifi works out of the box, always connects and I haven't had any
> issues whatsoever.
>
> BT still a different story:
> Some boots I can't connect to devices, some boots I can't find
> devices, some boots BT works fine.
> When it doesn't work I get errors like:
>
> Reading QCA version information failed (-110)
> hci0: Frame reassembly failed (-84)
>
> What would recommend my next step would be for trying to solve this
> issue? I assume getting the last firmware from kalle's git would be a
> good idea? if so is this the appropriate git
> https://github.com/kvalo/ath11k-firmware?
> It would be nice if you guys could give me a few steps to follow.

From software point of view Bluetooth and Wi-Fi are separate, ath11k
driver handles Wi-Fi and there's a separate driver (and firmware) for
Bluetooth. I'm not familiar enough with Bluetooth implementation to help
much, but make sure you have the latest Bluetooth firmware. Also the
Bluetooth driver might have had fixes since v5.16.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
