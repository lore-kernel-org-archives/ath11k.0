Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F8DC433EF
	for <ath11k@archiver.kernel.org>; Mon, 18 Jul 2022 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kl9JYKSBra1ItluGJmUcJI3373QwKNsSZ6Pin69hi/0=; b=pOoUgcAQptJUF6
	hqOT39Z2brAx7K8K41YzoQri+2K+Zx6HE8ZKsLDPgdZyr0Lzz5iiFIhAibds0dG7LufR9E2vLdk0p
	3tlw08OFoEocywfnKo88BjRuFAMWiCX4NG/auwotJIeBDggivHHkaKUj5rYomtezImRfBIIcrx4k1
	V7Ik/XNzlHrdMiwwcZcipc18+7VXWEaPdDeSp7+Hg3dh7Ad5os2lNXWrmTVgAWgoUjBNTvO2NFkqk
	UUy6nXqZIyIHL/G7dlgwWFz9+d9NEgUFIllIxAYxGITQTexwecPuCHb99puuWEUocaMuuD3vkQJMD
	SNYrDi53bMA9T2ms43ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNoc-00CP14-Ja; Mon, 18 Jul 2022 10:17:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNoa-00COzv-2y
	for ath11k@lists.infradead.org; Mon, 18 Jul 2022 10:17:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE504B80EC1;
	Mon, 18 Jul 2022 10:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF072C341CB;
	Mon, 18 Jul 2022 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658139441;
	bh=1FYLSGq90GzN6tj1qSgpXSld4pUTEEPcTq27tJamG7U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OROIvdBLMgT58u/8kEUfQUdBTq4Jx/zDdd4Y9HHFt64B5m48FM2XPcI3nVMKkUlj0
	 aVxpsC34eJvUKmAlk56f8mwbIwfRkpqKmHfvkQVvxAVM1DxGPNu0fouYjj1+qS+++w
	 ZWT/6alfDl3BHAyi5FpEU1LfR/j97ZuxO68W7zdM+xnWhKJB5uQx4PFqWf3guHn0j8
	 XSeJE/KFLE6Wl3En+xMYzDVxJ/g1zv/71P02qtVJqhSPqeLf7GIHIpupT8AV2XqNYL
	 f8i/wPsxxcwkdfJvksz5jN8uk9joC/w0zklicjgdhgS+7MMtOrIn2AP7V0S3WQrbOk
	 R93kGzAd6OLOA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: IPQ8074 firmware crash with testing version 2.7.0.1-01701
References: <62be1f6d.1c69fb81.647ef.1d86@mx.google.com>
Date: Mon, 18 Jul 2022 13:17:13 +0300
In-Reply-To: <62be1f6d.1c69fb81.647ef.1d86@mx.google.com> (Christian Marangi's
	message of "Fri, 1 Jul 2022 00:10:53 +0200")
Message-ID: <87fsiysp1y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_031724_291524_6F3E82A5 
X-CRM114-Status: GOOD (  12.82  )
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

Christian Marangi <ansuelsmth@gmail.com> writes:

> testing this latest firmware on my ipq8074 based router result in a
> firmware crash. The firmware seems to crash on loading.
>
> The router is a Xiaomi Ax3600
> Firmware: WLAN.HK.2.7.0.1-01701-QCAHKSWPL_SILICONZ-1
>
> This is the crashlog
> [   17.277607] qcom-q6v5-wcss-pil cd00000.q6v5_wcss: fatal error received:
> [ 17.277607] QC Image Version:
> QC_IMAGE_VERSION_STRING=WLAN.HK.2.7.0.1-01701-QCAHKSWPL_SILICONZ-1
> [   17.277607] Image Variant : IMAGE_VARIANT_STRING=8074.wlanfw.eval_v2Q
> [   17.277607]
> [ 17.277607] :Excep :0 Exception detectedparam0 :zero, param1 :zero,
> param2 :zero.
> [ 17.277607] Thread ID : 0x00000069 Thread name : WLAN RT0 Process ID
> : 0
> [   17.277607] Register:
> [   17.277607] SP : 0x4bfacdc0
> [   17.277607] FP : 0x4bfacdd8
> [   17.277607] PC : 0x4b18d338
> [   17.277607] SSR : 0x00000001
> [   17.277607] BADVA : 0x0028d127
> [   17.277607] LR : 0x4b18d2b8
> [   17.277607]
> [   17.277607] Stack Dump
> [   17.277607] from : 0x4bfacdc0
> [   17.277607] to   : 0x4bfad400
> [   17.277607]
> [ 17.324231] remoteproc remoteproc0: crash detected in
> cd00000.q6v5_wcss: type fatal error
> [   17.346841] remoteproc remoteproc0: handling crash #1 in cd00000.q6v5_wcss
> [   17.354631] remoteproc remoteproc0: recovering cd00000.q6v5_wcss
> [   17.387472] remoteproc remoteproc0: stopped remote processor cd00000.q6v5_wcss
>
> Firmware WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1 works correctly so
> this is clrearly a regression.
>
> I know that the crashlog is probably uselss so feel free to tell me how
> to provide additional data.

Bugzilla makes it so much easier to track issues and get them fixed, so
can you please file it there:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

Also remember to include all relevant information, especially the kernel
version and any extra patches you might have.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
