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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F35CC4320E
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 22:48:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B5C4610A3
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 22:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B5C4610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9OgN0rTmhMMNVSRqGNrvdm/g+P4EfQ1E7HbBEBDLs0=; b=kwuaqwcvOlqOfu
	nRGoEcRpTEwarZBFo6BSFBGhy6JFjD9/TNhjjCBWN/51rDeJtcp4oICtXXrqg0QOloC2M2ApS8NFh
	cNVCLIAzYYOJubA6YzcFen+bCh9SG9raHE53MtpIGh2fiq0v5W1S8IKq3mLbLOpxN1CJkbmxwXnvY
	tvcjNQi7o06bJoeouIMxK1WRIoXENpujL1rZY7cfF+7BQDCIYbXWseGqjGD/bDMbyvvgMfOxWMpkZ
	3zgEoDmlG2ZKXp3C5GUUITNTxzDygACpA7ZswaTVSCCFZdYXnVyxIOxYEOSlO+hhesoSHCSkxxqiF
	iLOLGPbdm0jDCTKW+bzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ1hF-008eOh-JX; Wed, 25 Aug 2021 22:48:37 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ1hC-008eON-Ih
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 22:48:35 +0000
Received: by mail-oi1-x234.google.com with SMTP id c79so1570464oib.11
 for <ath11k@lists.infradead.org>; Wed, 25 Aug 2021 15:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlRDH55EiWQLk3rB82Bp9s+nmfPSNiAJf1+J1DgMoGg=;
 b=UXJEWMe2pj4mdJwOedV1Q5Tmbcz4di5xMzVoDoJDuEjNgDhPpImmem1iykHb6Z/Ttu
 0xtaqj/S9ibvNyF25dPzNEb7P9Lgr5AQB+6G5lr5knGT0PmCCZi2tKWr88Q2vjh9CDJI
 3P0mqVGp4QDExhNaPwHWlTew/yZaGNwK0F+QEEilYGj52ohYaDiGpXsUcWcljdAcCyaa
 HrgWzA7UdUut9yI4PmGYeFnFFrulwWRA3Tlhi/yBOluZQWga49d3d+E4T78zuye01fI5
 94OO82G09jhPEEW/Ssn8EvuyhMo0k3GFnq8MB82AFS/uxXzTtj9Y7BqTwYyK7Ej8qN0L
 05RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlRDH55EiWQLk3rB82Bp9s+nmfPSNiAJf1+J1DgMoGg=;
 b=BI87zQKJXZSZPR0jBbfzC9qB01VNDqnTIAr4ZvNIh9olwIq9OZTw/OCE5WK5W9MqwF
 +dzFzsOGOIA+g4fo10l2AgNLsHIpEjv2ac9Ku9hRD4Ja3v3Jbm6sK8qZvWQ68GBs1w4P
 NjUNYYil7YNq+up7BrX7h3we3JknX+eEnzUng+MzvyWn5t6P2Dd08VQoWK67tN83qVZB
 IMBlkj/QtRJlWACkS00wedC1rIZQwZTHIm36BD0PV3VmuJJ94DM9kL2uVS+y84XzFMNT
 wFkT4kaZf6pDmtd5Ferx6n0LxItAdBziMDhqh+40vbKNxRS2d6LtPv+vEzvk7SaOjsId
 QD3g==
X-Gm-Message-State: AOAM531OcfkCisgq6MHjIWgQ5CP/rKguxVSIG1o6nQwXdQT5zZyStiQW
 3h7TJHR9oM1s2hyrTmndTjM+50PsHztDz+R3I7o=
X-Google-Smtp-Source: ABdhPJyJWJOaG/AEozXkFYl/RustOM7ngWw90Ks1ffUMb3VNWeAXxLYNNm2nrVdrxumT6LoCArwQ45cnNk/4PxnDDw8=
X-Received: by 2002:aca:6541:: with SMTP id j1mr275224oiw.146.1629931712159;
 Wed, 25 Aug 2021 15:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
 <1629884277-18759-8-git-send-email-ppranees@codeaurora.org>
In-Reply-To: <1629884277-18759-8-git-send-email-ppranees@codeaurora.org>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Thu, 26 Aug 2021 01:49:02 +0300
Message-ID: <CAHNKnsSkDtos-9f1Er-Gkc-Mi4gt9V_Nhtu0VDH-6W9ZcNZ9tg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] ath11k: add branch predictors in process_rx
To: P Praneesh <ppranees@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>, 
 Jouni Malinen <jouni@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_154834_681382_5B58A2C9 
X-CRM114-Status: GOOD (  14.94  )
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
> In datapath, add branch predictors where required in the process rx().
> This protects high value rx path without having performance overhead.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1
>
> Co-developed-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: P Praneesh <ppranees@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index e105bdc..5d805881 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2535,13 +2535,13 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
>         rcu_read_lock();
>
>         ar = ab->pdevs[mac_id].ar;
> -       if (!rcu_dereference(ab->pdevs_active[mac_id])) {
> +       if (unlikely(!rcu_dereference(ab->pdevs_active[mac_id]))) {
>                 __skb_queue_purge(msdu_list);
>                 rcu_read_unlock();
>                 return;
>         }

The pointer that is returned by the rcu_dereference() is not
dereferenced, so it is preferable to use rcu_access_pointer() here.

And since rcu_access_pointer() did not require the RCU protection, the
whole block with check and list purging could be moved before the
rcu_read_lock() call.

-- 
Sergey

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
