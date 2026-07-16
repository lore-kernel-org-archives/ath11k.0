Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A276FC44501
	for <ath11k@archiver.kernel.org>; Thu, 16 Jul 2026 01:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=; b=QOnEMe00Ruk4C3WaqgQ8xldJ6G
	/Q6FBI6YvM2az7rH7WPaiL1QAQPqd6CkoTwkdzBLFOCRrlnNnGC/25ikYtPohQHriqIdZVyDe0Ve5
	k16+hRu2+vIDpZoQu2Op07o3pFv55+eVA2xzbOTTV/ST8AJoFO7TyCF8RG+bp7rUYdwyGKJnRbYLA
	fp6N+C1L5i8EnDebgKTYYR0W6CIT47JuRBxQiUno2L2F/fZxbYzST/Pa2XKRaHUTzz3guSlN1XIUT
	HVdFJGKw7BBS0f7ozXsvRnFux+r+Elxuc7q1DJcVuHZtPNMPdemIg09swgu1pFxhHyH7MWQrCDiR9
	zWZTRQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBMB-0000000GEIm-0d8H;
	Thu, 16 Jul 2026 01:57:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBM8-0000000GEI2-2lhX
	for ath11k@lists.infradead.org;
	Thu, 16 Jul 2026 01:57:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0Xf12967221
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 01:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=; b=eC/gUW6tCgDbZDyM
	v9NCuygzxPGI9CJ2e1fdQemuN0QQWuF7aWk5MoBNjQdZ7FtRrCyE7dDY2u3sqqca
	sbkLRcKZZbHKfcIS6LPjMoFi8GOVUukK5mfxwE+qcNa+9RnD4LwRaAVg12ysDR+S
	nzk79Sl11jugfrQukPXbGR4Clifl9itiIg9CC5u3M9kAQqpY2JCZgvQOpaesHzL7
	kAcg+p0oJNzOMNsRocSml1dFXUj7AeBu9oDTNZvPXi9m18aS9B993P+ky9x6W/YC
	dWMNsywj8sERF5+NTk53Qhn5CDhf6zjLCMfx8cw4kiSIdS+fi6KP7k5++VqFwBrI
	Cd9DiQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kabmar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 01:57:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380f3670853so1862590a91.1
        for <ath11k@lists.infradead.org>; Wed, 15 Jul 2026 18:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784167063; cv=none;
        d=google.com; s=arc-20260327;
        b=aEH1tHPt4cCLi92TI7WNI6YGsbmDGzU8fX8IuJmWzFEojuXYtQpMxxYcyx+6lETstQ
         Y2DHNdFqUNmrTfOWcFY4Wo6dm1sVdVMaMylZZ/9wymndmFZDSD32ZIELW+jTMoAecZ0T
         PGOvfX8qhGTKg0lWwvBAyGDy+qs/a6s/HRWVVF3w5M5ZazibALLsUrOwtAfoHcRVYpKT
         NGYYiK6SH3xcfomO4NEqRscGq3bD/kDgewyjeKEc9fCg29hMDI9y7ysk+XUpaicn3kUW
         OT/1nhP64Za08tqzgV6sz7k8AcIq3uogM0QQc4NBbe0z4W3Ry2JB1YfWsZbd710eyMos
         ZnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=;
        fh=cftn/eqlPLcJgYn0eT/p5ltIAWamfxkCXll9W3Vkc14=;
        b=rThb8DvOCquIzLbrcrSP3uSfeg+9Ac7M8gk9qqtDZWO+MzVeqYsuSJ2gQbJEgr+QCP
         EpA2gE/0E2E/PNG02ILVPtD8i9tx/QuOuKn9JXBUrHDKOjTgwGpmNSIw+1DYe7dTJrEr
         Wpw4ARNSdaEF9k3r1J5JdIymm0xyt20nnA/H3IzARjeT9MTXArKq5xav2nAO2Kj4n3PH
         MjnszPDbm3MnlLr0K2TfccvS7hhptMzE4QCso7dnyoRiEORMM8FYxFriv2TVfcRb2oxl
         n2fRCjmghM17KgL9y9aL1Zj7attHGCbLAGN4kKzQcQGFtmeGVIMAPLB4I+/5ho0RQXjI
         BEog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784167063; x=1784771863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=;
        b=XRHtQMCg5qstW6Ce7L8vnodlwOOtytlYx+84pwj/gK11ytyHLCc99b3EI1nSg5ax9T
         2ZExsBUUUHKzbk71Nb6WHnBBTXoFeOPUSBc78qKymQ68wQNJNxV69uhHpVXNHhvxR/B8
         3n+k2uWWQFoOEuMvzFt5eO/68Kxa5rC7mfpB5b736j9bcZbAc5xFvB5JZH/UFOOvYYFp
         IZK3d3USsspOr3N6/+o+oQBQgmgvyqZ4b/aUwwK9SrW6Dnl9obPnF4sPTDO6ycAooLUn
         4fLAbQ0bQPKYjMMA32hbC9BfJiIRFjdfkf187bGaMSVwzsZ/lUpBu8aEt/PTLW4I46Zn
         nRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784167063; x=1784771863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcJOtzH5ZQPgdth/24g7ATlf0K+lEyfhd7GpxU8dSaQ=;
        b=ogqTBxhezPn2j+dtk+WeOWwdjVBWlQGW+9GJRa9U+zl97VJAz9acg6adqrh/MCruaR
         d/HYYppm0IqM3Z4Le0TPi/NtgeVKzGxRkNW/HKj3L9T17yIAIfPDOS7o7eBbE3YutTDb
         T6AlXPHY6zhPiMUtu0DSag9rvWS39d2GQSRGXlLH2P/Twn9nSP7yWxC8h/XzLVOq+Ol8
         FSf1iAV//9xbt7yrtdoJAKaElSCwKx7q4678rzyWMUNJ/5R3w0yqvdPuvyOHNfBS0V9U
         yrjSD3wZz96GKRQ6d1mptdqvOYq3RF7w4fsNC5K33aKMQ9abcypwupLHA6ost9nlI5w5
         djUg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/2ObwzLX0kjEOkLGgcCpuy8rjb9/eZ9LpTqcKtK3MmXawXliRLxv8WqEDf2JiIUlTQqpvMoE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFZxs2k/JoH7LSa5zQx8cjOZSpVoCKMu5XVwQA7p6FhRdkN91X
	c/BEwngzIu8UhC/mlTYuXp348xqIeZV6oZPquhCPTj2rzUwdC4vnQMm/vzjzBbe5FdCtfWwC30r
	KL/pPozDgA6WuCjMHiSyXMXR1l47iGanyaMkJ53dTZC5zmG8DRo2xW3rr9HREJ9isTzMuO9U11K
	1XucMwri4TlzkwmCrwBp3KC8ba0YJsiTq/mKDN7zPBAPa7UJg=
