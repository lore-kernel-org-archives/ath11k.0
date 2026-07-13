Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590A8C44507
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=; b=wsPpLHEg1GscdYOf19MvaDgY51
	YFwAgBUV31Dz1LHqXVtpu1Hsi/RGtb/rR6S7Nq3lhu/zLV64iSIDZrOZsgHF31Ohjvi1iqK6DjiuG
	7xg7MMcAVZO94G+/D0c+ZyKSTxX/hodvGcnFYYrdTKHFV5mnUOwO6wJWsLl+w1twyagv9d1ZLMKgY
	4/wgmMpepdrz0m/UT+VgcxJM3ffDkahnCV3RAi2KV3EZ3BG9rP9SHKtwIp1bmt63pTFbGqhj6LUr+
	wB2FhpRHFYgcqNPr8kYontkezWYisDzc7/Aif8KAUwnRHulKd7hJwh48PKXs3MUJ+HSEGMUpeji5L
	kUGnqgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK6c-0000000A4br-2fDo;
	Mon, 13 Jul 2026 17:06:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK6X-0000000A4a1-0CgC
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 17:06:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8JfB1860720
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 17:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=; b=l9cpGty44rYnBmQd
	CpGqfJgd3s2WwkUQcmF36AN77AeUJC9OQsooppQLOa3AhlRPpipW3Ncvip3r04+3
	RJXso6KMeWwwUqY3b84P7X608OZYXGKRxrvqhQHAJ72Hi3qAgz66mxh+BqyokT6S
	HpSGl8esY9eNz0053mFi6TksvdRX+pRA60FCDWbhs7QJ4czV1QijQG68rynHIBvs
	LRIS42eiWdpT46eG8t/zhpXjPnmHJQUdy3NvdXk+h/22SDAjDl09MK11YeMf80zE
	eq3rTL/cL93ay69LkBCE3/pJPi5QfbyJy5rdouFhrRf9eFfZwai06gWh5fDxVVnq
	wgLWHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj02c3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 17:06:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-387087245e4so1186095a91.0
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 10:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783962362; cv=none;
        d=google.com; s=arc-20260327;
        b=ENXrUdkX40ca8pHqqhlWelbCy8mUjZGP9IG4I7r26n9V5U2nYm2tiMUoFlWamfkHsw
         ZnmwIINP8ToqvAAwwTXEWMkGIXj9FDY8BxPeExu4pjaFUKWOUmGjXONcpFVD8D/azpy6
         T4s4mvfg7sainkQW9s6gtbv4W80NT5WqhwAialetECmu7z8AnTU3Su/AxtKyCUW2t9Ed
         LzTUEqaJrVBQO3C6xStGaSskemqIUqvCPHktxWPtMH8Ei6gRXZkj2j13bQ4KT/3oOJcl
         EUhpBZF0ab6i6vuYAO04mCiFghpm/3wNH8SXD/xOhDCebioB8tIYLpHVeU+Fbud7gJxO
         gxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=;
        fh=khpiQcMEfiAIvVs0FXTwPFhcVqOlCuQBeV0e9ETrg2E=;
        b=Utvz9GYlZASkTVKt0N6NvsXb4QZWXKT4S5r8ka/nXGijL1kKCAM1+Rr4OPxK2/T1rD
         gYA/g/8tmHSubcAW7jvqp1VX/gBfoAScpj4xQMy6FDlAW+K5wQlw487F8SQ5Us1TdARn
         G9i4Fs5BKTyX/zSrg3lpMBfauRzHYIEdlkCXa5oSBmDevfhIxh5OXAuvmCk+McOqqs8R
         esy7lQC1Shv8B9LqLrEhY6IzU9BTP/m1By1tnigE5lhl/jyzOTtMj52YciQvGaXlgKav
         KoHnBrFjnPV1WBKRZFqs2KZovMRHk/fF++cq7GPlAytKsfv4Sp3pI2/0SiPRPdxkBRbn
         R90g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783962362; x=1784567162; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=;
        b=UOnvmST+BrB53zEKym6EHFGeUF07MuvgVXwBxT8XvIprR9NZQuuB3NeGa2V7L8p2bc
         DFLBaWYx50jZ3I9CPGjjOGlMa2sdpvEN4z5TnEvHNlkXc2sL+N6UUV7Y/zOoCkkwk49A
         YHEH9iHoMUttSwjeaLbXLzTqgjQduNX+FC3CHbROq06ljYNmL0Fi0WSlo1BEy5W+fc/K
         8L9wkDxrWqcClYMv51aBqW/qAm/etBG5ENahBMewbL3bRp5L0AB+I2OEkVAlAFNjTZ6b
         64R1wsa1eM3f/ZkTpeLv5rp/YgurolhzBM3ZpGcdU2sp23RtkL6uYo5vBXInFOpJk26N
         NFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962362; x=1784567162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SyzZ6EPMaoE03KHkavFTA6TatdreHGVofNf2BUFYTg=;
        b=kANbNeZLuZujo9DkfpZukGSu57j+K8yZ2PgZH6DHAstt17Yt1RhVRbvl8vTw68bbsH
         JsoaVlgH2NgwJfAA0XKzlWbpotJ2FC0mGJcr+V5TV9jo05n2EX/lbUudQ8D1WShUhsjb
         4KfjW0MxVAocvcDJ9uLFx0tvU1Vxih8wcXly+/0Z1NgPDQS47bFIbT1NOj+5B780UXD7
         4zpvvWcMU9i76GV5WBJu4TkW+b07cflKOYwO/ONOhOC9ch7XQTxoJebhv5jAG6RYz923
         dLR9uDXj+nnoCo/LQnlvrDsrROTSckis3Gy8hLe2oyA6oflJigYTM2YZH1txqbYFO2Ud
         2AIQ==
