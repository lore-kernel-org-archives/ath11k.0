Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DEFC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A24561130
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A24561130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHR9p02UQXydYcYPYOSFtXaYIN+t7xmRMlExbGzKw0g=; b=hq1NTf7q8PnxMU
	XBmXN580l1Pd1sVWwuz0OIoDdTRilY/vK8P/+3e60mR1QtUrlxK0EsdWF9Q72lMUZjNtsWIGuawi2
	J0vwjASdjoAG+0wRjJpJ1EVW01+YISN7rIdNKm8i9QgawQ32W9tLIcB7ZKIkJ08Qn6NcjsA9IQNyY
	79gYksWIY9bpROMCErMkZvT4EDBpchlsEU1ihKVHI9wZVGI7XDQAcWODTx3+24uRV8TPnxK1rJjn9
	S68Uv+t6gl/jVll/kbj1gcnJVKBh1/IZIGtjID9xm1aHQ/gaqPzgP191ihclXiQG1UVhXQuwuoyT1
	mCQBEfCX+hrQaUaWRnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAlP-006spU-Ao; Tue, 28 Sep 2021 10:55:07 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAlL-006sp9-7L
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 10:55:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632826504; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=D+OE+2bP057AaZUh2ZBJbHsm1BvNBCz9ficS8dfx5KU=;
 b=D0sJNylifHkyELzPbqN8y9X19qUFtK5l0sr84K1V7YwJ3bY9JM7DhY3U4VQsd5NSfLrK6bgC
 X5T2emeifQYdJsQNRO7NmD3NENGLlvBjWmmA6ASYx7Sbjt7Op1fToq+sRm7Wu+n1HbRwgbGo
 2EhvksAl2Xz6ER29SaUknd0ESLE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6152f47d1abbf21d3462eb3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 10:54:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AADC9C4360C; Tue, 28 Sep 2021 10:54:52 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E8DC3C4338F;
 Tue, 28 Sep 2021 10:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E8DC3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: Replace one-element array with
 flexible-array member
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210823172159.GA25800@embeddedor>
References: <20210823172159.GA25800@embeddedor>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928105452.AADC9C4360C@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 10:54:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_035504_380670_806B14A1 
X-CRM114-Status: GOOD (  16.88  )
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

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> There is a regular need in the kernel to provide a way to declare having a
> dynamically sized set of trailing elements in a structure. Kernel code
> should always use "flexible array members"[1] for these cases. The older
> style of one-element or zero-length arrays should no longer be used[2].
> 
> Refactor the code a bit according to the use of a flexible-array member in
> struct scan_chan_list_params instead of a one-element array, and use the
> struct_size() helper.
> 
> Also, save 25 (too many) bytes that were being allocated:
> 
> $ pahole -C channel_param drivers/net/wireless/ath/ath11k/reg.o
> struct channel_param {
>         u8                         chan_id;              /*     0     1 */
>         u8                         pwr;                  /*     1     1 */
>         u32                        mhz;                  /*     2     4 */
> 
>         /* Bitfield combined with next fields */
> 
>         u32                        half_rate:1;          /*     4:16  4 */
>         u32                        quarter_rate:1;       /*     4:17  4 */
>         u32                        dfs_set:1;            /*     4:18  4 */
>         u32                        dfs_set_cfreq2:1;     /*     4:19  4 */
>         u32                        is_chan_passive:1;    /*     4:20  4 */
>         u32                        allow_ht:1;           /*     4:21  4 */
>         u32                        allow_vht:1;          /*     4:22  4 */
>         u32                        allow_he:1;           /*     4:23  4 */
>         u32                        set_agile:1;          /*     4:24  4 */
>         u32                        psc_channel:1;        /*     4:25  4 */
> 
>         /* XXX 6 bits hole, try to pack */
> 
>         u32                        phy_mode;             /*     8     4 */
>         u32                        cfreq1;               /*    12     4 */
>         u32                        cfreq2;               /*    16     4 */
>         char                       maxpower;             /*    20     1 */
>         char                       minpower;             /*    21     1 */
>         char                       maxregpower;          /*    22     1 */
>         u8                         antennamax;           /*    23     1 */
>         u8                         reg_class_id;         /*    24     1 */
> 
>         /* size: 25, cachelines: 1, members: 21 */
>         /* sum members: 23 */
>         /* sum bitfield members: 10 bits, bit holes: 1, sum bit holes: 6 bits */
>         /* last cacheline: 25 bytes */
> } __attribute__((__packed__));
> 
> as previously, sizeof(struct scan_chan_list_params) was 32 bytes:
> 
> $ pahole -C scan_chan_list_params drivers/net/wireless/ath/ath11k/reg.o
> struct scan_chan_list_params {
>         u32                        pdev_id;              /*     0     4 */
>         u16                        nallchans;            /*     4     2 */
>         struct channel_param       ch_param[1];          /*     6    25 */
> 
>         /* size: 32, cachelines: 1, members: 3 */
>         /* padding: 1 */
>         /* last cacheline: 32 bytes */
> };
> 
> and now with the flexible array transformation it is just 8 bytes:
> 
> $ pahole -C scan_chan_list_params drivers/net/wireless/ath/ath11k/reg.o
> struct scan_chan_list_params {
>         u32                        pdev_id;              /*     0     4 */
>         u16                        nallchans;            /*     4     2 */
>         struct channel_param       ch_param[];           /*     6     0 */
> 
>         /* size: 8, cachelines: 1, members: 3 */
>         /* padding: 2 */
>         /* last cacheline: 8 bytes */
> };
> 
> This helps with the ongoing efforts to globally enable -Warray-bounds and
> get us closer to being able to tighten the FORTIFY_SOURCE routines on
> memcpy().
> 
> This issue was found with the help of Coccinelle and audited and fixed,
> manually.
> 
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/109
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b2549465cdea ath11k: Replace one-element array with flexible-array member

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210823172159.GA25800@embeddedor/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