X-Gm-Gg: AfdE7cluRwrUFvMcL1YWVNjnbwj0LowqUe2+vklzDzPmqNg0FreD3LRN3p+TMGSbBjg
	Pfowa39SxtIsJNPPfrMm4kh+kJt3F6yVuG2+5A1oRqxlc3xqbhxUqNzlYuJ1nV0ID+C7XtKLODH
	PHslFGr5skODvCprKjLZ0eXuV/tdVYSmF+MbHkzQ+d16EUGTdadEpipewb9+GawZTkCW/Z7qmFA
	rV98DQVdPvjqgXnDo0=
X-Received: by 2002:a17:90b:3d87:b0:381:fa5:5217 with SMTP id 98e67ed59e1d1-38dc7848a6amr15709337a91.7.1784167063263;
        Wed, 15 Jul 2026 18:57:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3d87:b0:381:fa5:5217 with SMTP id
 98e67ed59e1d1-38dc7848a6amr15709314a91.7.1784167062784; Wed, 15 Jul 2026
 18:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260715125017.277242-1-jtornosm@redhat.com> <20260715125017.277242-4-jtornosm@redhat.com>
In-Reply-To: <20260715125017.277242-4-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 07:27:30 +0530
X-Gm-Features: AUfX_mwzFnOaWEdPGknbaBHXtvjCifI0N1LyjfWnkPVHNRa7lXOSWWzCDn6Dj7g
Message-ID: <CABkEBKa26vR52mX85t4xuZbrXz0FiRc0O_NeDFSNAQpSx=RR7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a583a97 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=20KFwNOVAAAA:8 a=M3vVt1PL3_miW-qGmNYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: umzqiQFd3rozxVV9AUHm9xwyIaII7QcN
X-Proofpoint-ORIG-GUID: umzqiQFd3rozxVV9AUHm9xwyIaII7QcN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAxNiBTYWx0ZWRfXxq2xhU4jFAJd
 RbJ+JYUIh7Z41KYrtntSaDjizRNf30KvG0tLIPtIjoDA2dYJBZnuQ0DAGGbul3PtMtEAst0We+c
 Zh+G3qA4enEtZ02cXlP93Vh5dyqFPvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAxNiBTYWx0ZWRfX9arHs4dffiXC
 lzWE+W2N2an7yHrPjtmt+Y+rxN0ZBZSdfOKx04M2hz9mvkinM7MjTiFmF4O1wOtVxm7UEpnML8o
 867iPemvqLvOch54hccIL9G1fSqz8m2TrpkvVr8Ax08rSqKTk8aL6vbnHXSfOiwhSK4bQ5y23t2
 52WxxiT55o0oaQU4qk0TD8JtuMnzvEla6Tu4zpP9cgjQB76y9492bmMBL1q/sT69+4RUQKfFnDU
 g087fj2Nspur5FoQoDUHJ5GqcE91hWe/KkRZrNJK6gb50txf3fb7rbAQE1mg298qMyVhygQlgAO
 /RHs9iMCZtUGGp3Kpadfk1rlhr10J5+6NlR+Lu7olUIHaDPV/a+9O/KbcUN/FWroL0VFYSHuQ6y
 HXylnLDdntbPNbw/IvxH5TwOcPu1qmcL2U1wmf6FiiDsX9xkmZSL7UdMs1VampesRiR7Pm6YT10
 FZ9C4ECqBqOP8OS1kOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_185744_707044_4AD7E68F 
