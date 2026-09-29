Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA65CA5FA7
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=; b=0UdbzjKqC19TaDR4EC3os+AO5x
	wpt2sHZsNJFoQQajjH1VyPUhcZocBQan1iRUPlDa4FPEd/kjuIcrr7M84t0c58cZdRLxkLyC9a7on
	vwJF/NQBlW/UWBCCoeR8OGcvkyhDEorVg+KhWLbORxVa7vdLy5ix9k6+RnGYqbw/jonq9ErM1RbNN
	oajoLBTo0vYp+MwuoHPUjOUVAdIySzAJjcrUV8eHQAS99RKUlG7txwRNiSAgzCZXr0Jj4N/be6o2r
	tlIsSjW8mYlaTdKJ8nnIuZokgwC7ICM0OotmaJKzwBRhCuGEbhNYzR1aWySMLXB1bieQ+kAK9dHlQ
	FlYa1XzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaQZ-000000041ML-2VHB;
	Tue, 29 Sep 2026 16:11:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaQW-000000041Ll-40nT
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 16:11:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqbsY1576957
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 16:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=; b=Aj2nl+y8KxtWdZE8
	+qdWDHad+Yi+SRNY2tyW37v7NRHV40tbQ4W6w29fTc8h2v0ACAVrfb7Nkvf+d0rN
	j1iq7IHb46ANIldXzXrKNalw9oGs6MqP6TGQ9SJpy4HRTZgtVNiF+BFS0lwSob2I
	T78u3XDpUIc3+9BFL4M4WETWd6XvJGf1e5rTP/sARa+ic8ty7ykoJ/b2BrbOryP+
	GmqDDItZtcRwItmz+bNX0xsTHiC83eW6gjT2djkivcdMeFBeTwXr11J4Njtci3oe
	raysUqpFEJfjB2uDyXUFckw2igIoBcK4qQxw+GVaX2wb74JSWsGJmMSMbXGRXOUD
	WLFDEQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4t012-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 16:11:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342daef97efso403303eec.3
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 09:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790698291; cv=none;
        d=google.com; s=arc-20260327;
        b=C8o80DTfaHqVy7OidEzXr2ldHjjIUegU2PLN9cQJYClQTE/CBdoFZyfXv4aC6NtBq8
         8DTYMeBsE5x2qDQWE4XDA1Lap1V8GDxsSksdSROK5MCj0pg1Z8tOfZzNknYxcy/LXLZc
         VhSOhPhsGgnBtOYd61r1MgLz3m1cPRhS1poFhEKURMSno3l8LkA0MPqtGf9dAJSbJyB1
         kSQ6QyyFcouyz695DPgalabmj1vW3UIUxrJLltR9a9oKB9M42icGkfHFWDCehso822+U
         njN/O8JO4+KhU3ofRWhhCegx4SzK1G5FBQ8vcR7WKJk+yEzXZEap0MdI53w68PgRsrWH
         Q5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=;
        fh=/csExs+HeIC97b6xzOfYQl7FmhC55S9dNCldMJqFbqc=;
        b=YcB81WSB1K4tlFGtnyV9yHZocD9EdOc+lIF18YCs5JhQZ1RkG0d7ac4WR5DPM7OVIX
         K3fqHuL7p2KZd0dUfY7VvBTKAqgDjeUiIluwdVaPhRtZ9x7E6ttW8v8gHVKXqXE3bH3t
         z0/cKfIaHx+gKP5USlWdyC66AvvdYmkndiFAmoRW6HwFwnC+a95e/YTMRcst3t3MPhbv
         vEUwwBkYI8Wla3utYC6w20puMEZ8Rye7Ye83xWocUgXQuNsj4NV2a8aVXRkERwLNxCgS
         5kL6TobomRMbye7X4JoDXfS6OIDktVzdvAE1odsv74P+ETICVhIR9QBZ5wTGRE5zDRGA
         gvYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790698291; x=1791303091; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=;
        b=Y4c7qyEaydRI0ncF6yzt1y+GjIXBNY6uVeqcCqM9Ma43b+D+1l1gO2foQgInzRqEv/
         ZqK+bm0AE/tbZ1qGUJfZyxAQfwMD4b9fz5l7SwtEmiGbXGzpsP9ZYuo+YJckXH2O2Mra
         q7Djm8d+BbJt5sovxkU3JcQZYD88O+MQ1IhdHae9STuI9NrLhVEjWx9P/y5UfhaXUay4
         ZWK7026VZl29kGUut2M89LOhe7/OA/EXvZ1axvflpcA6xjUOFnBbLgb2prOLZpYS/0n8
         pJYrIhw1rQ8v6LHM5tVtDE9Eky9CkwnWH+giPozcDa8bAqhCuM5p277K5mRoAD9YPKPI
         6Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698291; x=1791303091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=;
        b=1RTc4RhGhWyxJRzlLB1uerO44tB6TBeAGmRyz3pbIWTpfZ596iFHEWY3H9hutPA3mG
         jWmP79qQk4VLRvrb94KkIVjx/f+veAaWopUIIBSQct5byxuenJD8/AvLe1aa08o9oETd
         8Ne5rxlnxBJYnwJIBTlDhI87EUQl++IMeJPkgaBGXkx3Un/jwZqllLY3H7kW8xHWs/OJ
         soRw9KWLOSGReJbFFVqgbcWtdNJYQR4WapPICaDlWwCLZ0G/yjY0xyFXlpknJ/KJNLG9
         Zq1V3JU3C8wLU3CVYUU7jYK5WnVUfxpiwAyPfbHTaCTp7UEGGhDkO/xgRd4TI5zSXTWZ
         cHXQ==
