Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155F7CA5FE6
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLU+H3Rg/9OU3qmdYRdJ32ZsOLhx+ZoCaNo1XPLyUvY=; b=SIEmq5XUyBVYUyJoANSQeJ9jrf
	3W8AsMp+2hMsJEPQITOM1m89BJBFtAdZvr8+uQq7nPoMaKttYuon0s88cQAtrAIKELlvKfxnC1X4j
	ZtOEGs0oKv8mTCKNz73sDST2V54lUBZuCNhlay75kiTAA0tkmtn9tsupRR8nd5Rj2mwT8zd+jfnBf
	i5m+VI3ptzRKmNIYK35zAudE9Zi9xwjvpG9Etj77FNcRlFu+XCa6c42mJ8ZYPZfoAVNLG4UDfvStP
	DBSx+PKtaiJTTAGQPhbZl6i4Omnw2V/hyr+IDTwbaIaijdgwv6jKfAHJP2Z/HlfDMFv514R0dzTAf
	wFNKBnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPgO-0000000F4Zw-0PBC;
	Sun, 04 Oct 2026 17:07:28 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPgJ-0000000F4ZH-3Bap
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 17:07:24 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-677bf06de21so789985d50.3
        for <ath11k@lists.infradead.org>; Sun, 04 Oct 2026 10:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791133642; cv=none;
        d=google.com; s=arc-20260327;
        b=UrMXGKKn7f1rRwb1tpJUWb71eODOOdzITD16FMBmsAQp0JPL9hxZQv20sM8NuaDg2m
         zIKxxg+zFtGhUN+CjCB1qR4KcGw1pLfwlauVhw4lBscnusRYigGQdfZRobrz98E0g2Vn
         PNzvYowPfJmNnmbRo1OZIquhGrT2QqraVkf52SXp1idluKjaApru4x3mtVPRAeWc3HvB
         gJQy4U/ZONIQA6ih93pOPGqsAdZQtHzG5giVc9pYji51Q88wCpz3WQBkpHNDJ/ddUPPC
         BWcTiXDh3MOVdw1zQuRx0gkDfZIrUaW/IsimBbcN8cfQczJNblrNq5g7oUFRs0UreZ8r
         79SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLU+H3Rg/9OU3qmdYRdJ32ZsOLhx+ZoCaNo1XPLyUvY=;
        fh=+FSjZTxCD5OFuYm1rdGolrlm68RHPQCnZPJk746oHkc=;
        b=AKZVxJ2dZ08uLUekV9V9YfFqJ4FdWx3tQmad0bzrN6MQHzV2pM4qPJzqOaVxfzbjnP
         JhvnBXkRRrNYd+bDQyh0oEHDmLfOH3vVDidYP7TSq5oSoDjSKWM+0vZfgCbK2AXRiAOm
         8fa1soVzzA0/+Sa/M7NAW+l6seske2gjfcBB9Hdny3vNJgO3F8/sbZqe48HbpXuSfJcW
         JA5OPbwJLtxfF8Bvx2/DVc/SDzOwXavj8ip66F1VN6kE2NvGr1DeDhGMHsHJ42tW2niC
         ustXV0+lPsKN4VmFWoE8nCZ/s7M3FtoVkmhjr2uNyNGqoP5tPvbRmsKRRNxZKkmpdOBf
         op/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791133642; x=1791738442; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLU+H3Rg/9OU3qmdYRdJ32ZsOLhx+ZoCaNo1XPLyUvY=;
        b=S13dY7LwG5ppMc6vP+rJyex4y8nVeeq6sWIm4Br7gVeHr52t/3KcCJXZ8WtZ1ZkFWp
         VctBUlUMaYEe740HK2wSQosbUs3WLXu9rpacIh88tbZtnvo+JrIGTP9/Q3vfmiCbaUYS
         40n2SjQmEy9mjwiOSvlNVdenPEk7Jqj9sEL7VI3NV0kOoJ14mKuoE/tejNnO0Up55FCq
         1JhHGNlOmQV2/QslJj2lblwvYKaVE0f7VXmG3O4VVS86mYtaYGJR3jzOWj+6n8DbPPZ1
         Jq6ZqidZHr05LLL1r+ybHTwuQgYro4dhLp6SL7wjsU6eIwqUy6boC5EsVP60LOGdeAVP
         0PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133642; x=1791738442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLU+H3Rg/9OU3qmdYRdJ32ZsOLhx+ZoCaNo1XPLyUvY=;
        b=jsonGA5lvOxx9rXPVB3267XNGsaEHTWH5iywmUG/KmDwHuNkV9lmhK1KIaeBHz+yxv
         z9fnEPsbvSZIDsAOUgmLRuxDYQhbHAOx0oJJnKi27xPaQGWYQOCmZtpAOu9AZN8RgpvF
         Ad4gKQXK+a78mOhlkBGO8t/Owf1Vf5nOHlH2SZidiZYN2G0bTxFoDr3dEEaAOylqQjWW
         xDlI9j+aq1hbwjSbZVjZ9Peu0YXWTVCUGxztIh5WwSd3PwfpOHwBz5/IKJjoMucbZD2j
         gpuOf4Ou0YYrnllGK1q3/jDbR1BBje0w0mHRIhAAvFblelCUhFXje+Bryicf6WDtmZND
         tJ0w==