X-CRM114-Status: GOOD (  25.79  )
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

On Wed, Jul 15, 2026 at 6:21=E2=80=AFPM Jose Ignacio Tornos Martinez
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
> 2. Uses per-ring locking to serialize ring access and prevent races
> 3. Syncs with hardware state to get accurate free slot count
> 4. Uses ieee80211_tx_peek() to determine the exact target ring via
>    get_ring_selector(), matching dp_tx on all platforms
> 5. Returns early during firmware crash in the same way as other
>    tx paths
>
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath12k's hardware ring architecture.
>
> This prevents hangs, eliminates -ENOMEM errors, and improves throughput
> by optimizing resource usage and preventing unnecessary packet drops.
>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
.....
>  drivers/net/wireless/ath/ath12k/dp.c       |  1 +
>  drivers/net/wireless/ath/ath12k/dp.h       |  2 +
>  drivers/net/wireless/ath/ath12k/hal.c      |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 65 +++++++++++++++++++++-
>  4 files changed, 68 insertions(+), 1 deletion(-)
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
> index d9fdd2fc8298..306d51da3ea1 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -1100,9 +1100,72 @@ static void ath12k_wifi7_mac_op_tx(struct ieee8021=
1_hw *hw,
>         }
>  }
>
> +static void ath12k_wifi7_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +                                             struct ieee80211_txq *txq)
> +{
> +       struct ath12k_vif *ahvif =3D ath12k_vif_to_ahvif(txq->vif);

Is txq->vif always valid? Do we need a NULL check here?

> +       struct ath12k_link_vif *arvif =3D &ahvif->deflink;
> +       struct ieee80211_tx_control control =3D {
> +               .sta =3D txq->sta,
> +       };
> +       const struct sk_buff *peek_skb;
> +       struct dp_tx_ring *tx_ring;
> +       struct hal_srng *tcl_ring;
> +       struct ath12k_dp *dp;
> +       struct sk_buff *skb;
> +       struct ath12k *ar;
> +       u32 ring_selector;
> +       int num_free;
> +       u8 ring_id;
> +
> +       ar =3D arvif->ar;

Shouldn't we check the link_id for fetching proper arvif? this code
always chooses deflink ar and dp for packet transmission.
This needs to use the same link selection logic as op_tx.

> +       if (!ar)
> +               return;
> +
> +       dp =3D ar->ab->dp;
> +
> +       while (1) {
> +               if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH,
> +                                     &ar->ab->dev_flags)))
> +                       break;
> +
> +               peek_skb =3D ieee80211_tx_peek(hw, txq);
> +               if (!peek_skb)
> +                       break;
> +
> +               ring_selector =3D dp->hw_params->hw_ops->get_ring_selecto=
r(
> +                                       (struct sk_buff *)peek_skb);
> +               ring_id =3D ring_selector % dp->hw_params->max_tx_ring;
> +
> +               tx_ring =3D &dp->tx_ring[ring_id];
> +               tcl_ring =3D &dp->hal->srng_list[tx_ring->tcl_data_ring.r=
ing_id];
> +
> +               spin_lock_bh(&tx_ring->wake_tx_lock);
> +
> +               spin_lock(&tcl_ring->lock);
> +               num_free =3D ath12k_hal_srng_src_num_free(ar->ab, tcl_rin=
g, true);
> +               spin_unlock(&tcl_ring->lock);
> +
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


--=20
- Tamizh.