X-Forwarded-Encrypted: i=1; AKwUvByys65VawyIeNBqDwtR4/XKzI2bcOBFWpsjkAgMdK7SKTTX5d8Y+X+0GS1Z0XhjdrDRZ7je7Ps=@lists.infradead.org
X-Gm-Message-State: AFuF++llC/2qLp3GO1dhVPQ8X6ELzxXrJhHq8x+xMZEFLlr0nj4j70Fc
	vR6ZVtGa6ijXhD8z9XZh8mek9jJ7hLDxQBl7e1VULh/bJNe1CRU9BfCznm6UctwNkS3QNeEfnTi
	3l2nWi/whsdGRgMPGAA4Iv73uEZLlgmS6pdMjnywomhMxfHLGdZ7V6Wz6+gp60I02V4xGZH9oC6
	n3y+IFDsNBs7d9Dsp4tZUicsFoo2hLCm3Cv+Yn04E=
X-Gm-Gg: AYBFou2lgzdH6DYqFMgOJ/0CzKtIR3XQTRQgiq8S1McDcKHFCO9C06OPB6c6juVp49v
	dXukUVHUwo8yoa5gxfPSf4JXtQU8XBtANhNuqKLKMFd/FQLNL9MYzwZGeJZmmLtdqpipq5DBcFw
	xiTzU3oFA/4yREnkeKUa3GPAP0GK5pl1F0XUcfjxT4RVam0j1p0RSI7U3DQdI+OVYTm28L/KJ3w
	6706hBBVATttN3zqUE=
X-Received: by 2002:a05:701b:4542:20b0:139:81c6:67a1 with SMTP id a92af1059eb24-146cf7ee6efmr21646720c88.1.1790698291185;
        Tue, 29 Sep 2026 09:11:31 -0700 (PDT)
X-Received: by 2002:a05:701b:4542:20b0:139:81c6:67a1 with SMTP id
 a92af1059eb24-146cf7ee6efmr21646648c88.1.1790698290460; Tue, 29 Sep 2026
 09:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260908135319.754140-1-julius@bairaktaris.de> <20260908135319.754140-8-julius@bairaktaris.de>
In-Reply-To: <20260908135319.754140-8-julius@bairaktaris.de>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 21:41:19 +0530
X-Gm-Features: AclHuK8I2Y8Z38X2skQxxlHpAPaU8tbrT2ff2ker0EVsU01MrqsPdyvez8x7uGI
Message-ID: <CABkEBKa0pEB9cL1+yoOF0OQSkYb7T1ji36oJ3sVYYV+Nc-_dcg@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 7/9] wifi: ath11k: charge received airtime to
 the station deficit
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, toke@toke.dk,
        sven@narfation.org, quic_vthiagar@quicinc.com, john@phrozen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfXxePCK2N22LtE
 /amrYju3SFl31DfQ8479njvyVTwH3LD4DZnr7q7X6mhXpykzmSb4oaaxfAC+l4Y8RjPcVHwxfzk
 l91gv7pQQAbeJ4s2chR1QqMClx2hOCI=