X-Forwarded-Encrypted: i=1; AKwUvByqOLgCyvPOoxnWrhSH/HJMPc1GrjUnd1iMJZsePz+vd8hVuPzTsY9j4EtN2H6Sshof+Fm9oig=@lists.infradead.org
X-Gm-Message-State: AFq9FYIpd4yi+i9AhKSXavx4itamMBEJjFhJmZp4OW56BW5OQdV8s2/M
	yOXeypPeqWp/pYmqBNfhrTGNMKbOrGbppOTbELsQ3Q/074f+XvH57v3BUaNpQJjXlpo6CQbFdZE
	Erl8Vy3AiQmN103YGiS5YoGrqblum5KKlO7T9sX5y
X-Gm-Gg: AYBFou2+UF+MJPWhnP7QCNjaBPPeOrq8qsTqPtXdzAi/7u6Vdy+vw9ZjdnjRa6Y2+oF
	QtsVPoGGROVaUzwQHIaBtUy23SJXg2Doe04YZCbfMEKX9f9DzW874W10vhIkrLtI61b2B0On27q
	D2JlH5/PyTx2XbzGjvoOMxqXG51l+joKLL+N8polLaAVUUfek9fP8dRbKMxu6nDbao6120ctG55
	N1Gi6xX1PHE294MM4kgjS5+FYZDjnAG+Re+/5UtcCHb4YabeR0AkcObmcUASYcJ9GsoNxV14eMn
	wO+VN+rSZ5Qj+3J4WcW356VXhGRodW6PHvRiVsxe2T1kyKmDz9yf/Mj0u6u5TpjetpGCNEQMJgc
	lhS3YwEItTWzUUuslFev/f5Kprp4OPcQ3JqwoNDFVZGmu0u3fVI2CjXzaa/dmsy+8W9D+qNN2mV
	q1aLCg2G0408nrYZahADCIXTd2n8SZtvXnPBNhA6BrZawekgErnmK38OsE92IDzwfX5vBKoqd3K
	IyQuvEgQK9neKh/WMXKGgKX+k48O7QtIS3bBMg9nU8x1GUlVxefba7WVgwf98Cd9ezh824XydAc
	l5Zes24Wq0rIACA=
X-Received: by 2002:a05:690c:a786:b0:873:5bb2:6c37 with SMTP id
 00721157ae682-8ae94efdc33mr12232817b3.62.1791133641779; Sun, 04 Oct 2026
 10:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260908135319.754140-1-julius@bairaktaris.de>
 <20260908135319.754140-8-julius@bairaktaris.de> <CABkEBKa0pEB9cL1+yoOF0OQSkYb7T1ji36oJ3sVYYV+Nc-_dcg@mail.gmail.com>
In-Reply-To: <CABkEBKa0pEB9cL1+yoOF0OQSkYb7T1ji36oJ3sVYYV+Nc-_dcg@mail.gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 4 Oct 2026 17:06:46 +0000
X-Gm-Features: AclHuK-EedBupHUek5v73mxQfgY0Ojo9131n1X7zqgfDB2Zu8K3FpAglHH7v6fQ
Message-ID: <CAC1t37+c3WG8SDLkuK6qzYj1Af0TSGS=5eNwCnGhKPooAys1Zw@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 7/9] wifi: ath11k: charge received airtime to
 the station deficit
