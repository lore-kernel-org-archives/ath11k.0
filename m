Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F228C05027
	for <ath11k@archiver.kernel.org>; Thu,  9 Feb 2023 23:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vo24Y5VYRKEH/iu3y79g0HI2YZW8CbLLHrDS522QGHU=; b=aO+pu4dTLbk9C5
	KPUh+n+9qoHKUoZfgenwxsQhnEc3S4hF7e42+dOaDhhCwbfBY46mB/nltxZn5FYTpW7VWDoIACCoE
	fSBnC8M2w21uGVcj7pekmgPlciCXugxWFvwmQTVTJYPcGx+rjqCt4ZA0tnDhQtpCEvJ6L9F0uhbZE
	Tp7mAOpdh9GkMYZ0zHboAajkB5PpgdCFhrKQ4sXktgI/CETO24Ag5IhKZYSuVCWPX5vg+1UpcOmLs
	pY1OW/kDROSqF+85DjxOfm8dfY2iX+QWoPMx/Qr2poaUtuu+QFoo8tWJKjkE1trNPEsr27y2axs7F
	Zr4MaxF/1ioB4IrSv6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGld-003f0J-Cx; Thu, 09 Feb 2023 23:55:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGla-003ezB-6J
	for ath11k@lists.infradead.org; Thu, 09 Feb 2023 23:55:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o18so3533928wrj.3
        for <ath11k@lists.infradead.org>; Thu, 09 Feb 2023 15:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wYx40Ioj9i9PsEdtDolsKgt3a/gVa4rBcWv41DLes+s=;
        b=VhL3bBt/cfqa75Di4uMcm9WXwKSvBoumJ4fVF09tOMHa19vjEXKBjy2F7ynGYxFoj9
         0FRtntnSyyqXowgPOMbr5kOoWGbinseA9HcDWYhR9ppIvuPD/qth1AQIC0hyi3VcWzkh
         xVTTqZT25HpnH1aSYCENbHphhnmS5nsXobtGy0mRyIb8Zz3lZWJKdT6MG5jOVndnAkMB
         q8W7hW3q4YLvrv7L84DF+PwvnLe+Q36fONvCL8yRTyfb2jpIrr8cYA2p5gaGvpvzwFpl
         i5vvYLceSQEY9DjL2kbQ47SJBuvuBR7zo5zdog1GIw70xdx7hpbYT/7ljDlUgYT6XTFU
         6PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYx40Ioj9i9PsEdtDolsKgt3a/gVa4rBcWv41DLes+s=;
        b=KKqW+IcM2Zlc3LrBbhVXRRZjfBymV52XOA1OhtZgqXW9B1qJ23JgHL0Q1hIdtfZNci
         GDp+PGgQwRSBdpt5SfGKiipUr8bETAvGoB+jNhIiJQaD4NMjBQnx8S9eOm9AeY6TJdYj
         r5WhwOUAqxVOoLMOJCaoiLq/9FaRTtCSIE2/uAc+DaEMAEk4C0o+YiDvyGrhUfTscFgJ
         /dfG4FsEcSp90bX6XXL/uKL9YGEsJhvtTL+KfHhjBW1KWDPP/d8DVeQaLOu3Lph13xCB
         cM0InKZ3TnMcaROcqw16aPcqpgz85J7B0sH1BLH3nz2YE+uoBpju/MvSxkgc1j2YAJqH
         CFiw==
X-Gm-Message-State: AO0yUKVBpSm1msX10WOQpS4cLbr1UiQRsqIxRxV6EH0iKkk3aHPnDsXf
	+Q1NlrZlOjBlbD7sXj7mh/M=
X-Google-Smtp-Source: AK7set+H07pyUGYyp73j0GH05TSRd0rlBiGl6Seh6bBxxBooU5eMeVe9rXe+ZPPzLTgE6BkOIgPiSg==
X-Received: by 2002:adf:fbc2:0:b0:2c3:d707:7339 with SMTP id d2-20020adffbc2000000b002c3d7077339mr5528952wrs.6.1675986942514;
        Thu, 09 Feb 2023 15:55:42 -0800 (PST)
Received: from Ansuel-xps. (93-34-91-73.ip49.fastwebnet.it. [93.34.91.73])
        by smtp.gmail.com with ESMTPSA id q9-20020adff789000000b002c3f022945fsm2213577wrp.77.2023.02.09.15.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 15:55:42 -0800 (PST)
Message-ID: <63e587fe.df0a0220.47373.9a06@mx.google.com>
X-Google-Original-Message-ID: <Y+WH/UbJDm0JbljO@Ansuel-xps.>
Date: Fri, 10 Feb 2023 00:55:41 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: [bug report] wifi: ath11k: fix peer addition/deletion error on
 sta band migration
References: <Y+S+WDeZqeooMdiM@kili>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+S+WDeZqeooMdiM@kili>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_155550_294297_FFE18F34 
X-CRM114-Status: GOOD (  12.39  )
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

On Thu, Feb 09, 2023 at 12:35:20PM +0300, Dan Carpenter wrote:
> Hello Christian Marangi,
> 
> The patch d673cb6fe6c0: "wifi: ath11k: fix peer addition/deletion
> error on sta band migration" from Sep 22, 2022, leads to the
> following Smatch static checker warning:
> 
> 	drivers/net/wireless/ath/ath11k/peer.c:396 ath11k_peer_create()
> 	warn: sleeping in atomic context
> 
> drivers/net/wireless/ath/ath11k/peer.c
>     370 int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
>     371                        struct ieee80211_sta *sta, struct peer_create_params *param)
>     372 {
>     373         struct ath11k_peer *peer;
>     374         struct ath11k_sta *arsta;
>     375         int ret, fbret;
>     376 
>     377         lockdep_assert_held(&ar->conf_mutex);
>     378 
>     379         if (ar->num_peers > (ar->max_num_peers - 1)) {
>     380                 ath11k_warn(ar->ab,
>     381                             "failed to create peer due to insufficient peer entry resource in firmware\n");
>     382                 return -ENOBUFS;
>     383         }
>     384 
>     385         spin_lock_bh(&ar->ab->base_lock);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Holding a spin lock.
> 
>     386         peer = ath11k_peer_find_by_addr(ar->ab, param->peer_addr);
>     387         if (peer) {
>     388                 if (peer->vdev_id == param->vdev_id) {
>     389                         spin_unlock_bh(&ar->ab->base_lock);
>     390                         return -EINVAL;
>     391                 }
>     392 
>     393                 /* Assume sta is transitioning to another band.
>     394                  * Remove here the peer from rhash.
>     395                  */
> --> 396                 mutex_lock(&ar->ab->tbl_mtx_lock);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> So we can't take a mutex.
> 
>     397                 ath11k_peer_rhash_delete(ar->ab, peer);
>     398                 mutex_unlock(&ar->ab->tbl_mtx_lock);
>     399         }
>     400         spin_unlock_bh(&ar->ab->base_lock);
>     401 
>     402         ret = ath11k_wmi_send_peer_create_cmd(ar, param);

Hi,
thanks for the report. I send a patch to ath mailing list that should
fix this bug!

-- 
	Ansuel

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