X-Forwarded-Encrypted: i=1; AHgh+Roz1SuJfAKINEk8V/kByTbIvtMntIluNiaP+ryV3YmoY/0yiDqk8nYj4d9V3D/UBUwbyFK/0Aw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaMPZwtOPMJztakyyRPcAMC9XgJKWGOarwQFN8nv5pSLaTyLlT
	EwS7adYpxtrHIDa0+ByMIcvbuacjldHGMftY665gcU+7mfn6SX50p+6JsVQfSHTYw9WB50ORh3k
	QGIExqmCE7IEKhnsPtPvlYXopgLy92XhNbFGmgcWG0vwE4+PQUm7Au9vTekGn572ny0u9GRacnQ
	UQ4welLd+4lO9eDTYdpZIvdQcDgI51PuSDS2duzzU=
X-Gm-Gg: AfdE7cm/EiuBSACvTyibeR1bWNuUQSHMboHtS9n8GC+3tmsf49sat3QyM0fei6zLBVj
	r0vOdqmL9mj93+zFh5MNflsh5KK2vtngEwJE1QQCa/sWmXphM0SvwpdndtGQDTRvl0HPXoxPE2u
	4KZdRyazbkjkPMJQA7/EWaoRajs7CNf1kNXAqwCldT5sTbQgbkwlmjIS4xNd52PbUlcDmrO248W
	thE4f6QadEEAiS5RtcSBq+0gQkUhQ==
X-Received: by 2002:a17:90b:51cc:b0:381:6cf0:d5f5 with SMTP id 98e67ed59e1d1-38dc780f503mr7747515a91.5.1783962361887;
        Mon, 13 Jul 2026 10:06:01 -0700 (PDT)
X-Received: by 2002:a17:90b:51cc:b0:381:6cf0:d5f5 with SMTP id
 98e67ed59e1d1-38dc780f503mr7747489a91.5.1783962361387; Mon, 13 Jul 2026
 10:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260710155443.1761760-1-jtornosm@redhat.com> <20260710155443.1761760-3-jtornosm@redhat.com>