X-Proofpoint-GUID: TlE-7hLrF36qUMfKjPThyPA-0H1aknsT
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbe334 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=ISQwfr-Fe-Q9zp4uqk8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: TlE-7hLrF36qUMfKjPThyPA-0H1aknsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX3+rLE0XI5/RY
 uJGjBLwxsTA42+AV2C4xxhl1Cfp9u9E18Pzb/+hZsSjFBWYTX7J5UKZtD5DFkLhRXMpmRLIacLh
 oxTYR1qXEz5GnObqBn6Mj+uCO6X2iaPDI/n4nnIyQx9vnIzD4IDO2nraA2syGu2pAXS6m21PfKT
 MhdMYGQdHg3vNCbt8bbPPFGjHOVo5nuSv3qhNcZRfAl9j1v8bhIReB9SVqPEHFbPb+3ArEjfNhE
 zXYfBiOrg/ScVgv0c2zPT1yOL2X93GtK78YATCBsr/BWlBSkxAFJlm/W35DjamRDHNISIKagWCM
 DZzWGbvkaU0DN34XQ1T11H57c42Iu9kOmziiGEhbX1IBZ4E3n3WdmOYJOkDiPxCPPb4s3QwNyNT
 4H7tXhxtbLEDEJSCueenaABMzHbI2I0+ysq7JnZhDuGIPGJaHCqkscUvyl6Ry/xo1F/odwfNhlU
 8JXvUHpckB0K0xOFF+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_091133_000477_C38973C1 
X-CRM114-Status: GOOD (  27.29  )
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

On Tue, Sep 8, 2026 at 7:23=E2=80=AFPM Julius Bairaktaris <julius@bairaktar=
is.de> wrote:
>
> mac80211's airtime scheduler is configured to account both directions:
> local->airtime_flags is AIRTIME_USE_TX | AIRTIME_USE_RX, and
> ieee80211_sta_register_airtime() adds the received airtime to the same
> deficit the transmit side subtracts from. ath11k passes zero for it, so
> an access point serving a station that mostly uploads charges that
> station nothing for the medium it occupies, and the deficit that decides
> whose queue is served next describes half the traffic.
>
> Register the duration the hardware reports for each received PPDU. It
> arrives in the RXPCU PPDU end TLV on the monitor status ring, which is
> subscribed for every radio, and ath11k already accumulates it as the
> station's rx_duration. Charging it once per PPDU matches what the
> transmit side registers, whereas an estimate rebuilt per MSDU counts the
> preamble and the interframe space once for every subframe of an
> aggregate.
>
> The PPDU end user stats TLV that names the TID is not in the default
> monitor status filter, so the airtime is charged to best effort, the
> access category the deficit arbitrates the bulk of the traffic in. The

This means the resulting fairness accounting is only an approximation
and can leave VO/VI deficits
uncharged while accumulating all received airtime against BE

> call is made after ab->base_lock is dropped, under the rcu read lock the
> loop holds, as the tx completion path does; base_lock is contended by
> every tx completion. A PPDU from a peer with no station entry is not
> charged to anyone.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wirele=
ss/ath/ath11k/dp_rx.c
> index 68472e1e748a..a7b9bb295728 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -5270,6 +5270,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_b=
ase *ab, int mac_id,
>         struct sk_buff_head skb_list;
>         struct ath11k_peer *peer;
>         struct ath11k_sta *arsta;
> +       struct ieee80211_sta *sta;
>         int num_buffs_reaped =3D 0;
>         u32 rx_buf_sz;
>         u16 log_type;
> @@ -5324,6 +5325,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_b=
ase *ab, int mac_id,
>                         continue;
>                 }
>
> +               sta =3D NULL;
>                 rcu_read_lock();
>                 spin_lock_bh(&ab->base_lock);
>                 peer =3D ath11k_peer_find_by_id(ab, ppdu_info->peer_id);
> @@ -5337,12 +5339,25 @@ int ath11k_dp_rx_process_mon_status(struct ath11k=
_base *ab, int mac_id,
>
>                 arsta =3D ath11k_sta_to_arsta(peer->sta);
>                 ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
> +               sta =3D peer->sta;
>
>                 if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
>                         trace_ath11k_htt_rxdesc(ar, skb->data, log_type, =
rx_buf_sz);
>
>  next_skb:
>                 spin_unlock_bh(&ab->base_lock);
> +
> +               /* The airtime a station spends transmitting is taken fro=
m
> +                * the others, so its deficit is charged for it too, with=
 the
> +                * duration the hardware measured for the whole PPDU, as =
on
> +                * the transmit side. The TLV that names the TID is not i=
n
> +                * the default monitor status filter, so the charge goes =
to
> +                * BE. Outside base_lock, which tx completion contends fo=
r;
> +                * sta is held by the rcu read lock.
> +                */
> +               if (sta && ppdu_info->rx_duration)
> +                       ieee80211_sta_register_airtime(sta, 0, 0,
> +                                                      ppdu_info->rx_dura=
tion);
>                 rcu_read_unlock();
>
>                 dev_kfree_skb_any(skb);
> --
> 2.53.0
>
>


--=20
- Tamizh.

