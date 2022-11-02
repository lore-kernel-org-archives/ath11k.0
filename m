Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DECC433FE
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOBQH1OpcHp6iPe60memoxuvLYDuRiXw2sG7qXESK/Y=; b=d8oEQ2MAeXwO52
	jQblzWayQXnWnTeJQ5gtxJdPbk24FZCFhKhhhDUvKzEWQjDdARd7aaKln/9W2a+cjjSCoKvRyuyMQ
	cBZOVcIXcvfCtT7U+9GckWVzseGQaKurrVzh4pqF7iSZR35+zD4azo1KVHBHJSLXoL7r1/EYEh6yM
	Ggc75292pRIrz0EwRspFRMWdyqgGa6g8V+5pyy9n+iKUzar4Ryjlhwsy8UwsO3ARZe+t00PBb9o3D
	NtVcWIk2QwQEvelX2chZwIPPqzk226XqJuAlmBkEQL/QshNkLMYQ4ROFknxgw+hVE9N39AEGPf0Ru
	1tOVMbSkfvlWRC0WZ+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqH7u-00CL5X-49; Wed, 02 Nov 2022 17:02:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqH7q-00CL4K-RJ
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 17:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26F2361ABD;
	Wed,  2 Nov 2022 17:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37701C433C1;
	Wed,  2 Nov 2022 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667408521;
	bh=hjt4xmcq6xQSV0fwgwWJCPwgRnFiT04TEVb3VklGpT8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=rGHF6JkvkSHmUhGxg9iyKD6gGW7ZHOkh4FOW0kQ295ScCdcu1cu6MvuP19atMBUmq
	 no1zY+fvK30Lmh2G0zkujQW+wXwtsNfp22wUtFeH9j8KxRzWXa2lxK+eWbepiaqSZV
	 /SS6Xsu7MeJLeR+yizeER2V6P1vmOGxJyCHGe+GAIpvK3UpVtfrQEwtEzrxQc8sTUT
	 xP/ayyI6rRn27odCmwYbsXAn7+xdp4/nm0eWC/c98sGTPVTKHGAqtRROYFAkW+siRg
	 kwRs+R/RHMkYWTW4ha56PpVFL7tIQqJKV5tIKgdBbKg7FhzlRyUtrBkGVnoL/KEzFn
	 2xfwT/nnGuRRQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Trigger sta disconnect on hardware restart
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221102061423.1032-1-quic_youghand@quicinc.com>
References: <20221102061423.1032-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_mpubbise@quicinc.com>,
 Youghandhar Chintala <quic_youghand@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166740851734.26077.10462970085577578665.kvalo@kernel.org>
Date: Wed,  2 Nov 2022 17:02:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_100202_994773_32124044 
X-CRM114-Status: GOOD (  18.72  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> Currently after the hardware restart triggered from the driver, the
> station interface connection remains intact, since a disconnect trigger
> is not sent to userspace. This can lead to a problem in targets where
> the wifi mac sequence is added by the firmware.
> 
> After the target restart, its wifi mac sequence number gets reset to
> zero. Hence AP to which our device is connected will receive frames with
> a  wifi mac sequence number jump to the past, thereby resulting in the
> AP dropping all these frames, until the frame arrives with a wifi mac
> sequence number which AP was expecting.
> 
> To avoid such frame drops, its better to trigger a station disconnect
> upon target hardware restart which can be done with API
> ieee80211_reconfig_disconnect exposed to mac80211.
> 
> The other targets are not affected by this change, since the hardware
> params flag is not set.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>

Fails to compile:

In file included from ./include/linux/wait.h:7,
                 from ./include/linux/wait_bit.h:8,
                 from ./include/linux/fs.h:6,
                 from ./include/linux/highmem.h:5,
                 from ./include/linux/bvec.h:10,
                 from ./include/linux/skbuff.h:17,
                 from ./include/linux/if_ether.h:19,
                 from ./include/net/mac80211.h:18,
                 from drivers/net/wireless/ath/ath11k/mac.c:7:
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_op_reconfig_complete':
drivers/net/wireless/ath/ath11k/mac.c:8049:45: error: 'arvif' undeclared (first use in this function)
 8049 |                         list_for_each_entry(arvif, &ar->arvifs, list) {
      |                                             ^~~~~
./include/linux/list.h:674:14: note: in definition of macro 'list_for_each_entry'
  674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |              ^~~
drivers/net/wireless/ath/ath11k/mac.c:8049:45: note: each undeclared identifier is reported only once for each function it appears in
 8049 |                         list_for_each_entry(arvif, &ar->arvifs, list) {
      |                                             ^~~~~
./include/linux/list.h:674:14: note: in definition of macro 'list_for_each_entry'
  674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |              ^~~
In file included from ./include/linux/bits.h:22,
                 from ./include/linux/ratelimit_types.h:5,
                 from ./include/linux/printk.h:9,
                 from ./include/asm-generic/bug.h:22,
                 from ./arch/x86/include/asm/bug.h:87,
                 from ./include/linux/bug.h:5,
                 from ./include/net/mac80211.h:16:
././include/linux/compiler_types.h:298:27: error: expression in static assertion is not an integer
  298 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro 'container_of'
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
  531 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
./include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
  674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c:8049:25: note: in expansion of macro 'list_for_each_entry'
 8049 |                         list_for_each_entry(arvif, &ar->arvifs, list) {
      |                         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:298:27: error: expression in static assertion is not an integer
  298 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro 'container_of'
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
  564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
      |         ^~~~~~~~~~
./include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
  676 |              pos = list_next_entry(pos, member))
      |                    ^~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c:8049:25: note: in expansion of macro 'list_for_each_entry'
 8049 |                         list_for_each_entry(arvif, &ar->arvifs, list) {
      |                         ^~~~~~~~~~~~~~~~~~~
make[6]: *** [scripts/Makefile.build:250: drivers/net/wireless/ath/ath11k/mac.o] Error 1
make[5]: *** [scripts/Makefile.build:500: drivers/net/wireless/ath/ath11k] Error 2
make[4]: *** [scripts/Makefile.build:500: drivers/net/wireless/ath] Error 2
make[3]: *** [scripts/Makefile.build:500: drivers/net/wireless] Error 2
make[2]: *** [scripts/Makefile.build:500: drivers/net] Error 2
make[1]: *** [scripts/Makefile.build:500: drivers] Error 2
make: *** [Makefile:1992: .] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221102061423.1032-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