In-Reply-To: <20260710155443.1761760-3-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:35:49 +0530
X-Gm-Features: AUfX_myqBTA6Al-ASglZ6zXCxWVTaIWJ0S_u-PpqBDiSUnLkbGESlFGPZnjNZcY
Message-ID: <CABkEBKZABhFkS9MVqbeRFHLUXoNaJC-qocmcPVmZ8ov2j+DMzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE3NyBTYWx0ZWRfX4iqEszgaEWPx
 PbDdXDaasyffanv/72pSIQwWUiDLJwQ1rH7NRquSFXI1N87+GOvY5MzRaynbVLhcTJLVJbvnQWd
 FxzZEfPWOErbgK31NoNwn9WjZmu08J8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE3NyBTYWx0ZWRfX7sgK7qAKJsEV
 nCP8I55QRQm4XGhA+nX2lOTlhI5jWoKfXh/jzp9v2zDYbx2Ubvp2AwaqeRf0OVrXiShj65Sh5xY
 p2p/Xh+fWI9YbGUH0vi3t4Det3RYmLHstPrLS8VjA7aEdqOUvaHC3KFuze7oVbAkfMYa4Ptmd65
 CLG6rG/VM774vABxymV3aM6VEoro8iq2wZ1tirLSzzc8b1RcNQghSaHqBH3txezzdcROXzwblyk
 uxyoqXKX5uWlbKyfVE2z7OBHnsN0ZoyM5Yi63e4ynneaNORpVhQ+/IbV5BY2dQnihSHbmZ25fvQ
 gar/P26uf6jHoYxnfcUk5l3ZkRHs2X8Boc71JPPO9vfxjDrfOWDJj8VFJSdDAmApy9nJQF0TkHx
 SqBRiA7k9kqoi6FYa/IH1ExFh4GsO2JYmAtzqKE0UoXdU8D1KjViLUsVL54ujrf45StHw3XrbMX
 DJBHT4p93Z3AKdmK0QA==
X-Proofpoint-ORIG-GUID: KUzft9VNOFkq7_iR_yUwUPP08_WBHH9Z
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a551afa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=20KFwNOVAAAA:8 a=6vpvkDlHG3n5nyPZv6IA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KUzft9VNOFkq7_iR_yUwUPP08_WBHH9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_100607_604465_3DCE08BA 
X-CRM114-Status: GOOD (  27.64  )
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

