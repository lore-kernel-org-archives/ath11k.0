Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9C9C433EF
	for <ath11k@archiver.kernel.org>; Sat, 19 Feb 2022 18:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyVguK1CF89pW8w9Fs5UxJPnOh9+0I0ZK4Svr2uWxEY=; b=qbRLBojNynO2Ph
	PiE1Hl91DPER1geXCbqYxzypIrrnyW2KcUPPKI9WB7oFpQg7YFU4Uf2+pj35/QX3XqHe6JdHHWLkg
	c8eFfi845WnAkSItG6lqKz1IFB5Y6jrTIBT+DWxWjxx0UEUiw0dsBJ06nYUiXNkaDpiyAEt/fLXS8
	8S0nlrcCXyI9PN/wUBBcutj7+pLJOw90zyp0XgiqTQxVh9p8Cavcf3MnokpE6zsmE4fv4/rZwjFYW
	UA7WyXnoHh40BviFEuOwWCQpgJexLzmn2WzlSzlqhr7D9CadedsRpzOZ0+EZ6xu7RJXvWuEFuRv4O
	fFdr9RiDU54eKGd+D/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLUne-00HYLg-4y; Sat, 19 Feb 2022 18:49:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLUnD-00HYCP-C5
 for ath11k@lists.infradead.org; Sat, 19 Feb 2022 18:49:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8118B80C92;
 Sat, 19 Feb 2022 18:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7996C004E1;
 Sat, 19 Feb 2022 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645296551;
 bh=46HU1TDDT0+H90J3pF+Odpvtke/2r+9O2LPsk5zwzsI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=JLGREjcUAHXpcy/Hf71xQylwFCp9WXwEw9xAhl+0cEs/vHVLrKjx2Eb9PqOOwxrt9
 I38J6PAReR7GR8sGu6oxXOrsk3dmbZCkL2PTis3FigNC+lH9aqFsabArCJlQUU531p
 IFRQRCMda4Bjgi0TfPORV0R6F3gTJtOVEbGU0IB/kVpLbBx7wfXqyKYdywaJRywBlj
 uCnlfny1oX6TcPIWDLl4bjGOF4pcfH5pv/AXkQIvQSs6dsBsDrHYVq2k7MBsgSiVfd
 l+ASD1S5pBgkk8XC7R2JD9t2DrllT5mWZwhH9d+pPRvKtK9lahObLQurRSl3HCw1bh
 Pbnxx8VdnWuew==
From: Kalle Valo <kvalo@kernel.org>
To: Xell Kim <gfzmder@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: o wifi connections available in Manjaro Linux
References: <CAH=Zo0eZp+Cqw=C0PWuirKM23ptWM053=ygVRhYq0BcFGevahg@mail.gmail.com>
Date: Sat, 19 Feb 2022 20:49:08 +0200
In-Reply-To: <CAH=Zo0eZp+Cqw=C0PWuirKM23ptWM053=ygVRhYq0BcFGevahg@mail.gmail.com>
 (Xell Kim's message of "Sat, 19 Feb 2022 21:58:09 +0800")
Message-ID: <87ee3yzo7v.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_104915_666091_ACAF0C61 
X-CRM114-Status: GOOD (  17.76  )
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

Xell Kim <gfzmder@gmail.com> writes:

> Hi! Sorry to interrupt you. I'm a manjaro user and met some problems
> about the wireless configuration.
> My new pc has Qualcomm Atheros QCNFA765 as net card and the default
> driver for it in manjaro is ath11k. However, wifi service seems to be
> unavailable and there's even no wirelessLAN interface in the rfkill
> list. Besides, I should mention that the wireless service could work
> with no problem under Windows system.
>
> I've noticed an error info " mhi mhi0: Direct firmware load for
> ath11k/WCN6855/hw2.0/amss.bin failed with error -2" but have no ideas
> how to solve it.
> I also tried modprobe ath9k but it didn't work. When I try to modprobe
> -r ath11k_pci, my terminal got frozen for minutes and I had to stop
> it.
>
> More specific info can be seen in the link below:
> https://forum.manjaro.org/t/no-wifi-connenctions-available/103091

You need to install the firmware, you can find the files here:

https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0/1.1/WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0

I recommend using kernel v5.17 to make sure everything works, you seem
to have older kernel so expect problems.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
