Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D8AC05027
	for <ath11k@archiver.kernel.org>; Thu,  9 Feb 2023 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ti6obCGmnv/+Jplp/uY1pJXBDLRU+MCEEBavZ7lf2FM=; b=gJ4bWkliBd32dO
	UGXnl1suaoUUAsrkSe7MIdAdPeWEKrPY+O3R2EMla4J07z8v3DsxFIuZFoRd8CVzKQ2F04VilWxOT
	UTY48bHzh+7dOoOresaXxhU4wF9OkDBEFMHauITVP5RWWZ23ZeZu/m3A9Na13pXxEZtmm8ZEI9QJw
	nItuNeBYgPaQIaADy1FpQAkpiEg6xhmOJfQPEQEySBx87hGuPGR40MVHhEj0xR55iiHuLOm7MqqKo
	QKt5EES554PjdkStlfNlRoMqHsf3+DEBRoy61uKqx0TjLSuBOegUGNDwN3eyfSUlxsOKC4EF06J5D
	ED86fJuW7szwLr8OtkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3L7-000rlf-Qp; Thu, 09 Feb 2023 09:35:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3L5-000rjP-5R
	for ath11k@lists.infradead.org; Thu, 09 Feb 2023 09:35:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso3439027wms.0
        for <ath11k@lists.infradead.org>; Thu, 09 Feb 2023 01:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3BSPGq3HqzF1esjY3NCmu0wkpZ9eCQFuOZ9+Q8hvyo=;
        b=FbhimYHRaU74JelXcj3msRkYATf6zYmUX6SPxIpbSgI3QhwhyFxcT0CMafpvJ1SKeV
         HRqNIA6DJFHqREJ60sTkyF+ocK7cVuq13vqlgUbOzN2NsQLH4zIsTmGTMQBJHdcg8F3U
         o1ftD2d7+3DuW9zi5t31il78ulz3a8AWRykgRxpXF/T1hMiqMHG+3xoXodP72oeocCVw
         M33IezI0JiUW7MDiuV2J98EJGWTcgJew4/dX3emRVcBbvGYq9QlpvvG8rg0geA49TCzl
         VUByB4UzhPYqp/xs6cWysLSXOWA0anRle0UTsSVdb/d3Cb4hAdQMDY+cxGj9ACdYWP6F
         lx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3BSPGq3HqzF1esjY3NCmu0wkpZ9eCQFuOZ9+Q8hvyo=;
        b=j5KtHxqowDBYXDl6wwvhVLf/+ukIGQUEAE4fezwZrFKsCjjPlCIswjpPfv43RUN2MK
         V8OfdVYXcfq4QKM7PG1ojkToWnrMo+QJLyClJAfXo3aAgiHF0352zIHmaFeYfQTevXYp
         o30aysCaCKA72N+vtQKs5/hUzZ/3givfETjsbNzAzN55/t7XeHKvzEZmRTLw3oaozBRV
         kkhJ0PTEvsZ31cJ074VN+opIhBVGqNdLBWB69zcyHDqKhcDgR6yK6102y5GLr+Auxx2N
         3KCF1D/wSxqjnOoRi/OFvktS1HdbgOMh8B2KXixzlf7c5Y12K8dqQHRzX+6njSOlULmu
         ufeQ==
X-Gm-Message-State: AO0yUKUMl+aTjxoflNZIcFER0IOsv2hHKOOn6xabAX7NsJUTX6dD5AHB
	CcOKaWMw72Q8I5V+mhxtNPjgytLmpto=
X-Google-Smtp-Source: AK7set8dd+0y6im2b6YPrd0rGZUw9MHg+Foxz/xFfZCbLYEoljpBTmSwUydS8+HJIZIPNiNUptAFTA==
X-Received: by 2002:a05:600c:705:b0:3dc:572f:edb7 with SMTP id i5-20020a05600c070500b003dc572fedb7mr3793118wmn.1.1675935331378;
        Thu, 09 Feb 2023 01:35:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r14-20020a05600c35ce00b003dc4ecfc4d7sm1365993wmq.29.2023.02.09.01.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 01:35:31 -0800 (PST)
Date: Thu, 9 Feb 2023 12:35:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: ansuelsmth@gmail.com
Cc: ath11k@lists.infradead.org
Subject: [bug report] wifi: ath11k: fix peer addition/deletion error on sta
 band migration
Message-ID: <Y+S+WDeZqeooMdiM@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_013535_235936_0B2D56DF 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
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

Hello Christian Marangi,

The patch d673cb6fe6c0: "wifi: ath11k: fix peer addition/deletion
error on sta band migration" from Sep 22, 2022, leads to the
following Smatch static checker warning:

	drivers/net/wireless/ath/ath11k/peer.c:396 ath11k_peer_create()
	warn: sleeping in atomic context

drivers/net/wireless/ath/ath11k/peer.c
    370 int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
    371                        struct ieee80211_sta *sta, struct peer_create_params *param)
    372 {
    373         struct ath11k_peer *peer;
    374         struct ath11k_sta *arsta;
    375         int ret, fbret;
    376 
    377         lockdep_assert_held(&ar->conf_mutex);
    378 
    379         if (ar->num_peers > (ar->max_num_peers - 1)) {
    380                 ath11k_warn(ar->ab,
    381                             "failed to create peer due to insufficient peer entry resource in firmware\n");
    382                 return -ENOBUFS;
    383         }
    384 
    385         spin_lock_bh(&ar->ab->base_lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Holding a spin lock.

    386         peer = ath11k_peer_find_by_addr(ar->ab, param->peer_addr);
    387         if (peer) {
    388                 if (peer->vdev_id == param->vdev_id) {
    389                         spin_unlock_bh(&ar->ab->base_lock);
    390                         return -EINVAL;
    391                 }
    392 
    393                 /* Assume sta is transitioning to another band.
    394                  * Remove here the peer from rhash.
    395                  */
--> 396                 mutex_lock(&ar->ab->tbl_mtx_lock);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
So we can't take a mutex.

    397                 ath11k_peer_rhash_delete(ar->ab, peer);
    398                 mutex_unlock(&ar->ab->tbl_mtx_lock);
    399         }
    400         spin_unlock_bh(&ar->ab->base_lock);
    401 
    402         ret = ath11k_wmi_send_peer_create_cmd(ar, param);

regards,
dan carpenter

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