On Fri, Jul 10, 2026 at 9:25=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Under heavy traffic, ath12k can hang and experiences -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> This issue is more commonly observed in VMs with PCIe passthrough but
> also occurs on bare metal systems.
>
> Implement a custom wake_tx_queue operation that:
>
> 1. Checks hardware ring space before dequeuing packets from mac80211
> 2. Uses per-packet locking to serialize ring access and prevent races
> 3. Syncs with hardware state to get accurate free slot count
> 4. Returns early during firmware crash in the same way as other tx paths
>
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath12k's hardware ring architecture.
>
> This prevents hangs, eliminates -ENOMEM errors, and improves throughput
> by optimizing resource usage and preventing unnecessary packet drops.
>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.c       |  1 +
>  drivers/net/wireless/ath/ath12k/dp.h       |  2 +
>  drivers/net/wireless/ath/ath12k/hal.c      |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 50 +++++++++++++++++++++-
>  4 files changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/=
ath/ath12k/dp.c
> index af5f11fc1d84..3d46cfbf0a1c 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1539,6 +1539,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
>         }
>
>         for (i =3D 0; i < ab->hw_params->max_tx_ring; i++) {
> +               spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
>                 dp->tx_ring[i].tcl_data_ring_id =3D i;
>
>                 dp->tx_ring[i].tx_status_head =3D 0;
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/=
ath/ath12k/dp.h
> index f8cfc7bb29dd..68d2020be9b8 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -58,6 +58,8 @@ struct dp_tx_ring {
>         u8 tcl_data_ring_id;
>         struct dp_srng tcl_data_ring;
>         struct dp_srng tcl_comp_ring;
> +       /* Serializes wake_tx_queue operations for this ring */
> +       spinlock_t wake_tx_lock;
>         struct hal_wbm_completion_ring_tx *tx_status;
>         int tx_status_head;
>         int tx_status_tail;
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless=
/ath/ath12k/hal.c
> index a164563fff28..c1c656e4550b 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -390,6 +390,7 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *=
ab, struct hal_srng *srng,
>         else
>                 return ((srng->ring_size - hp + tp) / srng->entry_size) -=
 1;
>  }
> +EXPORT_SYMBOL(ath12k_hal_srng_src_num_free);
>
>  void *ath12k_hal_srng_src_next_peek(struct ath12k_base *ab,
>                                     struct hal_srng *srng)
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wir=
eless/ath/ath12k/wifi7/hw.c
> index d9fdd2fc8298..e3a6f9cdee24 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -1100,9 +1100,57 @@ static void ath12k_wifi7_mac_op_tx(struct ieee8021=
1_hw *hw,
>         }
>  }
>
> +static void ath12k_wifi7_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +                                             struct ieee80211_txq *txq)
> +{
> +       struct ath12k_hw *ah =3D ath12k_hw_to_ah(hw);
> +       struct ieee80211_tx_control control =3D {
> +               .sta =3D txq->sta,
> +       };
> +       struct ath12k *ar =3D ah->radio;

This assignment is wrong and all traffic is incorrectly steered to
radio[0] as ah->radio is a flexible array, not a pointer

> +       struct dp_tx_ring *tx_ring;
> +       struct hal_srng *tcl_ring;
> +       struct ath12k_dp *dp;
> +       struct sk_buff *skb;
> +       int num_free;
> +
> +       if (!ar)
> +               return;
> +
> +       if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags=
)))
> +               return;
> +
> +       dp =3D ar->ab->dp;
> +       tx_ring =3D &dp->tx_ring[txq->ac % dp->hw_params->max_tx_ring];
> +       tcl_ring =3D &dp->hal->srng_list[tx_ring->tcl_data_ring.ring_id];

tx_ring/tcl_ring selection should be corrected.
> +
> +       while (1) {
> +               spin_lock_bh(&tx_ring->wake_tx_lock);

Do we need this spin_lock_bh?

> +
> +               spin_lock(&tcl_ring->lock);
> +               num_free =3D ath12k_hal_srng_src_num_free(ar->ab, tcl_rin=
g, true);
> +               spin_unlock(&tcl_ring->lock);
> +
Do we need this check and spin_lock here? already ath12k_wifi7_dp_tx()
has this lock and fetches the next entry. Can we check those return
value here and break the loop?

> +               if (num_free =3D=3D 0) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               skb =3D ieee80211_tx_dequeue(hw, txq);
> +               if (!skb) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               ath12k_wifi7_mac_op_tx(hw, &control, skb);
> +
> +               spin_unlock_bh(&tx_ring->wake_tx_lock);
> +       }
> +}
> +
>  static const struct ieee80211_ops ath12k_ops_wifi7 =3D {
>         .tx                             =3D ath12k_wifi7_mac_op_tx,
> -       .wake_tx_queue                  =3D ieee80211_handle_wake_tx_queu=
e,
> +       .wake_tx_queue                  =3D ath12k_wifi7_mac_op_wake_tx_q=
ueue,
>         .start                          =3D ath12k_mac_op_start,
>         .stop                           =3D ath12k_mac_op_stop,
>         .reconfig_complete              =3D ath12k_mac_op_reconfig_comple=
te,
> --
> 2.54.0
>
>


--
- Tamizh.