To: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, toke@toke.dk, 
	sven@narfation.org, quic_vthiagar@quicinc.com, john@phrozen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_100723_849858_33C598BA 
X-CRM114-Status: GOOD (  26.51  )
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

That's true, I will incorporate a fix in v5.
Thanks for looking into it!

Julius

Am Di., 29. Sept. 2026 um 16:11 Uhr schrieb Tamizh Raja
<tamizh.raja@oss.qualcomm.com>:
>
> On Tue, Sep 8, 2026 at 7:23=E2=80=AFPM Julius Bairaktaris <julius@bairakt=
aris.de> wrote:
> >
> > mac80211's airtime scheduler is configured to account both directions:
> > local->airtime_flags is AIRTIME_USE_TX | AIRTIME_USE_RX, and
> > ieee80211_sta_register_airtime() adds the received airtime to the same
> > deficit the transmit side subtracts from. ath11k passes zero for it, so
> > an access point serving a station that mostly uploads charges that
> > station nothing for the medium it occupies, and the deficit that decide=
s
> > whose queue is served next describes half the traffic.
> >
> > Register the duration the hardware reports for each received PPDU. It
> > arrives in the RXPCU PPDU end TLV on the monitor status ring, which is
> > subscribed for every radio, and ath11k already accumulates it as the
> > station's rx_duration. Charging it once per PPDU matches what the
> > transmit side registers, whereas an estimate rebuilt per MSDU counts th=
e
> > preamble and the interframe space once for every subframe of an
> > aggregate.
> >
> > The PPDU end user stats TLV that names the TID is not in the default
> > monitor status filter, so the airtime is charged to best effort, the
> > access category the deficit arbitrates the bulk of the traffic in. The
>
> This means the resulting fairness accounting is only an approximation
> and can leave VO/VI deficits
> uncharged while accumulating all received airtime against BE
>
> > call is made after ab->base_lock is dropped, under the rcu read lock th=
e
> > loop holds, as the tx completion path does; base_lock is contended by
> > every tx completion. A PPDU from a peer with no station entry is not
> > charged to anyone.
> >
> > Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> > ---
> >  drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wire=
less/ath/ath11k/dp_rx.c
> > index 68472e1e748a..a7b9bb295728 100644
> > --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> > +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> > @@ -5270,6 +5270,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k=
_base *ab, int mac_id,
> >         struct sk_buff_head skb_list;
> >         struct ath11k_peer *peer;
> >         struct ath11k_sta *arsta;
> > +       struct ieee80211_sta *sta;
> >         int num_buffs_reaped =3D 0;
> >         u32 rx_buf_sz;
> >         u16 log_type;
> > @@ -5324,6 +5325,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k=
_base *ab, int mac_id,
> >                         continue;
> >                 }
> >
> > +               sta =3D NULL;
> >                 rcu_read_lock();
> >                 spin_lock_bh(&ab->base_lock);
> >                 peer =3D ath11k_peer_find_by_id(ab, ppdu_info->peer_id)=
;
> > @@ -5337,12 +5339,25 @@ int ath11k_dp_rx_process_mon_status(struct ath1=
1k_base *ab, int mac_id,
> >
> >                 arsta =3D ath11k_sta_to_arsta(peer->sta);
> >                 ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
> > +               sta =3D peer->sta;
> >
> >                 if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr)=
)
> >                         trace_ath11k_htt_rxdesc(ar, skb->data, log_type=
, rx_buf_sz);
> >
> >  next_skb:
> >                 spin_unlock_bh(&ab->base_lock);
> > +
> > +               /* The airtime a station spends transmitting is taken f=
rom
> > +                * the others, so its deficit is charged for it too, wi=
th the
> > +                * duration the hardware measured for the whole PPDU, a=
s on
> > +                * the transmit side. The TLV that names the TID is not=
 in
> > +                * the default monitor status filter, so the charge goe=
s to
> > +                * BE. Outside base_lock, which tx completion contends =
for;
> > +                * sta is held by the rcu read lock.
> > +                */
> > +               if (sta && ppdu_info->rx_duration)
> > +                       ieee80211_sta_register_airtime(sta, 0, 0,
> > +                                                      ppdu_info->rx_du=
ration);
> >                 rcu_read_unlock();
> >
> >                 dev_kfree_skb_any(skb);
> > --
> > 2.53.0
> >
> >
>
>
> --
> - Tamizh.

