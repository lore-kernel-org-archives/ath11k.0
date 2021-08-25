Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8656DC432BE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 23:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3107361073
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 23:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3107361073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hniIg6k/TNsZBe04GGyMV57XHDWlXTpYWH8Uq5uOJZU=; b=b9APPsol6YA1UZ
	qFpiTo1jPW1TyRCPEU52dNoo/m7UR2+IkT7R1AJS6KZbxPd+lUdSXz54M+ez3downtTXRgN5Sb8YB
	SWIruC/3GdRH1VNiSNQBYRobEMzXPGiOdkqMoPfRHsbO6vSOOsWAUpfeODKLllUEFEwyvbnsj5/Nd
	J89auofIFcjqdeaiW40rJU5uuzKC7StiRNt9JkWpTTcvgXBsT2N/RkI2G7ItcEHh+hrbohU84QWnH
	3OxQXGVouJMZwqMvlgw2yQzx/nHHjXlLbNYWPQjNRe91QkxwcihCkfmJmCwuAcng/VZS4OqRxjJWA
	Km4m5jG/uIyV0JfgVpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ1tx-008fGQ-QE; Wed, 25 Aug 2021 23:01:45 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ1tv-008fFV-5a
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 23:01:44 +0000
Received: by mail-oi1-x232.google.com with SMTP id s20so1733917oiw.3
 for <ath11k@lists.infradead.org>; Wed, 25 Aug 2021 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7HZlWC8KJohv3wxpeiYZ8xLIfggzme+ADhSLyEO+Yg=;
 b=kzEpcmV5cjVZjLrrDSrvWkwENdpxVZywXviL2w13mDb8LhPUcHx18eBMtuuR/U7BqI
 ZBKvsv64+VAjwxU4viRTT4nf5zu4onbxB+qAxSJpNMlD1DJGNen7l30Cp1ht2ou31L9H
 VKHIM2jFvbsin05OfbFvHhuCQOxJ7R44MPwzLP1C6tQaQwwxGAlnCE7hi4FGjLz8u16+
 OC6z0MJYoQwJMM962U3yNW4tfxBcXfqbOgrBOn/dv8pSDftHpuji1V6yPx38fG5JbX89
 XmiOpYmlNVouCymyfVL4YxXrnc64+dqvTc5elJ/n5Hm7zJJjk9L4nkvyosV+9WmN9zRc
 I51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7HZlWC8KJohv3wxpeiYZ8xLIfggzme+ADhSLyEO+Yg=;
 b=SSy3iZK34x2OLVg33hHfyA69y/2shNcrW52yyPHswVZd/obxbql3eg2c2VSLSFPtBL
 irTsF345tRH9MsH84xa1E/syjqqsC3255xcCkU/89EQgW69DLFBkIzRc4qDRznhh0CwF
 w28G5tYmy5wiP8rq9VhqtgZPXyiGogb38cG99Oscqb8YzzEyWI6rO4PmFpXfQfdtulvh
 CZVyC4+jGqRrX0ijMynI3wGeaVdjFUszcw+GL4dt9vIrE0S0BxEkdu4aJmMFEvIIHUVs
 x6e925u1z64/4SVWb65kTl7ZesOAypF2gxZhL1QpFV6yDa7F8xxJn8oI3l0+pxHxR/3j
 VaUQ==
X-Gm-Message-State: AOAM531buUSw4k3F4y7cXyJIr3qrxpr3uMKwM9TBYSF0ye6e1nqXqXRK
 5MxS7Tzy2bZAH+f1oh4ygonlpnjBuML6Qjx4FtiG0pRbZG8=
X-Google-Smtp-Source: ABdhPJyfWdhuq7QS8eNXfpfLZpVi4hXUbiV4Dx7xPMWbM48ok62/D1CS1zZm7aUrNajAyCd9p7QK3U39GoarGOwR24M=
X-Received: by 2002:aca:3488:: with SMTP id b130mr8461960oia.17.1629932500628; 
 Wed, 25 Aug 2021 16:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
 <1629884277-18759-12-git-send-email-ppranees@codeaurora.org>
In-Reply-To: <1629884277-18759-12-git-send-email-ppranees@codeaurora.org>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Thu, 26 Aug 2021 02:02:10 +0300
Message-ID: <CAHNKnsRi9CYH4vZfgpEUTJEHJfb-Av24dyE-_7pc7KMKy3S8VA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] ath11k: add branch predictors in dp_tx path
To: P Praneesh <ppranees@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>, 
 Jouni Malinen <jouni@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_160143_263100_A7AB8897 
X-CRM114-Status: GOOD (  15.27  )
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

On Wed, Aug 25, 2021 at 12:39 PM P Praneesh <ppranees@codeaurora.org> wrote:
> Add branch prediction in dp_tx code path in
> tx and tx completion handlers.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2
>
> Co-developed-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: P Praneesh <ppranees@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 45 +++++++++++++++++----------------
>  drivers/net/wireless/ath/ath11k/mac.c   |  2 +-
>  2 files changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 8bba523..ab9ccf0 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c

[skipped]

> @@ -432,12 +432,12 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
>
>         rcu_read_lock();
>
> -       if (!rcu_dereference(ab->pdevs_active[ar->pdev_idx])) {
> +       if (unlikely(!rcu_dereference(ab->pdevs_active[ar->pdev_idx]))) {
>                 dev_kfree_skb_any(msdu);
>                 goto exit;
>         }

This is another place where rcu_dereference() could be replaced by the
rcu_access_pointer() and the whole block could be moved above the
rcu_read_lock().

On the other hand this is an _unlikely_ path, so it looks like a
matter of taste which macro to use here.

-- 
Sergey

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
